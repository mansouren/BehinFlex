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
    public class ProductBrandsController : Controller
    {
        private behinfarazEntities db = new behinfarazEntities();

        // GET: Admin/ProductBrands
        public ActionResult Index()
        {
            return View(db.ProductBrand.ToList());
        }

        // GET: Admin/ProductBrands/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductBrand productBrand = db.ProductBrand.Find(id);
            if (productBrand == null)
            {
                return HttpNotFound();
            }
            return View(productBrand);
        }

        // GET: Admin/ProductBrands/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/ProductBrands/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductBrandID,ProductBrandTitle")] ProductBrand productBrand)
        {
            if (ModelState.IsValid)
            {
                db.ProductBrand.Add(productBrand);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(productBrand);
        }

        // GET: Admin/ProductBrands/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductBrand productBrand = db.ProductBrand.Find(id);
            if (productBrand == null)
            {
                return HttpNotFound();
            }
            return View(productBrand);
        }

        // POST: Admin/ProductBrands/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductBrandID,ProductBrandTitle")] ProductBrand productBrand)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productBrand).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(productBrand);
        }

        // GET: Admin/ProductBrands/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductBrand productBrand = db.ProductBrand.Find(id);
            if (productBrand == null)
            {
                return HttpNotFound();
            }
            return View(productBrand);
        }

        // POST: Admin/ProductBrands/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProductBrand productBrand = db.ProductBrand.Find(id);
            db.ProductBrand.Remove(productBrand);
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
