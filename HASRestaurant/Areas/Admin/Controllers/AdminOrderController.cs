using HASRestaurant.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HASRestaurant.Areas.Admin.Controllers
{
    public class AdminOrderController : Controller
    {
        PRN292_HASRestaurantEntities objModel = new PRN292_HASRestaurantEntities();
        // GET: Admin/AdminOrder
        public ActionResult Index()
        {
            var lstOrder = objModel.Orders.ToList();
            return View(lstOrder);
        }

        [HttpGet]
        public ActionResult Details(int? id)
        {
            var result = (from order in objModel.OrderDetails where order.OrderID == id select order).ToList();

            return View(result);
        }
    }
}