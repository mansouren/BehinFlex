using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BehinFlex.Models;
using InsertShowImage;
using Kendo.Mvc.UI;

namespace BehinFlex.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class NewsController : Controller
    {
        private behinfarazEntities db = new behinfarazEntities();

        // GET: Admin/News
        public ActionResult Index()
        {
            return View(db.News.ToList());
        }

        // GET: Admin/News/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // GET: Admin/News/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/News/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(News news, HttpPostedFileBase NewsImageUrl,HttpPostedFileBase NewsVideoUrl)
        {
            if (ModelState.IsValid)
            {
                    string imagename = "no-photo.jpg";
                    if (NewsImageUrl != null)
                    {
                        imagename = Guid.NewGuid().ToString().Replace("-", "") +
                                    Path.GetExtension(NewsImageUrl.FileName);
                        NewsImageUrl.SaveAs(Server.MapPath("/NewsImage/Images/" + imagename));
                        //------------------------Resize Image------------------------------
                        ImageResizer img = new ImageResizer();
                        img.Resize(Server.MapPath("/NewsImage/Images/" + imagename),
                            Server.MapPath("/NewsImage/Thumb/" + imagename));
                    }

                string videoname;
                 
                if (NewsVideoUrl != null) 
                {
                    //if ( NewsVideoUrl.ContentLength <= 1024 * 1024 * 100 && Path.GetExtension(NewsVideoUrl.FileName) == ".mp4")
                    //{ 
                    videoname = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(NewsVideoUrl.FileName);
                    NewsVideoUrl.SaveAs(Server.MapPath("/Videos/NewsVideos/" + videoname));
                    news.NewsVideoUrl = videoname;
                    //}

                    //else 
                    //{
                    // ModelState.Clear();
                    // ViewBag.Message = "لطفا ویدیو را با پسوند mp4 ارسال کنید ";
                    // return View(news);
                    //}

                }
                    
                    news.NewsImageUrl = imagename;
                    //news.CreateDate = DateTime.Now;
                    
                //-------------Seminar------------------------
                
                if (news.IsSeminar)
                {
                    db.Seminarparticipants.Add(new Seminarparticipants()
                    {
                        NewsID = news.NewsID,
                        FullName = String.Empty,
                        Phone = String.Empty

                    });
                }
               
                
                    db.News.Add(news);
                    db.SaveChanges();
          

                return RedirectToAction("Index");
                }

                return View(news);
            }
        

        // GET: Admin/News/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // POST: Admin/News/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit( News news,HttpPostedFileBase NewsImageUrl, HttpPostedFileBase NewsVideoUrl)
        {

            if (ModelState.IsValid)
            {
                if(NewsImageUrl != null)
                { 
                if (news.NewsImageUrl != "no-photo.jpg")
                {
                    if (System.IO.File.Exists(Server.MapPath("/NewsImage/Images/" + news.NewsImageUrl)))
                        System.IO.File.Delete(Server.MapPath("/NewsImage/Images/" + news.NewsImageUrl));

                    if (System.IO.File.Exists(Server.MapPath("/NewsImage/Thumb/" + news.NewsImageUrl)))
                        System.IO.File.Delete(Server.MapPath("/NewsImage/Thumb/" + news.NewsImageUrl));
                }
                news.NewsImageUrl = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(NewsImageUrl.FileName);
                NewsImageUrl.SaveAs(Server.MapPath("/NewsImage/Images/" + news.NewsImageUrl));
                ImageResizer img = new ImageResizer();
                img.Resize(Server.MapPath("/NewsImage/Images/" + news.NewsImageUrl), Server.MapPath("/NewsImage/Thumb/" + news.NewsImageUrl));
                }
                //-------------------------video----------------------------------------------------
                if (NewsVideoUrl != null)
                {
                    //if (NewsVideoUrl.ContentLength <= 1024 * 1024 * 100 && Path.GetExtension(NewsVideoUrl.FileName) == ".mp4")

                    //{
                        if (news.NewsVideoUrl != "no-video.jpg")
                        {
                            if (System.IO.File.Exists(Server.MapPath("/Videos/NewsVideos/" + news.NewsVideoUrl)))
                                System.IO.File.Delete(Server.MapPath("/Videos/NewsVideos/" + news.NewsVideoUrl));
                        }

                        news.NewsVideoUrl = Guid.NewGuid().ToString().Replace("-", "") +
                                            Path.GetExtension(NewsVideoUrl.FileName);
                        NewsVideoUrl.SaveAs(Server.MapPath("/Videos/NewsVideos/" + news.NewsVideoUrl));

                    //}

                    //else
                    //{
                    //    ModelState.Clear();
                    //    ViewBag.Message = "لطفا ویدیو را با پسوند mp4 ارسال کنید ";
                    //    return View(news);
                    //}

                }
               

                //-----------------Seminar------------------------------------
                db.Seminarparticipants.Where(s => s.NewsID == news.NewsID).ToList().ForEach(s => db.Seminarparticipants.Remove(s));
                if (news.IsSeminar)
                {
                    db.Seminarparticipants.Add(new Seminarparticipants()
                    {
                        NewsID = news.NewsID,
                        FullName = String.Empty,
                        Phone = String.Empty

                    });
                }

                db.Entry(news).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(news);
        }

        // GET: Admin/News/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            News news = db.News.Find(id);
            if (news == null)
            {
                return HttpNotFound();
            }
            return View(news);
        }

        // POST: Admin/News/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            News news = db.News.Find(id);
            //-----------------------Delete NewsImage when News Deleted---------------------
            if (news.NewsImageUrl != "no-photo.jpg")
            {
                if(System.IO.File.Exists(Server.MapPath("/NewsImage/Images/"+news.NewsImageUrl)))
                 System.IO.File.Delete(Server.MapPath("/NewsImage/Images/" + news.NewsImageUrl));

                if (System.IO.File.Exists(Server.MapPath("/NewsImage/Thumb/" + news.NewsImageUrl)))
                    System.IO.File.Delete(Server.MapPath("/NewsImage/Thumb/" + news.NewsImageUrl));
            }
            //---------------------Delete Videos--------------------------------------
            if (news.NewsVideoUrl != null)
            {
                if (System.IO.File.Exists(Server.MapPath("/Videos/NewsVideos/" + news.NewsVideoUrl)))
                    System.IO.File.Delete(Server.MapPath("/Videos/NewsVideos/" + news.NewsVideoUrl));
            }
            //---------------------Delete SeminarParticipants-------------------------
            db.Seminarparticipants.Where(s => s.NewsID == news.NewsID).ToList().ForEach(s=>db.Seminarparticipants.Remove(s));

            db.News.Remove(news);
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
