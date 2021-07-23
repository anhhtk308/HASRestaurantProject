using HASRestaurant.Context;
using HASRestaurant.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HASRestaurant.Controllers
{
    public class HomeController : Controller
    {
        PRN292_HASRestaurantEntities objModel = new PRN292_HASRestaurantEntities();
        public ActionResult Index()
        {
            var listBestSeller = objModel.Products.SqlQuery("with R as(select p.ProductID, sum(o.Quantity) SL from Product p, OrderDetail o where p.ProductID = o.ProductID group by p.ProductID) select top 5 p.* from R, Product p where R.ProductID = p.ProductID order by R.SL desc").ToList();
            Product_Reservation product_Reservation = new Product_Reservation();
            product_Reservation.ListProduct = listBestSeller;
            List<SelectListItem> numOfGuests = new List<SelectListItem>();
            numOfGuests.Add(new SelectListItem { Text = "Number Of Guests", Value = "0", Selected = true });
            numOfGuests.Add(new SelectListItem { Text = "1", Value = "1" });
            numOfGuests.Add(new SelectListItem { Text = "2", Value = "2" });
            numOfGuests.Add(new SelectListItem { Text = "3", Value = "3" });
            numOfGuests.Add(new SelectListItem { Text = "4", Value = "4" });
            ViewBag.numOfGuests = numOfGuests;

            List<SelectListItem> timeReservation = new List<SelectListItem>();
            timeReservation.Add(new SelectListItem { Text = "Time", Value = "0", Selected = true });
            timeReservation.Add(new SelectListItem { Text = "Breakfast", Value = "Breakfast"});
            timeReservation.Add(new SelectListItem { Text = "Lunch", Value = "Lunch" });
            timeReservation.Add(new SelectListItem { Text = "Dinner", Value = "Dinner" });
            ViewBag.timeReservation = timeReservation;
            product_Reservation.Reservation = new Reservation();
            ViewBag.mess = TempData["mess"] as string;
            if(Session["user"] != null)
            {
                Reservation r = new Reservation();
                r.Email = ((Account)Session["user"]).Email;
                product_Reservation.Reservation = r;
                return View(product_Reservation);
            }
            return View(product_Reservation);
        }

        [HttpPost]
        public ActionResult ReservationHome(Product_Reservation pr)
        {
            if (Session["user"] != null)
            {
                var listBestSeller = objModel.Products.SqlQuery("with R as(select p.ProductID, sum(o.Quantity) SL from Product p, OrderDetail o where p.ProductID = o.ProductID group by p.ProductID) select top 5 p.* from R, Product p where R.ProductID = p.ProductID order by R.SL desc").ToList();
                pr.ListProduct = listBestSeller;
                List<SelectListItem> numOfGuests = new List<SelectListItem>();
                numOfGuests.Add(new SelectListItem { Text = "Number Of Guests", Value = "0", Selected = true });
                numOfGuests.Add(new SelectListItem { Text = "1", Value = "1" });
                numOfGuests.Add(new SelectListItem { Text = "2", Value = "2" });
                numOfGuests.Add(new SelectListItem { Text = "3", Value = "3" });
                numOfGuests.Add(new SelectListItem { Text = "4", Value = "4" });
                ViewBag.numOfGuests = numOfGuests;

                List<SelectListItem> timeReservation = new List<SelectListItem>();
                timeReservation.Add(new SelectListItem { Text = "Time", Value = "Time", Selected = true });
                timeReservation.Add(new SelectListItem { Text = "Breakfast", Value = "Breakfast" });
                timeReservation.Add(new SelectListItem { Text = "Lunch", Value = "Lunch" });
                timeReservation.Add(new SelectListItem { Text = "Dinner", Value = "Dinner" });
                ViewBag.timeReservation = timeReservation;

                if (ModelState.IsValid)
                {
                    var checkDate = from r in objModel.Reservations where r.ReservationDate == pr.Reservation.ReservationDate && r.Time == pr.Reservation.Time select r;
                    if (pr.Reservation.ReservationDate < DateTime.Now)
                    {
                        ViewBag.mess = "The reservation date must be greater than the current date!";
                        //ModelState.AddModelError("checkDate", "The reservation date must be greater than the current date!");
                        return View("Index", pr);
                    } else if (pr.Reservation.NumOfGuests == 0)
                    {
                        ViewBag.mess = "Reservation Fail!!!";
                        ModelState.AddModelError("chooseNum", "Please choose the number of guests!");
                        return View("Index", pr);
                    } else if (pr.Reservation.Time == "Time") 
                    {
                        ViewBag.mess = "Reservation Fail!!!";
                        ModelState.AddModelError("chooseTime", "Please choose the time!");
                        return View("Index", pr);
                    } else if (checkDate.ToList().Count != 0)
                    {
                        ViewBag.mess = "Sorry, We are fully booked!!!";
                        //ModelState.AddModelError("duplicateDate", "We are fully booked!");
                        return View("Index", pr);
                    }
                    else
                    {
                        Account acc = (Account)Session["user"];
                        pr.Reservation.UserID = acc.UserID;
                        objModel.Reservations.Add(pr.Reservation);
                        objModel.SaveChanges();
                        TempData["mess"] = "Reservation successfully!!!";
                        return RedirectToAction("Index");
                    }
                }
                return View("Index", pr);
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }


    }
}