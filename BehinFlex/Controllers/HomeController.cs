using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BehinFlex.Models;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Data.Entity;
using BehinFlex.Models.ViewModels;

namespace BehinFlex.Controllers
{
    public class HomeController : Controller
    {
        behinfarazEntities db=new behinfarazEntities();
      
        public void ContactForm(ContactUsViewModel vm)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    MailMessage msz = new MailMessage();
                    msz.From = new MailAddress(vm.Email);//Email which you are getting 
                    //from contact us page 
                    msz.To.Add("behinflexcompany@gmail.com");//Where mail will be sent
                    msz.Subject = vm.subject;
                    msz.Body = "آدرس ایمیل فرستنده: " + vm.Email + Environment.NewLine + "نام فرستنده: " + vm.name + Environment.NewLine + "متن پیام: " + vm.message;
                    SmtpClient smtp = new SmtpClient();

                    smtp.Host = "smtp.gmail.com";

                    smtp.Port = 587;

                    smtp.Credentials = new System.Net.NetworkCredential
                        ("behinflexcompany@gmail.com", "behincontact");


                    smtp.EnableSsl = true;

                    smtp.Send(msz);

                    ModelState.Clear();
                    ViewBag.Message = "پیام شما ارسال شد.متشکریم! ";
                }
                catch (Exception ex)
                {
                    ModelState.Clear();
                    ViewBag.Message = $" متاسفانه پیام شما ارسال نشد. {ex.Message}";
                }
            }
        }

        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(ContactUsViewModel vm)
        {
            ContactForm(vm);
            return View();
        }


        public ActionResult About()
        {
            return View();
        }
        [HttpPost]
        public ActionResult About(ContactUsViewModel vm)
        {
            ContactForm(vm);
            return View();
        }

        public ActionResult ContactUs()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ContactUs(ContactUsViewModel vm)
        {
            ContactForm(vm);
            return View();
        }

        public ActionResult ShowLastProjects()
        {
            return PartialView(db.Projects.OrderByDescending(p=>p.ProjectID).Take(3));
        }
        public ActionResult ShowLastNews()
        {
            return PartialView(db.News.OrderByDescending(n=>n.CreateDate).Take(2));
        }

        public ActionResult ShowSpecialProducts()
        {
            return PartialView(db.Products.Where(p => p.IsSpecial == true).Take(8));

        }
        public ActionResult Transport()
        {
            return View();
        }

        [HttpPost]
        public ActionResult UploadImage(HttpPostedFileBase upload, string CKEditorFuncNum, string CKEditor, string langCode)

        {
            string vImagePath = String.Empty;
            string vMessage = String.Empty;
            string vFilePath = String.Empty;
            string vOutput = String.Empty;
            try
            {
                if (upload != null && upload.ContentLength > 0)
                {
                    var vFileName = DateTime.Now.ToString("yyyyMMdd-HHMMssff") +
                                    Path.GetExtension(upload.FileName).ToLower();
                    var vFolderPath = Server.MapPath("/Upload/");
                    if (!Directory.Exists(vFolderPath))
                    {
                        Directory.CreateDirectory(vFolderPath);
                    }
                    vFilePath = Path.Combine(vFolderPath, vFileName);
                    upload.SaveAs(vFilePath);
                    vImagePath = Url.Content("/Upload/" + vFileName);
                    vMessage = "تصوير با موفقيت ذخيره شد";
                }
            }
            catch
            {
                vMessage = "There was an issue uploading";
            }
            vOutput = @"<html><body><script>window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ", \"" + vImagePath + "\", \"" + vMessage + "\");</script></body></html>";
            return Content(vOutput);
        }

        public ActionResult ShowAllProducts()
        {  
            
            return View(db.Products.ToList());
        }

        public ActionResult ShowComment()
        {
            return PartialView(db.Comments.Where(c => c.IsApproved).OrderByDescending(c=>c.CommentID).Take(3));
        }

        public ActionResult Certificate()
        {
            return View();
        }

        public ActionResult GetReferalCode()
        {
            var userId = db.Users.Single(u => u.UserName == User.Identity.Name).UserID;
            Random random = new Random();
            int a = random.Next();
            string refcode = "B-" + a + "-f" + userId;
            RefCode ref_Codes = new RefCode()
            {
                Ref_Code = refcode,
                UserId = userId
            };
            db.RefCode.Add(ref_Codes);
            db.SaveChanges();
            ViewBag.RefCode = refcode;
            return View();
        }

        public ActionResult GetTotals()
        {
            List<ShopCartItem> shoppingCart = new List<ShopCartItem>();
            behinfarazEntities db = new behinfarazEntities();
            var totals = new ShoppingCartTotals();
            if (Session["ShoppingCart"] != null)
            {
                shoppingCart = Session["ShoppingCart"] as List<ShopCartItem>;
                var productIds = shoppingCart.Select(sc => sc.ProductId).ToList();

                var dbProducts =
                    db.Products.Include(p => p.Discounts)
                        .Where(p => productIds.Contains(p.ProductID)).ToList();
                
                var productsWithDiscount = dbProducts.Select(p => new ProductWithDiscount()
                {
                    ProductID = p.ProductID,
                    ProductPrice = p.ProductPrice,
                    RowTotal = (p.ProductPrice * shoppingCart.FirstOrDefault(sc => sc.ProductId == p.ProductID).ProductCount),
                    RowGrandTotal = 
                        (p.ProductPrice * shoppingCart.FirstOrDefault(sc => sc.ProductId == p.ProductID).ProductCount - 
                         ((p.ProductPrice * shoppingCart.FirstOrDefault(sc => sc.ProductId == p.ProductID).ProductCount) * (p.Discounts.FirstOrDefault()?.DiscountPercent ?? 0) / 100))

                }).ToList();

                var orderTotal =
                    (long) productsWithDiscount.Sum(pwd => pwd.RowTotal);
                
                var orderGrandTotal = 
                    (long)productsWithDiscount.Sum(pwd => pwd.RowGrandTotal);

                totals.OrderTotal = orderTotal;
                totals.OrderGrandTotal = orderGrandTotal;
            }

            
            return Json(totals, JsonRequestBehavior.AllowGet);
        }

        public ActionResult MapRequest()
        {
            var model = new MapViewModel
            {
                AvailableMapType = GetTypes()
            };
            return View(model);
        }
        //[AntiForgeryToken]
        [HttpPost]
        public ActionResult MapRequest(MapViewModel map)
        {
            if (ModelState.IsValid)
            {
                var Types = string.Join(",", map.SelectedMapType);
                try
                {
                    MailMessage msz = new MailMessage();
                    msz.From = new MailAddress(map.Email);//Email which you are getting 
                    //from contact us page 
                    msz.To.Add("behinflexcompany@gmail.com");//Where mail will be sent
                    msz.Subject = "درخواست نقشه";
                    msz.Body = "آدرس ایمیل فرستنده: " + map.Email + Environment.NewLine + "نام فرستنده: " + map.FullName + Environment.NewLine +
                       "شماره تماس :"+map.Phone + Environment.NewLine + "نوع نقشه : " + Types + Environment.NewLine + "متن پیام: " + map.message;

                    SmtpClient smtp = new SmtpClient();

                    smtp.Host = "smtp.gmail.com";

                    smtp.Port = 587;

                    smtp.Credentials = new System.Net.NetworkCredential
                        ("behinflexcompany@gmail.com", "behincontact");


                    smtp.EnableSsl = true;

                    smtp.Send(msz);

                    ModelState.Clear();
                    ViewBag.Message = "کاربر گرامی درخواست شما ارسال شد.در اسرع وقت با شما تماس گرفته خواهد شد. با تشکر! ";
                }
                catch (Exception ex)
                {
                    ModelState.Clear();
                    ViewBag.Message = $" متاسفانه درخواست شما ارسال نشد. {ex.Message}";
                }
            }
            map.AvailableMapType = GetTypes();
            return View(map);
        }

        private IList<SelectListItem> GetTypes()
        {
            return new List<SelectListItem>
        {
            new SelectListItem {Text = "استخر", Value = "استخر"},
            new SelectListItem {Text = "برج", Value = "برج"},
            new SelectListItem {Text = "منزل مسکونی", Value = "منزل مسکونی"}
            
        };
        }

    }
}