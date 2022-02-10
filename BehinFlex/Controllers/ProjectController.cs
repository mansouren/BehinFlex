using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BehinFlex.Models;

namespace BehinFlex.Controllers
{
    public class ProjectController : Controller
    {
        behinfarazEntities db=new behinfarazEntities();
        // GET: Project
        public ActionResult ShowProjects()
        {
            return View(db.Projects.ToList());
        }

        public ActionResult ShowProjectDetail(int id)
        {
            return View(db.Projects.Find(id));
        }
    }
}