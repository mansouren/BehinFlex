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
    public class ProductGroupsController : Controller
    { 
        
        private behinfarazEntities db = new behinfarazEntities();

        // GET: Admin/ProductGroups1
        public ActionResult Index()
        {
            var productGroup = db.ProductGroup.Include(p => p.ProductBrand);
            return View(productGroup.ToList());
        }

        // GET: Admin/ProductGroups1/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductGroup productGroup = db.ProductGroup.Find(id);
            if (productGroup == null)
            {
                return HttpNotFound();
            }
            return View(productGroup);
        }

        // GET: Admin/ProductGroups1/Create
        public ActionResult Create()
        {
            ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle");
            return View();
        }

        // POST: Admin/ProductGroups1/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductGroupID,ProductBrandID,ProductGroupTitle")] ProductGroup productGroup)
        {
            if (ModelState.IsValid)
            {
                db.ProductGroup.Add(productGroup);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle", productGroup.ProductBrandID);
            return View(productGroup);
        }

        // GET: Admin/ProductGroups1/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductGroup productGroup = db.ProductGroup.Find(id);
            if (productGroup == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle", productGroup.ProductBrandID);
            return View(productGroup);
        }

        // POST: Admin/ProductGroups1/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductGroupID,ProductBrandID,ProductGroupTitle")] ProductGroup productGroup)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productGroup).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle", productGroup.ProductBrandID);
            return View(productGroup);
        }

        // GET: Admin/ProductGroups1/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductGroup productGroup = db.ProductGroup.Find(id);
            if (productGroup == null)
            {
                return HttpNotFound();
            }
            return View(productGroup);
        }

        // POST: Admin/ProductGroups1/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProductGroup productGroup = db.ProductGroup.Find(id);
            db.ProductGroup.Remove(productGroup);
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
