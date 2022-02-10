using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BehinFlex.Models;

namespace BehinFlex.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class OrdersController : Controller

    {
        private behinfarazEntities db = new behinfarazEntities();

        // GET: Admin/Orders
        public ActionResult Index()
        {
            var orders = db.Orders.Include(o => o.Users).Include(o => o.DiscountCodes);
            return View(orders.ToList().OrderByDescending(o=>o.OrderDate));
        }

       

        // GET: Admin/Orders/Create
        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(db.Users, "UserID", "UserName");
            return View();
        }

        // POST: Admin/Orders/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Orders orders)
        {
            if (ModelState.IsValid)
            {
                db.Orders.Add(orders);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserId = new SelectList(db.Users, "UserID", "UserName", orders.UserId);
            return View(orders);
        }

        // GET: Admin/Orders/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Orders orders = db.Orders.Find(id);
            if (orders == null)
            {
                return HttpNotFound();
            }
           
            ViewBag.UserId = new SelectList(db.Users, "UserID", "UserName", orders.UserId);
            return View(orders);
        }

        // POST: Admin/Orders/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit( Orders orders,int bonusinput)
        {
            if (ModelState.IsValid)
            {
                Bonuses bonuses = new Bonuses();
                if (orders.IsFinally && !db.Bonuses.Any(b=>b.OrderId == orders.OrderId))
                {


                    bonuses.UserId = orders.UserId;
                    bonuses.Bonus = bonusinput;
                    bonuses.OrderId = orders.OrderId;
                     
                    db.Bonuses.Add(bonuses);
                    db.SaveChanges();
                    
                    }
                else if(orders.IsFinally && db.Bonuses.Any(b => b.OrderId == orders.OrderId))
                {
                    var Qbonus = db.Bonuses.Single(b => b.OrderId == orders.OrderId);
                    var bonusid = Qbonus.BonusId;
                    Bonuses bonus= db.Bonuses.Find(bonusid);
                    bonus.Bonus = bonusinput;
                    db.SaveChanges();
                }

                db.Entry(orders).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserId = new SelectList(db.Users, "UserID", "UserName", orders.UserId);
            return View(orders);
        }

        // GET: Admin/Orders/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Orders orders = db.Orders.Find(id);
            if (orders == null)
            {
                return HttpNotFound();
            }
            return View(orders);
        }

        // POST: Admin/Orders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Orders orders = db.Orders.Find(id);
            db.OrderDetails.Where(od=>od.OrderId == orders.OrderId).ToList().ForEach(od=>db.OrderDetails.Remove(od));
            db.Bonuses.Where(b=>b.OrderId==orders.OrderId).ToList().ForEach(b=>db.Bonuses.Remove(b));
            db.Orders.Remove(orders);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
