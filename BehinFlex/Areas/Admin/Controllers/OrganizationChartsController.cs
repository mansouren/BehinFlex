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
    public class OrganizationChartsController : Controller
    {
        private behinfarazEntities db = new behinfarazEntities();

        // GET: Admin/OrganizationCharts
        public ActionResult Index()
        {
            return View(db.OrganizationChart.ToList());
        }

        // GET: Admin/OrganizationCharts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrganizationChart organizationChart = db.OrganizationChart.Find(id);
            if (organizationChart == null)
            {
                return HttpNotFound();
            }
            return View(organizationChart);
        }

        // GET: Admin/OrganizationCharts/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/OrganizationCharts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OrgChartID,OrgChartPost,OrgChartFullName,OrgChartPhone,OrgChartEmail,OrgChartTelegramID")] OrganizationChart organizationChart)
        {
            if (ModelState.IsValid)
            {
                db.OrganizationChart.Add(organizationChart);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(organizationChart);
        }

        // GET: Admin/OrganizationCharts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrganizationChart organizationChart = db.OrganizationChart.Find(id);
            if (organizationChart == null)
            {
                return HttpNotFound();
            }
            return View(organizationChart);
        }

        // POST: Admin/OrganizationCharts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OrgChartID,OrgChartPost,OrgChartFullName,OrgChartPhone,OrgChartEmail,OrgChartTelegramID")] OrganizationChart organizationChart)
        {
            if (ModelState.IsValid)
            {
                db.Entry(organizationChart).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(organizationChart);
        }

        // GET: Admin/OrganizationCharts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrganizationChart organizationChart = db.OrganizationChart.Find(id);
            if (organizationChart == null)
            {
                return HttpNotFound();
            }
            return View(organizationChart);
        }

        // POST: Admin/OrganizationCharts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            OrganizationChart organizationChart = db.OrganizationChart.Find(id);
            db.OrganizationChart.Remove(organizationChart);
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
