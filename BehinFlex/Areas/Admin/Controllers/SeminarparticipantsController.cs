using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BehinFlex.Models;
using Kendo.Mvc.Extensions;
using Kendo.Mvc.UI;
using NPOI.HSSF.UserModel;

namespace BehinFlex.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class SeminarparticipantsController : Controller
    {
        private behinfarazEntities db = new behinfarazEntities();

        // GET: Admin/Seminarparticipants
        public ActionResult Index()
        {
            var seminarparticipants = db.Seminarparticipants.Include(s => s.News);
            return View(seminarparticipants.Where(s=>s.FullName!=null && s.Phone != String.Empty).ToList());
        }

        // GET: Admin/Seminarparticipants/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Seminarparticipants seminarparticipants = db.Seminarparticipants.Find(id);
            if (seminarparticipants == null)
            {
                return HttpNotFound();
            }
            return View(seminarparticipants);
        }

        // GET: Admin/Seminarparticipants/Create
        public ActionResult Create()
        {
            ViewBag.NewsID = new SelectList(db.News, "NewsID", "NewsTitle");
            return View();
        }

        // POST: Admin/Seminarparticipants/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SeminarID,NewsID,FullName,Phone,Email")] Seminarparticipants seminarparticipants)
        {
            if (ModelState.IsValid)
            {
                db.Seminarparticipants.Add(seminarparticipants);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.NewsID = new SelectList(db.News, "NewsID", "NewsTitle", seminarparticipants.NewsID);
            return View(seminarparticipants);
        }

        // GET: Admin/Seminarparticipants/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Seminarparticipants seminarparticipants = db.Seminarparticipants.Find(id);
            if (seminarparticipants == null)
            {
                return HttpNotFound();
            }
            ViewBag.NewsID = new SelectList(db.News.Where(s=>s.IsSeminar==true), "NewsID", "NewsTitle", seminarparticipants.NewsID);
            return View(seminarparticipants);
        }

        // POST: Admin/Seminarparticipants/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SeminarID,NewsID,FullName,Phone,Email")] Seminarparticipants seminarparticipants)
        {
            if (ModelState.IsValid)
            {
                db.Entry(seminarparticipants).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.NewsID = new SelectList(db.News, "NewsID", "NewsTitle", seminarparticipants.NewsID);
            return View(seminarparticipants);
        }

        // GET: Admin/Seminarparticipants/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Seminarparticipants seminarparticipants = db.Seminarparticipants.Find(id);
            if (seminarparticipants == null)
            {
                return HttpNotFound();
            }
            return View(seminarparticipants);
        }

        // POST: Admin/Seminarparticipants/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Seminarparticipants seminarparticipants = db.Seminarparticipants.Find(id);
            db.Seminarparticipants.Remove(seminarparticipants);
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

        public FileResult Export([DataSourceRequest]DataSourceRequest request)
        {
            //Get the data representing the current grid state - page, sort and filter
            IEnumerable users = db.Seminarparticipants.Where(s=>s.FullName!=null && s.Phone!=String.Empty).ToDataSourceResult(request).Data;

            //Create new Excel workbook
            var workbook = new HSSFWorkbook();

            //Create new Excel sheet
            var sheet = workbook.CreateSheet();

            //(Optional) set the width of the columns
            sheet.SetColumnWidth(0, 10 * 256);
            sheet.SetColumnWidth(1, 50 * 256);
            sheet.SetColumnWidth(2, 50 * 256);
            sheet.SetColumnWidth(3, 50 * 256);

            //Create a header row
            var headerRow = sheet.CreateRow(0);

            //Set the column names in the header row
            headerRow.CreateCell(0).SetCellValue("سمینار");
            headerRow.CreateCell(1).SetCellValue("نام و نام خانوادگی");
            headerRow.CreateCell(2).SetCellValue("موبایل");
            headerRow.CreateCell(3).SetCellValue("ایمیل");

            //(Optional) freeze the header row so it is not scrolled
            sheet.CreateFreezePane(0, 1, 0, 1);

            int rowNumber = 1;

            //Populate the sheet with values from the grid data
            foreach (Seminarparticipants user in users)
            {
                //Create a new row
                var row = sheet.CreateRow(rowNumber++);

                //Set values for the cells
                row.CreateCell(0).SetCellValue(user.News.NewsTitle);
                row.CreateCell(1).SetCellValue(user.FullName);
                row.CreateCell(2).SetCellValue(user.Phone);
                row.CreateCell(3).SetCellValue(user.Email);
            }

            //Write the workbook to a memory stream
            MemoryStream output = new MemoryStream();
            workbook.Write(output);

            //Return the result to the end user

            return File(output.ToArray(),   //The binary data of the XLS file
                "application/vnd.ms-excel", //MIME type of Excel files
                "SeminarParticipants.xls");     //Suggested file name in the "Save as" dialog which will be displayed to the end user

        }
    }
}
