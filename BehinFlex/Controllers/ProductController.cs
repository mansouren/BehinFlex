using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BehinFlex.Models;
using System.Web.Security;


namespace BehinFlex.Controllers
{

    public class ProductController : Controller
    {
        behinfarazEntities database = new behinfarazEntities();
        // GET: Product
        public ActionResult ShowGroup()
        {
            return PartialView(database.ProductBrand.ToList());
        }

        public ActionResult ShowProductByBrand(int id)
        {
            var productviewmodel = new ProductViewModel();
            productviewmodel.IEProductGroup = database.ProductGroup.Where(p => p.ProductBrandID == id);
            //productviewmodel.IEProductsubgroup = database.ProductSubGroup.Where(p => p.ProductGroupID == id);
            productviewmodel.IEProduct = database.Products.Where(g => g.ProductSubGroup.ProductGroup.ProductBrandID == id);
            productviewmodel.Product = database.Products.First(s => s.ProductSubGroup.ProductGroup.ProductBrandID == id);
            return View(productviewmodel);
        }
        public ActionResult ShowProductByBrandMenu(int id)
        {
            var productviewmodel = new ProductViewModel();
            productviewmodel.IEProductGroup = database.ProductGroup.Where(p => p.ProductBrandID == id);
            //productviewmodel.IEProductsubgroup = database.ProductSubGroup.Where(p => p.ProductGroupID == id);
            productviewmodel.IEProduct = database.Products.Where(g => g.ProductSubGroup.ProductGroup.ProductBrandID == id);
            productviewmodel.Product = database.Products.First(s => s.ProductSubGroup.ProductGroup.ProductBrandID == id);
            return View(productviewmodel);
        }

        public ActionResult ShowProductByHeadGroup(int id)
        {
            var productviewmodel = new ProductViewModel();
            productviewmodel.IEProductsubgroup = database.ProductSubGroup.Where(p => p.ProductGroupID == id);
            productviewmodel.IEProduct = database.Products.Where(g => g.ProductSubGroup.ProductGroupID == id);
            productviewmodel.Product = database.Products.First(s => s.ProductSubGroup.ProductGroupID == id);
            return View(productviewmodel);
        }

        public ActionResult ShowProductByHeadGroupMenu(int id)
        {
            var productviewmodel = new ProductViewModel();
            productviewmodel.IEProductsubgroup = database.ProductSubGroup.Where(p => p.ProductGroupID == id);
            productviewmodel.IEProduct = database.Products.Where(g => g.ProductSubGroup.ProductGroupID == id);
            productviewmodel.Product = database.Products.First(s => s.ProductSubGroup.ProductGroupID == id);
            return View(productviewmodel);
        }

        public ActionResult ShowProductByGroup(int id)
        {
            var ProductViewModel = new ProductViewModel();
           
            ProductViewModel.IEProduct = database.Products.Where(p => p.ProductSubGroupID == id);

            ProductViewModel.Product = database.Products.First(p => p.ProductSubGroupID == id);
            return View(ProductViewModel);
        }

        public ActionResult ShowProductByGroupMenu(int id)
        {
            var ProductViewModel = new ProductViewModel();

            ProductViewModel.IEProduct = database.Products.Where(p => p.ProductSubGroupID == id);

            ProductViewModel.Product = database.Products.First(p => p.ProductSubGroupID == id);
            return View(ProductViewModel);
        }

        public ActionResult ShowProduct(int id)
        {
            var ProductViewModel = new ProductViewModel();

            ProductViewModel.IEProduct = database.Products.Where(p => p.ProductID == id);
            ProductViewModel.Product = database.Products.Find(id);
            return View(ProductViewModel);

        }

        public ActionResult CommentForm(int id)
        {
            ViewData["ProductID"] = new SelectList(database.Products, "ProductID", "ProductTitle");
            ViewData["UserID"] = new SelectList(database.Users, "UserID", "UserName");
            // return View(database.Comments.FirstOrDefault(c => c.ProductID == id));
            var commentproductviewmodel = new CommentProductViewModel();
            commentproductviewmodel.Comments = database.Comments.FirstOrDefault(c => c.ProductID == id);
            commentproductviewmodel.IEProducts = database.Products.ToList();
            return View(commentproductviewmodel);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CommentForm(Comments comments, int id)
        {
            int userid = database.Users.First(u => u.UserName == User.Identity.Name).UserID;
            if (ModelState.IsValid)
            {

                comments.UserID = userid;
                comments.ProductID = id;
                comments.CommentDate = DateTime.Now;
                comments.CommentText = comments.CommentText;
                comments.IsApproved = false;
                database.Comments.Add(comments);
                database.SaveChanges();
                return View("CommentSubmitSuccess");
            }
            ViewBag.ProductID = new SelectList(database.Products, "ProductID", "ProductTitle", comments.ProductID);
            ViewBag.UserID = new SelectList(database.Users, "UserID", "UserName", comments.UserID);
            return View("CommentForm");
        }



    }
}