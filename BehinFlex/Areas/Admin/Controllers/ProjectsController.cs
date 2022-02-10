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
    public class ProjectsController : Controller
    {
        private behinfarazEntities db = new behinfarazEntities();

        // GET: Admin/Projects
        public ActionResult Index()
        {
            return View(db.Projects.ToList());
        }

        // GET: Admin/Projects/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Projects projects = db.Projects.Find(id);
            if (projects == null)
            {
                return HttpNotFound();
            }
            return View(projects);
        }

        // GET: Admin/Projects/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Projects/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create( Projects projects, HttpPostedFileBase ProjectImageUrl)
        {
            if (ModelState.IsValid)
            {
                string imagename = "no-photo.jpg";
                if (ProjectImageUrl != null)
                {
                    imagename = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(ProjectImageUrl.FileName);
                    ProjectImageUrl.SaveAs(Server.MapPath("/ProjectImages/Image/" + imagename));
                    //------------------------Resize Image------------------------------
                    ImageResizer img = new ImageResizer();
                    img.Resize(Server.MapPath("/ProjectImages/Image/" + imagename), Server.MapPath("/ProjectImages/Thumb/" + imagename));
                }
                projects.ProjectImageUrl = imagename;
                db.Projects.Add(projects);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(projects);
        }

        // GET: Admin/Projects/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Projects projects = db.Projects.Find(id);
            if (projects == null)
            {
                return HttpNotFound();
            }
            return View(projects);
        }

        // POST: Admin/Projects/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit( Projects projects, HttpPostedFileBase ProjectImageUrl)
        {
            if (ModelState.IsValid)
            {
                if (ProjectImageUrl != null)
                {
                    if (projects.ProjectImageUrl != "no-photo.jpg")
                    {
                        if (System.IO.File.Exists(Server.MapPath("/ProjectImages/Image/" + projects.ProjectImageUrl)))
                            System.IO.File.Delete(Server.MapPath("/ProjectImages/Image/" + projects.ProjectImageUrl));

                        if (System.IO.File.Exists(Server.MapPath("/ProjectImages/Thumb/" + projects.ProjectImageUrl)))
                            System.IO.File.Delete(Server.MapPath("/ProjectImages/Thumb/" + projects.ProjectImageUrl));
                    }
                    projects.ProjectImageUrl = Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(ProjectImageUrl.FileName);
                    ProjectImageUrl.SaveAs(Server.MapPath("/ProjectImages/Image/" + projects.ProjectImageUrl));
                    ImageResizer img = new ImageResizer();
                    img.Resize(Server.MapPath("/ProjectImages/Image/" + projects.ProjectImageUrl), Server.MapPath("/ProjectImages/Thumb/" + projects.ProjectImageUrl));
                }
                db.Entry(projects).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(projects);
        }

        // GET: Admin/Projects/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Projects projects = db.Projects.Find(id);
            if (projects == null)
            {
                return HttpNotFound();
            }
            return View(projects);
        }

        // POST: Admin/Projects/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Projects projects = db.Projects.Find(id);
            if (projects.ProjectImageUrl != "no-photo.jpg")
            {
                if (System.IO.File.Exists(Server.MapPath("/ProjectImages/Image/" + projects.ProjectImageUrl)))
                    System.IO.File.Delete(Server.MapPath("/ProjectImages/Image/" + projects.ProjectImageUrl));

                if (System.IO.File.Exists(Server.MapPath("/ProjectImages/Thumb/" + projects.ProjectImageUrl)))
                    System.IO.File.Delete(Server.MapPath("/ProjectImages/Thumb/" + projects.ProjectImageUrl));
            }
            db.Projects.Remove(projects);
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
