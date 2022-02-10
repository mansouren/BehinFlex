using BehinFlex.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;

namespace BehinFlex.Controllers
{
    public class ShopIndividualProductController : ApiController
    {
        // GET: api/Default
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
            return "مشاهده پیش فاکتور   ";
        }

        // GET: api/Default/5
        public string Get(int productid)
        {
            var Sessions = HttpContext.Current.Session;
            List<ShopCartItem> shopcart = new List<ShopCartItem>();
            if (Sessions["ShoppingCart"] != null)
            {
                shopcart = Sessions["ShoppingCart"] as List<ShopCartItem>;
                if (shopcart.Any(s => s.ProductId == productid))
                {
                    int index = shopcart.FindIndex(s => s.ProductId == productid);
                    shopcart[index].ProductCount += 1;
                }
                else
                {
                    shopcart.Add(new ShopCartItem()
                    {
                        ProductId = productid,
                        ProductCount = 1
                    });
                }
            }
            else
            {
                shopcart.Add(new ShopCartItem()
                {
                    ProductId = productid,
                    ProductCount = 1
                });
            }
            Sessions["ShoppingCart"] = shopcart;

            return Get();
        }

        // POST: api/Default
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Default/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Default/5
        public void Delete(int id)
        {
        }
    }
}
