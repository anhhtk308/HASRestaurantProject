using HASRestaurant.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace HASRestaurant.Controllers
{
    public class DetailController : Controller
    {
        PRN292_HASRestaurantEntities objModel = new PRN292_HASRestaurantEntities();
        // GET: Detail
        public ActionResult Index(int? Id)
        {
            if (Id == null) return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var objProduct = objModel.Products.Where(n => n.ProductID == Id).FirstOrDefault();
            return View(objProduct);
        }
    }
}