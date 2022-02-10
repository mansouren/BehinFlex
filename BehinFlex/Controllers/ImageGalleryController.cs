using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BehinFlex.Models;

namespace BehinFlex.Controllers
{
    public class ImageGalleryController : Controller
    {
        behinfarazEntities db=new behinfarazEntities();
        
        // GET: ImageGallery
        public ActionResult ShowGallery()
        {
            var tuple=new Tuple<IEnumerable<Images>, IEnumerable<Videos>>(new List<Images>(db.Images.ToList()),new List<Videos>(db.Videos.ToList()) );
            return View(tuple);
        }

        
    }
}