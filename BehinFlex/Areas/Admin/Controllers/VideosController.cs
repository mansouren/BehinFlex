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

namespace BehinFlex.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class VideosController : Controller
    {
        private behinfarazEntities db = new behinfarazEntities();

        // GET: Admin/Videos
        public ActionResult Index()
        {
            return View(db.Videos.ToList());
        }

        // GET: Admin/Videos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Videos videos = db.Videos.Find(id);
            if (videos == null)
            {
                return HttpNotFound();
            }
            return View(videos);
        }

        // GET: Admin/Videos/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Videos/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Videos videos,HttpPostedFileBase VideoUrl)
        {
            if (ModelState.IsValid)
            {
                //int byteCount = VideoUrl.ContentLength;
                string videoname;
                if (VideoUrl != null )
                {
                    videoname = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(VideoUrl.FileName);
                    VideoUrl.SaveAs(Server.MapPath("/Videos/galleryvideos/" + videoname));
                    videos.VideoUrl = videoname;
                }

               
                
                videos.CreateDate=DateTime.Now;
                db.Videos.Add(videos);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
          
            return View(videos);
        }

        // GET: Admin/Videos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Videos videos = db.Videos.Find(id);
            if (videos == null)
            {
                return HttpNotFound();
            }
            return View(videos);
        }

        // POST: Admin/Videos/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Videos videos, HttpPostedFileBase VideoUrl)
        {
            if (ModelState.IsValid)
            {
                if (VideoUrl != null)
                {
                    if (videos.VideoUrl != "no-video.jpg")
                    {
                        if (System.IO.File.Exists(Server.MapPath("/Videos/galleryvideos/" + videos.VideoUrl)))
                            System.IO.File.Delete(Server.MapPath("/Videos/galleryvideos/" + videos.VideoUrl));
                    }

                    videos.VideoUrl = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(VideoUrl.FileName);
                    VideoUrl.SaveAs(Server.MapPath("/Videos/galleryvideos/" + videos.VideoUrl));

                }
              
                db.Entry(videos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(videos);
        }

        // GET: Admin/Videos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Videos videos = db.Videos.Find(id);
            if (videos == null)
            {
                return HttpNotFound();
            }
            return View(videos);
        }

        // POST: Admin/Videos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Videos videos = db.Videos.Find(id);
            if (videos.VideoUrl != null)
            {
                if (System.IO.File.Exists(Server.MapPath("/Videos/galleryvideos/" + videos.VideoUrl)))
                    System.IO.File.Delete(Server.MapPath("/Videos/galleryvideos/" + videos.VideoUrl));
            }
            db.Videos.Remove(videos);
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
