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
    public class DiscountsController : Controller
    {
        private behinfarazEntities db = new behinfarazEntities();

           
        
   
        public JsonResult BrandGroupDrop(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            List<ProductGroup> group = db.ProductGroup.Where(b => b.ProductBrandID == id).ToList();
            return Json(group, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GroupSubGroupDrop(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            List<ProductSubGroup> subgroup = db.ProductSubGroup.Where(b => b.ProductGroupID == id).ToList();
            return Json(subgroup, JsonRequestBehavior.AllowGet);
        }
        public JsonResult SubGroupDrop(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            List<Products> product = db.Products.Where(b => b.ProductSubGroupID == id).ToList();
            return Json(product, JsonRequestBehavior.AllowGet);
        }

    





        public ActionResult ProductDiscountIndex()
        {
            var discounts = db.Discounts.Include(d => d.Products);
            return View(discounts.ToList());
        }
        public ActionResult ProductDiscountCreate()
        {
          
            ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle");
            ViewBag.ProductGroupID = new SelectList(db.ProductGroup, "ProductGroupID", "ProductGroupTitle");
            ViewBag.ProductSubGroupID = new SelectList(db.ProductSubGroup, "ProductSubGroupID", "ProductSubGroupTitle");
            ViewBag.ProductID = new SelectList(db.Products, "ProductID", "ProductTitle");
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ProductDiscountCreate(Discounts discounts)
        {
            
                if (!ModelState.IsValid)
               {
                   
                   ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle", discounts.Products.ProductSubGroup.ProductGroup.ProductBrandID);
                   ViewBag.ProductGroupID = new SelectList(db.ProductGroup, "ProductGroupID", "ProductGroupTitle", discounts.Products.ProductSubGroup.ProductGroupID);
                   ViewBag.ProductSubGroupID = new SelectList(db.ProductSubGroup, "ProductSubGroupID", "ProductSubGroupTitle", discounts.Products.ProductSubGroupID);
                   ViewBag.ProductID = new SelectList(db.Products, "ProductID", "ProductTitle", discounts.ProductID);
                   return View(discounts);

            }
            
            db.Discounts.Add(discounts);
            db.SaveChanges();
            return RedirectToAction("ProductDiscountIndex");

        }

        public ActionResult ProductDiscountEdit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Discounts discounts = db.Discounts.Find(id);
            if (discounts == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle", discounts.Products.ProductSubGroup.ProductGroup.ProductBrandID);
            ViewBag.ProductGroupID = new SelectList(db.ProductGroup, "ProductGroupID", "ProductGroupTitle", discounts.Products.ProductSubGroup.ProductGroupID);
            ViewBag.ProductSubGroupID = new SelectList(db.ProductSubGroup, "ProductSubGroupID", "ProductSubGroupTitle", discounts.Products.ProductSubGroupID);
            ViewBag.ProductID = new SelectList(db.Products, "ProductID", "ProductTitle", discounts.ProductID);
            
            return View(discounts);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ProductDiscountEdit(Discounts discounts)
        {
            if (ModelState.IsValid)
            {

                db.Entry(discounts).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("ProductDiscountIndex");
            }
            ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle", discounts.Products.ProductSubGroup.ProductGroup.ProductBrandID);
            ViewBag.ProductGroupID = new SelectList(db.ProductGroup, "ProductGroupID", "ProductGroupTitle", discounts.Products.ProductSubGroup.ProductGroupID);
            ViewBag.ProductSubGroupID = new SelectList(db.ProductSubGroup, "ProductSubGroupID", "ProductSubGroupTitle", discounts.Products.ProductSubGroupID);
            ViewBag.ProductID = new SelectList(db.Products, "ProductID", "ProductTitle", discounts.ProductID);
            
            return View(discounts);
        }
        // GET: Admin/Discounts/Delete/5
        public ActionResult ProductDiscountDelete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Discounts discounts = db.Discounts.Find(id);
            if (discounts == null)
            {
                return HttpNotFound();
            }
            return View(discounts);
        }

        // POST: Admin/Discounts/Delete/5
        [HttpPost, ActionName("ProductDiscountDelete")]
        [ValidateAntiForgeryToken]
        public ActionResult ProductDiscountDeleteConfirmed(int id)
        {
            Discounts discounts = db.Discounts.Find(id);
            db.Discounts.Remove(discounts);
            db.SaveChanges();
            return RedirectToAction("ProductDiscountIndex");
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
