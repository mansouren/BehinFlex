using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BehinFlex.Models;
using InsertShowImage;
using NPOI.OpenXmlFormats.Vml;

namespace BehinFlex.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ProductsController : Controller
    {
        private behinfarazEntities db = new behinfarazEntities();

        // GET: Admin/Products
        public ActionResult Index()
        {
            
            var products = db.Products.Include(p => p.ProductSubGroup);
            return View(products.ToList().OrderByDescending(p => p.CreateDate));
        }

        // GET: Admin/Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.Products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

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

        // GET: Admin/Products/Create
        public ActionResult Create()
        {
            ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle");
            ViewBag.ProductGroupID=new SelectList(db.ProductGroup,"ProductGroupID","ProductGroupTitle");
            ViewBag.ProductSubGroupID = new SelectList(db.ProductSubGroup, "ProductSubGroupID", "ProductSubGroupTitle");
               
            return View();
        }

        // POST: Admin/Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Products products,HttpPostedFileBase ProductImageUrl,HttpPostedFileBase[] ProductGallery,int Discount=0)
        {
            if (ModelState.IsValid)
            {
                string imagename = "no-photo.jpg";
                if (ProductImageUrl != null)
                {
                    imagename=Guid.NewGuid().ToString().Replace("-","")+Path.GetExtension(ProductImageUrl.FileName);
                    ProductImageUrl.SaveAs(Server.MapPath("/ProductImages/Image/"+imagename));
                    //------------------------Resize Image------------------------------
                    ImageResizer img=new ImageResizer();
                    img.Resize(Server.MapPath("/ProductImages/Image/" + imagename), Server.MapPath("/ProductImages/Thumb/" + imagename));
                }
                products.ProductImageUrl = imagename;
                products.CreateDate=DateTime.Now;
                db.Products.Add(products);

                //---------------------------Gallery----------------------
                if (ProductGallery != null && ProductGallery.Any())
                {
                    foreach (HttpPostedFileBase file in ProductGallery)
                    {

                        string galleryname = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(file.FileName);
                        file.SaveAs(Server.MapPath("/ProductImages/Image/" + galleryname));
                        //--------------Resize Image For Gallery---------------------
                        ImageResizer img = new InsertShowImage.ImageResizer();
                        img.Resize(Server.MapPath("/ProductImages/Image/" + galleryname), Server.MapPath("/ProductImages/Thumb/" + galleryname));
                        db.ProductGalleries.Add(new ProductGalleries()
                        {
                            ImageName = galleryname,
                            ProductID = products.ProductID

                        });



                    }
                }
                if(Discount !=null && Discount !=0)
                {
                    db.Discounts.Add(new Discounts()
                    {
                        ProductID = products.ProductID,
                        DiscountPercent= Discount
                    });
                }

                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle",products.ProductSubGroup.ProductGroup.ProductBrandID);
            ViewBag.ProductGroupID = new SelectList(db.ProductGroup, "ProductGroupID", "ProductGroupTitle",products.ProductSubGroup.ProductGroupID);
            ViewBag.ProductSubGroupID = new SelectList(db.ProductSubGroup, "ProductSubGroupID", "ProductSubGroupTitle", products.ProductSubGroupID);
            return View(products);
        }

        // GET: Admin/Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.Products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle", products.ProductSubGroup.ProductGroup.ProductBrandID);
            ViewBag.ProductGroupID = new SelectList(db.ProductGroup, "ProductGroupID", "ProductGroupTitle", products.ProductSubGroup.ProductGroupID);
            ViewBag.ProductSubGroupID = new SelectList(db.ProductSubGroup, "ProductSubGroupID", "ProductSubGroupTitle", products.ProductSubGroupID);
            return View(products);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit( Products products, HttpPostedFileBase ProductImageUrl, HttpPostedFileBase[] ProductGallery,int Discount=0)
        {
            if (ModelState.IsValid)
            {
                if (ProductImageUrl != null)
                {
                    if (products.ProductImageUrl != "no-photo.jpg")
                    {
                        if (System.IO.File.Exists(Server.MapPath("/ProductImages/Image/" + products.ProductImageUrl)))
                            System.IO.File.Delete(Server.MapPath("/ProductImages/Image/" + products.ProductImageUrl));

                        if (System.IO.File.Exists(Server.MapPath("/ProductImages/Thumb/" + products.ProductImageUrl)))
                            System.IO.File.Delete(Server.MapPath("/ProductImages/Thumb/" + products.ProductImageUrl));
                    }
                    products.ProductImageUrl=Guid.NewGuid().ToString().Replace("-","")+Path.GetExtension(ProductImageUrl.FileName);
                    ProductImageUrl.SaveAs(Server.MapPath("/ProductImages/Image/"+products.ProductImageUrl));
                    ImageResizer img=new ImageResizer();
                    img.Resize(Server.MapPath("/ProductImages/Image/" + products.ProductImageUrl), Server.MapPath("/ProductImages/Thumb/" + products.ProductImageUrl));
                }

                if (ProductGallery != null && ProductGallery.Any())
                {
                    foreach (HttpPostedFileBase file in ProductGallery)
                    {
                        string galleryname = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(file.FileName);
                        file.SaveAs(Server.MapPath("/ProductImages/Image/" + galleryname));
                        //--------------Resize Image For Gallery---------------------
                        ImageResizer img = new InsertShowImage.ImageResizer();
                        img.Resize(Server.MapPath("/ProductImages/Image/" + galleryname), Server.MapPath("/ProductImages/Thumb/" + galleryname));
                        db.ProductGalleries.Add(new ProductGalleries()
                        {
                            ImageName = galleryname,
                            ProductID = products.ProductID

                        });

                    }
                }
                if (Discount != null && db.Discounts.Any(d => d.ProductID == products.ProductID) && Discount != 0  )
                { 
                    Discounts discounts = db.Discounts.FirstOrDefault(d => d.ProductID == products.ProductID);
                    discounts.DiscountPercent = Discount;
                    discounts.ProductID = products.ProductID;
                    
                    //db.Entry(discounts).State = EntityState.Modified;
                    db.SaveChanges();
                }
                else if(Discount != null && Discount != 0)
                {
                    db.Discounts.Add(new Discounts()
                    {
                        ProductID = products.ProductID,
                        DiscountPercent = Discount
                    });

                }
                else if(Discount == 0 && db.Discounts.Any(d => d.ProductID == products.ProductID))
                {
                    db.Discounts.Where(d => d.ProductID == products.ProductID).ToList().ForEach(d => db.Discounts.Remove(d));
                }
                    db.Entry(products).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductBrandID = new SelectList(db.ProductBrand, "ProductBrandID", "ProductBrandTitle", products.ProductSubGroup.ProductGroup.ProductBrandID);
            ViewBag.ProductGroupID = new SelectList(db.ProductGroup, "ProductGroupID", "ProductGroupTitle", products.ProductSubGroup.ProductGroupID);
            ViewBag.ProductSubGroupID = new SelectList(db.ProductSubGroup, "ProductSubGroupID", "ProductSubGroupTitle", products.ProductSubGroupID);
            return View(products);
        }

        // GET: Admin/Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.Products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

        // POST: Admin/Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Products products = db.Products.Find(id);
            //------------- Delete Image Gallery When Product Deleted------------
            foreach (var gallery in products.ProductGalleries.ToList())
            {
                if (System.IO.File.Exists(Server.MapPath("/ProductImages/Image/" + gallery.ImageName)))
                    System.IO.File.Delete(Server.MapPath("/ProductImages/Image/" + gallery.ImageName));
                
                if (System.IO.File.Exists(Server.MapPath("/ProductImages/Thumb/" + gallery.ImageName)))
                    System.IO.File.Delete(Server.MapPath("/ProductImages/Thumb/" + gallery.ImageName));

                
                db.ProductGalleries.Remove(gallery);
            }

            

            //----------------Delete ProductImages When Product Deleted---------------------
            if (products.ProductImageUrl != "no-photo.jpg")
            {
                if (System.IO.File.Exists(Server.MapPath("/ProductImages/Image/" + products.ProductImageUrl)))
                    System.IO.File.Delete(Server.MapPath("/ProductImages/Image/" + products.ProductImageUrl));

                if (System.IO.File.Exists(Server.MapPath("/ProductImages/Thumb/" + products.ProductImageUrl)))
                    System.IO.File.Delete(Server.MapPath("/ProductImages/Thumb/" + products.ProductImageUrl));
            }

            //---------------------Delete SeminarParticipants-------------------------
            db.Comments.Where(c => c.ProductID == products.ProductID).ToList().ForEach(c => db.Comments.Remove(c));
            db.Discounts.Where(d=>d.ProductID == products.ProductID).ToList().ForEach(d=>db.Discounts.Remove(d));
            db.Products.Remove(products);
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

        //----------------Ajax Delete------------------------
        public bool DeleteGallery(int id)
        {
            var gallery = db.ProductGalleries.Find(id);
            if (System.IO.File.Exists(Server.MapPath("/ProductImages/Image/" + gallery.ImageName)))
            System.IO.File.Delete(Server.MapPath("/ProductImages/Image/" + gallery.ImageName));

            if (System.IO.File.Exists(Server.MapPath("/ProductImages/Thumb/" + gallery.ImageName)))
                System.IO.File.Delete(Server.MapPath("/ProductImages/Thumb/" + gallery.ImageName));

            db.ProductGalleries.Remove(gallery);
            db.SaveChanges();
            return true;
        }
    }
}
