using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BehinFlex.Models;
using CaptchaMvc.HtmlHelpers;
using System.Web.Security;
using BehinFlex.Classes;

namespace BehinFlex.Controllers
{
    public class AccountController : Controller
    {
        behinfarazEntities database = new behinfarazEntities();
        // GET: Account
        public ActionResult Register()
        {
            return View();
        }

        //Post: Account
        [HttpPost]
        public ActionResult Register(RegisterViewModel register)
        {
            var username = database.Users.Any(u => u.UserName == register.UserName.Trim().ToLower());
            if (ModelState.IsValid && !username)
            {
                if (this.IsCaptchaValid("تصویر امنیتی وارد شده اشتباه است"))
                {
                    Users users = new Users()
                    {
                        UserName = register.UserName.Trim().ToLower(),
                        Password = register.Pass,
                        FullName = register.FullName.Trim().ToLower(),
                        Email = register.Email.Trim().ToLower(),
                        Phone = register.Phone,
                        RoleID = 2,
                        CustomerTypeID = 3,
                        CreateDate = DateTime.Now
                    };
                    
                   
                    database.Users.Add(users);
                    database.SaveChanges();
                    return View("RegisterSuccess");
                }
                else
                {
                    ModelState.AddModelError("CaptchaInputText", "تصویر امنیتی وارد شده اشتباه است");
                    return View(register);
                }

            }
            ModelState.AddModelError("UserName", "این نام کاربری قبلا ثبت شده است");
            return View(register);
        }


        //Get
        public ActionResult Login()
        {
            return View();
        }

        //Post

        [HttpPost]

        public ActionResult Login(LoginViewModel login, string returnurl = "")
        {
            if (ModelState.IsValid)
            {
                var QLogin = database.Users.FirstOrDefault(u => u.UserName == login.UserName.Trim().ToLower() && u.Password == login.Password);
                if (QLogin != null)
                {
                    FormsAuthentication.SetAuthCookie(login.UserName, login.Remember);
                    if (returnurl != "")
                    {
                        return Redirect(returnurl);
                    }
                    return Redirect("/");
                }

                else
                {
                    ModelState.AddModelError("UserName", "کاربری یافت نشد");
                }
            }


            return View(login);
        }

        public ActionResult Signout()
        {
            FormsAuthentication.SignOut();
            return Redirect("/");

        }
        [HttpPost]
        public ActionResult SubmitRefCode(string refcode)
        {
            string[] splitref = refcode.Trim().ToLower().Split('f');

            if (splitref.Any(s => s.Trim() != "") && refcode.Trim().ToLower().Contains("f"))
            {
                if (database.RefCode.Any(r => r.Ref_Code == refcode.Trim().ToLower()))
                {
                    var refid = database.RefCode.Single(r => r.Ref_Code == refcode.Trim().ToLower()).RefID;

                    var userid = Convert.ToInt32(splitref[1].Trim());
                    if (database.Users.Any(u => u.UserID == userid) && !database.Bonuses.Any(b => b.RefID == refid) &&
                        database.RefCode.Any(r => r.Ref_Code == refcode.Trim().ToLower()))
                    {
                        Bonuses bonuses = new Bonuses()
                        {
                            UserId = userid,
                            Bonus = 10,
                            RefID = refid
                        };
                        database.Bonuses.Add(bonuses);
                        database.SaveChanges();
                        ViewBag.Success = "کد معرف با موفقیت ثبت گردید";

                    }
                }
            }
            else
                    {
                        ViewBag.Down = "کد معرف معتبر نمی باشد";

                    }
                
            
            return View("Register");
        }
    }
}