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
    public class DiscountCodesController : Controller
    {
        private behinfarazEntities db = new behinfarazEntities();

        // GET: Admin/DiscountCodes
        public ActionResult Index()
        {
            var discountCodes = db.DiscountCodes.Include(d => d.Users);
            return View(discountCodes.ToList());
        }

        // GET: Admin/DiscountCodes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DiscountCodes discountCodes = db.DiscountCodes.Find(id);
            if (discountCodes == null)
            {
                return HttpNotFound();
            }
            return View(discountCodes);
        }

        // GET: Admin/DiscountCodes/Create
        public ActionResult Create()
        {
            ViewBag.UserID = new SelectList(db.Users, "UserID", "UserName");
            var model = new DiscountCodes()
            {
                DiscountCodeExpireDate = DateTime.Now.AddDays(10),
                DiscountPercent = 0,
                DiscountMaxAmount = 0,
                DiscountCodeUsageCount = 1
            };
            return View(model);
        }

        // POST: Admin/DiscountCodes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(DiscountCodes discountCodes)
        {
            if (ModelState.IsValid)
            {
                db.DiscountCodes.Add(discountCodes);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.UserID = new SelectList(db.Users, "UserID", "UserName", discountCodes.UserID);
            return View(discountCodes);
        }

        // GET: Admin/DiscountCodes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DiscountCodes discountCodes = db.DiscountCodes.Find(id);
            if (discountCodes == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserID = new SelectList(db.Users, "UserID", "UserName", discountCodes.UserID);
            return View(discountCodes);
        }

        // POST: Admin/DiscountCodes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(DiscountCodes discountCodes)
        {
            if (ModelState.IsValid)
            {
                db.Entry(discountCodes).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.UserID = new SelectList(db.Users, "UserID", "UserName", discountCodes.UserID);
            return View(discountCodes);
        }

        // GET: Admin/DiscountCodes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DiscountCodes discountCodes = db.DiscountCodes.Find(id);
            
            if (discountCodes == null)
            {
                return HttpNotFound();
            }
            return View(discountCodes);
        }

        // POST: Admin/DiscountCodes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DiscountCodes discountCodes = db.DiscountCodes.Find(id);
            if (db.Orders.Any(o => o.DiscountCodeID == discountCodes.DiscountCodeID))
            {
                ViewBag.Message = "برای حذف کد تخفیف ابتدا پیش فاکتوری که از این کد تخفیف استفاده کرده را حذف کنید";
                return View(discountCodes);
            }
            db.DiscountCodes.Remove(discountCodes);
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
