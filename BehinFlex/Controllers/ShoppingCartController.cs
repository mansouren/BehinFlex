using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BehinFlex.Models;
using System.Data.Entity;
using BehinFlex.Classes;
using BehinFlex.Models.ViewModels;


namespace BehinFlex.Controllers
{
    [Authorize]
    public class ShoppingCartController : Controller
    {
        behinfarazEntities db = new behinfarazEntities();
        // GET: ShoppingCart
        public ActionResult Index()
        {

            List<ShowShoppingCart> shopcart = new List<ShowShoppingCart>();

            if (Session["ShoppingCart"] != null)
            {
                List<ShopCartItem> shop = Session["ShoppingCart"] as List<ShopCartItem>;
                foreach (var item in shop)
                {
                    var product = db.Products.Find(item.ProductId);

                    if (db.Discounts.Any(d => d.ProductID == item.ProductId))
                    {
                        var discount = db.Discounts.FirstOrDefault(d => d.ProductID == item.ProductId);
                        shopcart.Add(new ShowShoppingCart()
                        {

                            ProductCount = item.ProductCount,
                            ProductId = item.ProductId,
                            ProductPrice = product.ProductPrice,
                            ProductTitle = product.ProductTitle,
                            ProductDetails = product.ProductDetails,
                            Size = product.Size,
                            DiscountPercent = discount.DiscountPercent,
                            Sum = item.ProductCount * product.ProductPrice,
                            SumWithDiscount = (item.ProductCount * product.ProductPrice) - ((item.ProductCount * product.ProductPrice) * discount.DiscountPercent) / 100,
                            TotalsumWithDiscount = shopcart.Sum(s => s.SumWithDiscount)
                        });
                    }
                    else
                    {
                        shopcart.Add(new ShowShoppingCart()
                        {

                            ProductCount = item.ProductCount,
                            ProductId = item.ProductId,
                            ProductPrice = product.ProductPrice,
                            ProductTitle = product.ProductTitle,
                            ProductDetails = product.ProductDetails,
                            Size = product.Size,
                            DiscountPercent = 0,
                            Sum = item.ProductCount * product.ProductPrice,
                            SumWithDiscount = item.ProductCount * product.ProductPrice,
                            TotalsumWithDiscount = shopcart.Sum(s => s.SumWithDiscount)
                        });
                    }
                }
            }
            Session["ShowShopping"] = shopcart;

            return View(shopcart);

        }




        public ActionResult Remove(int id)
        {
            List<ShopCartItem> shoppingCartItems = Session["ShoppingCart"] as List<ShopCartItem>;
            int index = shoppingCartItems.FindIndex(s => s.ProductId == id);
            shoppingCartItems.Remove(shoppingCartItems[index]);
            Session["ShoppingCart"] = shoppingCartItems;
            return Content("Success");
        }



        public ActionResult SuccessSave()
        {
            return View();
        }

        public ActionResult Save()
        {
            List<ShopCartItem> shop = Session["ShoppingCart"] as List<ShopCartItem>;
            int Userid = db.Users.First(u => u.UserName == User.Identity.Name).UserID;

            Orders order = new Orders();

            order.OrderDate = DateTime.Now;
            order.UserId = Userid;
            order.IsFinally = false;
            //Session["FinalPrice"] = FinalPrice;
            //Session["DiscountCodeID"] = dbCode.DiscountCodeID;
            if (Session["DiscountCodeID"] != null)
            {
                order.DiscountCodeID = (int)Session["DiscountCodeID"];
            }

            if (Session["FinalPrice"] != null)
            {
                order.OrderTotalAfterDiscountCodeApply = (int)Session["FinalPrice"];
            }

            foreach (var item in shop)
            {
                var product = db.Products.Find(item.ProductId);
                if (db.Discounts.Any(d => d.ProductID == item.ProductId))
                {
                    int discount = db.Discounts.FirstOrDefault(d => d.ProductID == item.ProductId).DiscountPercent;
                    db.OrderDetails.Add(new OrderDetails()
                    {
                        OrderId = order.OrderId,
                        ProductCount = item.ProductCount,
                        ProductPrice = product.ProductPrice,
                        ProductId = product.ProductID,
                        Sum = item.ProductCount * product.ProductPrice,
                        SumWithDiscount = (item.ProductCount * product.ProductPrice) - ((item.ProductCount * product.ProductPrice) * discount) / 100
                    });
                }
                else
                {
                    db.OrderDetails.Add(new OrderDetails()
                    {
                        OrderId = order.OrderId,
                        ProductCount = item.ProductCount,
                        ProductPrice = product.ProductPrice,
                        ProductId = product.ProductID,
                        Sum = item.ProductCount * product.ProductPrice,
                        SumWithDiscount = item.ProductCount * product.ProductPrice
                    });
                }
            }
            db.Orders.Add(order);
            db.SaveChanges();

            order.OrderTotalSum = order.OrderDetails.Where(o => o.OrderId == o.Orders.OrderId).Sum(o => o.Sum);
            order.OrderTotalSumWithDiscount = order.OrderDetails.Where(o => o.OrderId == o.Orders.OrderId)
                .Sum(o => o.SumWithDiscount);
            db.Entry(order).State = EntityState.Modified;
            db.SaveChanges();


            var user = order.Users.Phone;
            string body = "بهین فلکس - پیش فاکتور شما با کد پیگیری " + order.OrderId + " با موفقیت ثبت گردید";
            var receivers = user + ",09199400030";

            SmsInput input = new SmsInput();
            input.Body = body;
            input.Receivers = receivers;
            input.SmsType = SmsType.Standard;
            SendSmss(input);
            shop.Clear();
            Session.Remove("Total");
            Session.Remove("FinalPrice");
            Session.Remove("DiscountCodeID");
            return View("SuccessSave");

        }

        [HttpPost]
        public ActionResult SendSmss(SmsInput input)
        {
            var smsService = new SmsService.SmsService();
            var response = smsService.SendSms(input);

            return View("SuccessSave");
        }

        public ActionResult RecalculateDiscountCode()
        {
            var result = new JsonResultWithMessage();
            if (Session["DiscountCodeID"] != null)
            {
                int DiscountCodeID = (int)Session["DiscountCodeID"];
                var dbDiscountCode = db.DiscountCodes.FirstOrDefault(dc => dc.DiscountCodeID == DiscountCodeID);
                ApplyDiscountCode(dbDiscountCode.DiscountCode);
                if (Session["FinalPrice"] != null)
                {
                    result.Successful = true;
                    result.Value = (int)Session["FinalPrice"];
                }
            }

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ApplyDiscountCode(string DiscountCode)
        {
            var result = new JsonResultWithMessage();
            var dbCode = db.DiscountCodes.FirstOrDefault(dc => dc.DiscountCode == DiscountCode);

            if (dbCode == null)
            {
                Session.Remove("FinalPrice");
                Session.Remove("DiscountCodeID");

                result.Successful = false;
                result.MessageType = "error";
                result.MessageText = $"کد تخفیف {DiscountCode} در سیستم وجود ندارد.";
                return Json(result, JsonRequestBehavior.AllowGet);
            }

            // Check if DiscountCode is provided for current user
            int UserID = db.Users.First(u => u.UserName == User.Identity.Name).UserID;
            if (dbCode.UserID != UserID)
            {
                Session.Remove("FinalPrice");
                Session.Remove("DiscountCodeID");

                result.Successful = false;
                result.MessageType = "error";
                result.MessageText = "این کد تخفیف برای کاربر دیگری صادر شده است";
                return Json(result, JsonRequestBehavior.AllowGet);
            }

            // Check UsageCount
            var previousUsagesCount = db.Orders.Count(o => o.DiscountCodeID == dbCode.DiscountCodeID && o.UserId == UserID);
            if (previousUsagesCount >= dbCode.DiscountCodeUsageCount)
            {
                Session.Remove("FinalPrice");
                Session.Remove("DiscountCodeID");

                result.Successful = false;
                result.MessageType = "error";
                result.MessageText = "دفعات مجاز استفاده از این کد تمام شده است.";
                return Json(result, JsonRequestBehavior.AllowGet);
            }

            // Check if DiscountCode is Expired:
            if (dbCode.DiscountCodeExpireDate < DateTime.Now)
            {
                Session.Remove("FinalPrice");
                Session.Remove("DiscountCodeID");
                result.Successful = false;
                result.MessageType = "error";
                result.MessageText = "تاریخ مصرف این کد تخفیف به پایان رسیده است.";
                return Json(result, JsonRequestBehavior.AllowGet);
            }

            // Calculate DiscountCode 
            List<ShopCartItem> shoppingCartItems = Session["ShoppingCart"] as List<ShopCartItem>;

            if (shoppingCartItems == null)
            {
                Session.Remove("FinalPrice");
                Session.Remove("DiscountCodeID");

                result.Successful = false;
                result.MessageType = "error";
                result.MessageText = "هیچ کالایی در سبد خرید وجود ندارد.";
                return Json(result, JsonRequestBehavior.AllowGet);
            }

            var shoppingCartProductIDs = shoppingCartItems.Select(sci => sci.ProductId);
            var dbProducts =
                db.Products.Include(p => p.Discounts)
                    .Where(p => shoppingCartProductIDs.Contains(p.ProductID)).ToList();
            int orderGrandTotal = 0;
            foreach (var item in shoppingCartItems)
            {
                var dbProduct = dbProducts.FirstOrDefault(p => p.ProductID == item.ProductId);
                if (dbProduct.Discounts.Any())
                {
                    int discount = dbProduct.Discounts.FirstOrDefault().DiscountPercent;
                    orderGrandTotal += (item.ProductCount * dbProduct.ProductPrice) -
                                       (((item.ProductCount * dbProduct.ProductPrice) * discount) / 100);
                }
                else
                {
                    orderGrandTotal += item.ProductCount * dbProduct.ProductPrice;
                }
            }

            int discountCodeDeductAmount = 0;
            int discountCodeDeductibleAmount = (dbCode.DiscountPercent * orderGrandTotal) / 100;
            if (discountCodeDeductibleAmount > dbCode.DiscountMaxAmount)
            {
                discountCodeDeductAmount = dbCode.DiscountMaxAmount;
            }
            else
            {
                discountCodeDeductAmount = discountCodeDeductibleAmount;
            }

            int FinalPrice = orderGrandTotal - discountCodeDeductAmount;

            Session["FinalPrice"] = FinalPrice;
            Session["DiscountCodeID"] = dbCode.DiscountCodeID;

            result.Successful = true;
            result.MessageType = "success";
            result.MessageText = $"مبلغ {discountCodeDeductAmount:#,0 ریال} با استفاده از کد تخفیف {DiscountCode} از فاکتور کنونی کسر شد.";

            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}
