using HASRestaurant.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HASRestaurant.Areas.Admin.Controllers
{
    public class AdminReservationController : Controller
    {
        PRN292_HASRestaurantEntities objModel = new PRN292_HASRestaurantEntities();
        // GET: Admin/AdminReservation
        public ActionResult Index()
        {
            var lstRes = objModel.Reservations.ToList();
            return View(lstRes);
        }
        public ActionResult Details(int? id)
        {
            var lstRes = objModel.Reservations.Where(n => n.ReservationID == id).FirstOrDefault();
            return View(lstRes);
        }
    }
}