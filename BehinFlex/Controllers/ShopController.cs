using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using BehinFlex.Models;
using System.Data.Entity;

namespace BehinFlex.Controllers
{
    public class ShopController : ApiController
    {

        // GET: api/Shop
        public string Get()
        {
            int Count = 0;
            var Sessions = HttpContext.Current.Session;
            List<ShopCartItem> shopcart = new List<ShopCartItem>();
            if (Sessions["ShoppingCart"] != null)
            {
                shopcart = Sessions["ShoppingCart"] as List<ShopCartItem>;
                Count = shopcart.Sum(s => s.ProductCount);
            }
            return @"<strong>مشاهده پیش فاکتور </strong>  ";
        }

        // GET: api/Shop/5
        public string Get(int ProductID, int ProductCount)
        {
            var Session = HttpContext.Current.Session;
            List<ShopCartItem> shopcart = new List<ShopCartItem>();
            if (Session["ShoppingCart"] != null)
            {
                shopcart = Session["ShoppingCart"] as List<ShopCartItem>;
                if (shopcart.Any(s => s.ProductId == ProductID))
                {
                    int index = shopcart.FindIndex(s => s.ProductId == ProductID);
                    if (shopcart[index].ProductCount == 0)
                    {
                        shopcart.Remove(shopcart[index]);
                    }
                    else
                    {
                        shopcart[index].ProductCount = ProductCount;
                    }
                }
                else
                {
                    if (ProductCount != 0)
                    {
                        shopcart.Add(new ShopCartItem()
                        {
                            ProductId = ProductID,
                            ProductCount = ProductCount
                        });
                    }
                }
            }
            else
            {
                shopcart.Add(new ShopCartItem()
                {
                    ProductId = ProductID,
                    ProductCount = ProductCount
                });
            }

            Session["ShoppingCart"] = shopcart;
            //Session.Remove("FinalPrice");
            //Session.Remove("DiscountCodeID");

            return Get();
        }

        // POST: api/Shop
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Shop/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/Shop/5
        public void Delete(int id)
        {
        }
    }
}