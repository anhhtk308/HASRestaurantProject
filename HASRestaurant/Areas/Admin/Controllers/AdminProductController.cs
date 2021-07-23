using HASRestaurant.Context;
using HASRestaurant.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HASRestaurant.Areas.Admin.Controllers
{
    public class AdminProductController : Controller
    {
        PRN292_HASRestaurantEntities objModel = new PRN292_HASRestaurantEntities();
        // GET: Admin/AdminProduct
        public ActionResult Index(int? page)
        {
            var pageNumber = page ?? 1;
            var pageSize = 6;
            //var lstProduct = objModel.Products.ToList();
            var lstProduct = objModel.Products.OrderBy(n => n.ProductID).ToPagedList(pageNumber, pageSize);
            ViewBag.mess = TempData["mess"] as string;
            return View(lstProduct);
        }

        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.CategoryList = new SelectList(objModel.Categories, "CategoryID", "CategoryName");
            return View();
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(Product objProduct)
        {
            ViewBag.CategoryList = new SelectList(objModel.Categories, "CategoryID", "CategoryName");
            if (ModelState.IsValid)
            {
                var checkName = from r in objModel.Products where r.ProductName == objProduct.ProductName select r;
                if (checkName.ToList().Count == 0)
                {
                    objModel.Products.Add(objProduct);
                    objModel.SaveChanges();
                    TempData["mess"] = "Create successfull";
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.mess = "Product name already exist!!!";
                    return View(objProduct);
                }
            }
            return View(objProduct);
        }
        [HttpGet]
        public ActionResult Details(int id)
        {
            var objProduct = objModel.Products.Where(n => n.ProductID == id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objProduct = objModel.Products.Where(n => n.ProductID == id).FirstOrDefault();
            return View(objProduct);
        }
        [HttpPost]
        public ActionResult Delete(int id, Product objPro)
        {
            var objProduct = objModel.Products.Where(n => n.ProductID == id).FirstOrDefault();
            objPro = objProduct;
            objModel.Products.Remove(objPro);
            objModel.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var objProduct = objModel.Products.Where(n => n.ProductID == id).FirstOrDefault();
            ViewBag.CategoryList = new SelectList(objModel.Categories, "CategoryID", "CategoryName");
            return View(objProduct);
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Edit(Product objProduct)
        {
            ViewBag.CategoryList = new SelectList(objModel.Categories, "CategoryID", "CategoryName");
            if (ModelState.IsValid)
            {
                objModel.Entry(objProduct).State = EntityState.Modified;
                objModel.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(objProduct);
        }

    }
}