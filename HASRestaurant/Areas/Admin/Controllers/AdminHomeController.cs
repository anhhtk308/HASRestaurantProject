using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HASRestaurant.Areas.Admin.Controllers
{
    public class AdminHomeController : Controller
    {
        // GET: Admin/AdminHome
        public ActionResult Index()
        {
            ViewBag.weekNum = DateTime.Now.ToString("yyyy-MM-dd");
            Session.Remove("dateFirst");
            Session["dateFirst"] = DateTime.Now;
            return View();
        }
        [HttpPost]
        public ActionResult SearchDate(FormCollection fc)
        {
            string date = fc["week"].ToString();
            try
            {
                DateTime datefirst = DateTime.Parse(date);
                ViewBag.weekNum = datefirst.ToString("yyyy-MM-dd");
                Session.Remove("dateFirst");
                Session["dateFirst"] = datefirst;
                return View("Index");
            }
            catch (Exception)
            {
                ViewBag.weekNum = DateTime.Now.ToString("yyyy-MM-dd");
                ViewBag.note = "Date invalid!";
                return View("Index");
            }
           /* DateTime datefirst = DateTime.Parse(date);
            ViewBag.weekNum = datefirst.ToString("yyyy-MM-dd");
            Session.Remove("dateFirst");
            Session["dateFirst"] = datefirst;
            return View("Index");*/
        }
    }
}