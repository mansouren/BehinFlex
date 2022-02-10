using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BehinFlex.Models;
using BehinFlex.Models.MetadataClasses;
using Kendo.Mvc.Extensions;

namespace BehinFlex.Controllers
{
    public class NewssController : Controller
    {
        behinfarazEntities database = new behinfarazEntities();
        // GET: News

        public ActionResult ShowNews()
        {
            return View(database.News.OrderByDescending(n=>n.CreateDate).ToList());
        }

        public ActionResult ShowNewsDetail(int id)
        {
            return View(database.News.Find(id));
        }

        public ActionResult ParticipantForm(int id)
        {
            ViewData["NewsID"] = new SelectList(database.News, "NewsID", "NewsTitle");
            return View(database.Seminarparticipants.FirstOrDefault(s => s.NewsID == id));

        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ParticipantForm( Seminarparticipants seminarparticipant,int id)
        {
            if (ModelState.IsValid)
            {
                seminarparticipant.NewsID = id;
                seminarparticipant.FullName = seminarparticipant.FullName.Trim().ToLower();
                seminarparticipant.Phone = seminarparticipant.Phone;
                seminarparticipant.Email = seminarparticipant.Email;
                database.Seminarparticipants.Add(seminarparticipant);
                database.SaveChanges();
                return View("ParticipationSuccessInSeminar");
            }
            ViewBag.NewsID= new SelectList(database.News, "NewsID", "NewsTitle");
            return View("ParticipantForm");
        }
    }
}