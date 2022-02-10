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


namespace BehinFlex.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class ImagesController : Controller
    {
        private behinfarazEntities db = new behinfarazEntities();

        // GET: Admin/Images
        public ActionResult Index()
        {
            return View(db.Images.ToList());
        }

        // GET: Admin/Images/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Images images = db.Images.Find(id);
            if (images == null)
            {
                return HttpNotFound();
            }
            return View(images);
        }

        // GET: Admin/Images/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Images/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create( Images images,HttpPostedFileBase ImageUrl)
        {
            if (ModelState.IsValid)
            {
                string imagename = "no-photo.jpg";
                if (ImageUrl != null)
                {
                    imagename = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(ImageUrl.FileName);
                    ImageUrl.SaveAs(Server.MapPath("/ImageGallery/Image/" + imagename));
                    //------------------------Resize Image------------------------------
                    ImageResizer img = new ImageResizer();
                    img.Resize(Server.MapPath("/ImageGallery/Image/" + imagename), Server.MapPath("/ImageGallery/Thumb/" + imagename));
                }
                images.ImageUrl = imagename;
                images.CreateDate=DateTime.Now;
                db.Images.Add(images);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(images);
        }

        // GET: Admin/Images/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Images images = db.Images.Find(id);
            if (images == null)
            {
                return HttpNotFound();
            }
            return View(images);
        }

        // POST: Admin/Images/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit( Images images,HttpPostedFileBase ImageUrl)
        {
            if (ModelState.IsValid)
            {
                if (ImageUrl != null)
                {
                    if (images.ImageUrl != "no-photo.jpg")
                    {
                        if (System.IO.File.Exists(Server.MapPath("/ImageGallery/Image/" + images.ImageUrl)))
                            System.IO.File.Delete(Server.MapPath("/ImageGallery/Image/" + images.ImageUrl));

                        if (System.IO.File.Exists(Server.MapPath("/ImageGallery/Thumb/" + images.ImageUrl)))
                            System.IO.File.Delete(Server.MapPath("/ImageGallery/Thumb/" + images.ImageUrl));
                    }
                    images.ImageUrl = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(ImageUrl.FileName);
                    ImageUrl.SaveAs(Server.MapPath("/ImageGallery/Image/" + images.ImageUrl));
                    ImageResizer img = new ImageResizer();
                    img.Resize(Server.MapPath("/ImageGallery/Image/" + images.ImageUrl), Server.MapPath("/ImageGallery/Thumb/" + images.ImageUrl));
                }
                db.Entry(images).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(images);
        }

        // GET: Admin/Images/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Images images = db.Images.Find(id);
            if (images == null)
            {
                return HttpNotFound();
            }
            return View(images);
        }

        // POST: Admin/Images/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Images images = db.Images.Find(id);
            //-----------------------Delete Image ---------------------
            if (images.ImageUrl != "no-photo.jpg")
            {
                if (System.IO.File.Exists(Server.MapPath("/ImageGallery/Image/" + images.ImageUrl)))
                    System.IO.File.Delete(Server.MapPath("/ImageGallery/Image/" + images.ImageUrl));

                if (System.IO.File.Exists(Server.MapPath("/ImageGallery/Thumb/" + images.ImageUrl)))
                    System.IO.File.Delete(Server.MapPath("/ImageGallery/Thumb/" + images.ImageUrl));
            }
            db.Images.Remove(images);
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
