using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Security.Policy;
using System.Web;
using System.Web.Mvc;
using BehinFlex.Models;

namespace BehinFlex.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ProductSubGroupsController : Controller
    {
        private behinfarazEntities db = new behinfarazEntities();

        // GET: Admin/ProductSubGroups
        public ActionResult Index()
        {
            var productSubGroup = db.ProductSubGroup.Include(p => p.ProductGroup);
            return View(productSubGroup.ToList());
        }

        // GET: Admin/ProductSubGroups/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductSubGroup productSubGroup = db.ProductSubGroup.Find(id);
            if (productSubGroup == null)
            {
                return HttpNotFound();
            }
            return View(productSubGroup);
        }

        public JsonResult BrandGroupDrop(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            List<ProductGroup> group = db.ProductGroup.Where(b => b.ProductBrandID == id).ToList();
            return Json(group, JsonRequestBehavior.AllowGet);
        }

        // GET: Admin/ProductSubGroups/Create
        public ActionResult Create()
        {
            ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle");
            ViewBag.ProductGroupID = new SelectList(db.ProductGroup, "ProductGroupID", "ProductGroupTitle");
            return View();
        }

        // POST: Admin/ProductSubGroups/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductSubGroupID,ProductGroupID,ProductSubGroupTitle")] ProductSubGroup productSubGroup)
        {
            if (ModelState.IsValid)
            {
                db.ProductSubGroup.Add(productSubGroup);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle",productSubGroup.ProductGroup.ProductBrandID);
            ViewBag.ProductGroupID = new SelectList(db.ProductGroup, "ProductGroupID", "ProductGroupTitle", productSubGroup.ProductGroupID);
            return View(productSubGroup);
        }

        // GET: Admin/ProductSubGroups/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductSubGroup productSubGroup = db.ProductSubGroup.Find(id);
            if (productSubGroup == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle", productSubGroup.ProductGroup.ProductBrandID);
            ViewBag.ProductGroupID = new SelectList(db.ProductGroup, "ProductGroupID", "ProductGroupTitle", productSubGroup.ProductGroupID);
            return View(productSubGroup);
        }

        // POST: Admin/ProductSubGroups/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductSubGroupID,ProductGroupID,ProductSubGroupTitle")] ProductSubGroup productSubGroup)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productSubGroup).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle", productSubGroup.ProductGroup.ProductBrandID);
            ViewBag.ProductGroupID = new SelectList(db.ProductGroup, "ProductGroupID", "ProductGroupTitle", productSubGroup.ProductGroupID);
            return View(productSubGroup);
        }

        // GET: Admin/ProductSubGroups/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductSubGroup productSubGroup = db.ProductSubGroup.Find(id);
            if (productSubGroup == null)
            {
                return HttpNotFound();
            }
            return View(productSubGroup);
        }

        // POST: Admin/ProductSubGroups/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProductSubGroup productSubGroup = db.ProductSubGroup.Find(id);
            db.ProductSubGroup.Remove(productSubGroup);
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
