using HASRestaurant.Context;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace HASRestaurant.Controllers
{
    public class OrderHistoryController : Controller
    {
        PRN292_HASRestaurantEntities objModel = new PRN292_HASRestaurantEntities();
        // GET: OrderHistory
        public ActionResult Index(int? page)
        {
            var pageNumber = page ?? 1;
            var pageSize = 6;
            if (Session["user"] != null)
            {
                Account acc = (Account)Session["user"];
                var lstOrder = objModel.Orders.OrderByDescending(n => n.OrderDate).Where(n => n.Account.UserID == acc.UserID).ToPagedList(pageNumber, pageSize);
                ViewBag.mess = TempData["mess"] as string;
                return View(lstOrder);
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }
        public ActionResult Details(int? id)
        {
            if (id == null) return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var order = objModel.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            if (order.UserID != ((Account)Session["user"]).UserID)
            {
                return HttpNotFound();
            }
            return View(order);
        }
        public ActionResult CancelOrder(int? id)
        {
            if (id == null) return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var order = objModel.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            var lstAllOrderDetail = objModel.OrderDetails.ToList();
            foreach (var item in lstAllOrderDetail)
            {
                if(item.OrderID == id)
                {
                    Product product = objModel.Products.SingleOrDefault(b => b.ProductID == item.Product.ProductID);
                    product.Quantity += item.Quantity;
                    objModel.Entry(product).State = EntityState.Modified;
                    objModel.SaveChanges();
                    objModel.OrderDetails.Remove(item);
                    objModel.SaveChanges();
                }
            }
            objModel.Orders.Remove(order);
            objModel.SaveChanges();
            TempData["mess"] = "Cancel successfully!!!";
            return RedirectToAction("Index");
        }
    }
}