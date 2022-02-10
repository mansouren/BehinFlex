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
using System.Text;
using System.Web.Mvc.Html;
using BehinFlex.Classes;
using NPOI.HSSF.UserModel;


namespace BehinFlex.Areas.Admin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class UsersController : Controller
    {
        private behinfarazEntities db = new behinfarazEntities();

        // GET: Admin/Users
        public ActionResult Index()
        {
            var users = db.Users.Include(u => u.CustomerType).Include(u => u.Roles);
            return View(users.ToList());
        }

        // GET: Admin/Users/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Users users = db.Users.Find(id);
            if (users == null)
            {
                return HttpNotFound();
            }
            return View(users);
        }

        // GET: Admin/Users/Create
        public ActionResult Create()
        {
            ViewBag.CustomerTypeID = new SelectList(db.CustomerType, "CustomerTypeID", "CustomerTypeTitle");
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "RoleName");
            return View();
        }

        // POST: Admin/Users/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Users users)
        {
            if (ModelState.IsValid && !db.Users.Any(u => u.UserName.Equals(users.UserName)))
            {
                users.CreateDate = DateTime.Now;
                db.Users.Add(users);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ModelState.AddModelError("UserName", "نام کاربری وارد شده تکراری است");
            ViewBag.CustomerTypeID = new SelectList(db.CustomerType, "CustomerTypeID", "CustomerTypeTitle", users.CustomerTypeID);
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "RoleName", users.RoleID);
            return View(users);
        }

        // GET: Admin/Users/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Users users = db.Users.Find(id);
            if (users == null)
            {
                return HttpNotFound();
            }
            ViewBag.CustomerTypeID = new SelectList(db.CustomerType, "CustomerTypeID", "CustomerTypeTitle", users.CustomerTypeID);
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "RoleName", users.RoleID);
            return View(users);
        }

        // POST: Admin/Users/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Users users)
        {
            
            if (!ModelState.IsValid )
            {
                var test = db.Users.FirstOrDefault(u=>u.UserID==users.UserID);
                if (db.Users.Any(u =>u.UserName.Equals(users.UserName) && u.UserID!=test.UserID))
                {
                    ModelState.AddModelError("UserName", "نام کاربری وارد شده تکراری است");
                    ViewBag.CustomerTypeID = new SelectList(db.CustomerType, "CustomerTypeID", "CustomerTypeTitle", users.CustomerTypeID);
                    ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "RoleName", users.RoleID);
                    return View(users);
                    
                }

            }
            db.Entry(users).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Admin/Users/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Users users = db.Users.Find(id);
            if (users == null)
            {
                return HttpNotFound();
            }
            return View(users);
        }

        // POST: Admin/Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Users users = db.Users.Find(id);
            db.Bonuses.Where(b => b.UserId == users.UserID).ToList().ForEach(b => db.Bonuses.Remove(b));
            db.DiscountCodes.Where(d => d.UserID == users.UserID).ToList().ForEach(d => db.DiscountCodes.Remove(d));
            db.Comments.Where(c => c.UserID == users.UserID).ToList().ForEach(c => db.Comments.Remove(c));
            //db.Orders.Where(o => o.UserId == users.UserID).ToList().ForEach(o => db.Orders.Remove(o));
            //db.OrderDetails.Where(od => od.OrderId == users.Orders.OrderId).ToList().ForEach(od => db.OrderDetails.Remove(od));
            if (db.Orders.Any(o => o.UserId == users.UserID))
            {
                ViewBag.Message = "برای حذف کاربر ابتدا پیش فاکتورهای مربوط به این کاربر را حذف کنید";
                return View(users);
            }
            db.Users.Remove(users);
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
            IEnumerable users = db.Users.ToDataSourceResult(request).Data;

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
            headerRow.CreateCell(0).SetCellValue("نام و نام خانوادگی");
            headerRow.CreateCell(1).SetCellValue("موبایل");
            headerRow.CreateCell(2).SetCellValue("ایمیل");
            headerRow.CreateCell(3).SetCellValue("نوع مشتری");

            //(Optional) freeze the header row so it is not scrolled
            sheet.CreateFreezePane(0, 1, 0, 1);

            int rowNumber = 1;

            //Populate the sheet with values from the grid data
            foreach (Users user in users)
            {
                //Create a new row
                var row = sheet.CreateRow(rowNumber++);

                //Set values for the cells
                row.CreateCell(0).SetCellValue(user.FullName);
                row.CreateCell(1).SetCellValue(user.Phone);
                row.CreateCell(2).SetCellValue(user.Email);
                row.CreateCell(3).SetCellValue(user.CustomerType.CustomerTypeTitle);
            }

            //Write the workbook to a memory stream
            MemoryStream output = new MemoryStream();
            workbook.Write(output);

            //Return the result to the end user

            return File(output.ToArray(),   //The binary data of the XLS file
                "application/vnd.ms-excel", //MIME type of Excel files
                "ExcelExport.xls");     //Suggested file name in the "Save as" dialog which will be displayed to the end user

        }

        public ActionResult SendSmss()
        {
            var smsService = new SmsService.SmsService();
            ViewBag.Credit = smsService.GetCredit();
            ViewBag.SmsType = EnumHelper.GetSelectList(typeof(SmsType));
            return View();
        }
        [HttpPost]
        public ActionResult SendSmss(SmsInput smsInput)
        {
            if (ModelState.IsValid)
            {
                var smsService = new SmsService.SmsService();
                var response = smsService.SendSms(smsInput);
                return JavaScript(script: "alert('" + response.message + "');");
            }
            ViewBag.SmsType = EnumHelper.GetSelectList(typeof(SmsType));
            return JavaScript(script: "alert('اطلاعات مورد نیاز را وارد کنید');");
        }

    }
}
