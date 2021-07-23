using HASRestaurant.Context;
using HASRestaurant.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HASRestaurant.Controllers
{
    public class MenuController : Controller
    {
        PRN292_HASRestaurantEntities objModel = new PRN292_HASRestaurantEntities();
        // GET: Menu
        public ActionResult Index(int? Id, int? page, string CurrentFilter, string SearchString)
        {
            ViewBag.mess = TempData["mess"] as string;
            var pageNumber = page ?? 1;
            var pageSize = 6;
            Product_Category p = new Product_Category();
            var lstCategory = objModel.Categories.ToList();
            p.ListCategory = lstCategory;
            if (SearchString != null)
            {
                page = 1;
            }
            else
            {
                SearchString = CurrentFilter;
            }
            ViewBag.CurrentFilter = SearchString;
            if (string.IsNullOrEmpty(SearchString))
            {
                if (Id == null || Id == 0)
                {
                    var lstProduct = objModel.Products.OrderByDescending(n => n.ProductID).ToPagedList(pageNumber, pageSize);
                    p.ListProduct = lstProduct;
                    return View(p);
                }
                else
                {
                    ViewBag.Id = Id;
                    var lstProduct = objModel.Products.OrderByDescending(n => n.ProductID).Where(n => n.CategoryID == Id).ToPagedList(pageNumber, pageSize);
                    p.ListProduct = lstProduct;
                    return View(p);
                }
            }
            else
            {
                if (Id == null || Id == 0)
                {
                    var lstProduct = objModel.Products.Where(n => n.ProductName.Contains(SearchString)).OrderByDescending(n => n.ProductID).ToPagedList(pageNumber, pageSize);
                    p.ListProduct = lstProduct;
                    return View(p);
                }
                else
                {
                    ViewBag.Id = Id;
                    var lstProduct = objModel.Products.OrderByDescending(n => n.ProductID).Where(n => n.CategoryID == Id && n.ProductName.Contains(SearchString)).ToPagedList(pageNumber, pageSize);
                    p.ListProduct = lstProduct;
                    return View(p);
                }
            }
        }
       
    }
}