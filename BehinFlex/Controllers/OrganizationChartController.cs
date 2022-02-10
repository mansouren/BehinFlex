using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BehinFlex.Models;

namespace BehinFlex.Controllers
{
    public class OrganizationChartController : Controller
    {
        behinfarazEntities db=new behinfarazEntities();
        // GET: OrganizationChart
        public ActionResult AboutPost()
        {
            return View(db.OrganizationChart.ToList());
        }
    }
}