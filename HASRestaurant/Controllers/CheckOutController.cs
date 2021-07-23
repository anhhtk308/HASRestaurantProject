using HASRestaurant.Context;
using HASRestaurant.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace HASRestaurant.Controllers
{
    public class CheckOutController : Controller
    {
        PRN292_HASRestaurantEntities objModel = new PRN292_HASRestaurantEntities();
        // GET: CheckOut
        public ActionResult Index()
        {
            if (Session["user"] != null)
            {
                Order od = new Order();
                od.Email = ((Account)Session["user"]).Email;
                return View(od);
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }
        //FormCollection frc
        [HttpPost]
        public ActionResult CheckOut(Order order)
        {
            if (Session["user"] != null)
            {
                if (ModelState.IsValid)
                {
                    //1.Save order into Order table
                    List<CartModel> lstCart = (List<CartModel>)Session["cart"];
                    Account acc = (Account)Session["user"];
                    order.UserID = acc.UserID;
                    order.TotalPrice = lstCart.Sum(x => x.Quantity * x.Product.Price);
                    order.OrderDate = DateTime.Now;
                    objModel.Orders.Add(order);
                    objModel.SaveChanges();
                    //2.Save order detail
                    string subcontent = "";
                    foreach (CartModel item in lstCart)
                    {
                        OrderDetail orderDetail = new OrderDetail()
                        {
                            OrderID = order.OrderID,
                            ProductID = item.Product.ProductID,
                            Quantity = item.Quantity,
                            UnitPrice = item.Quantity * item.Product.Price
                        };
                        subcontent += "<tr><td>" +item.Product.ProductName+"</td><td>"+item.Quantity+"</td><td>"+ (item.Quantity * item.Product.Price)+"</td></tr>";
                        objModel.OrderDetails.Add(orderDetail);
                        objModel.SaveChanges();
                    }
                    //3. Send Mail
                    MailMessage mm = new MailMessage("anhhtk3082@gmail.com", order.Email);
                    mm.Subject = "[HAS Restaurant - Confirm: Order successfully!!!]";
                    string contentMail = "<h1>Hello: " + order.CustomerName + ". You have successfully placed an order from HAS Restaurant</h1>";
                    contentMail += "<hr/><dl><dd>Customer Name: " + order.CustomerName + "</dd>";
                    contentMail += "<dd>Total Price: " + order.TotalPrice + "</dd>";
                    contentMail += "<dd>Order Date: " + order.OrderDate + "</dd>";
                    contentMail += "<dd>Phone: " + order.Phone + "</dd>";
                    contentMail += "<dd>Address: " + order.Address + "</dd>";
                    contentMail += "<dd>Note: " + order.Note + "</dd>";
                    contentMail += "<dd>Email: " + order.Email + "</dd>";
                    contentMail += "</dl>";
                    contentMail += "<table class='table' border='1'><tr><th>Product Name</th><th>Quantity</th><th>Unit Price</th></tr>";
                    contentMail += subcontent;
                    contentMail += "</table>";
                    string linkContact = "Click here to <a href='http://localhost:62452/Menu/Index'>shopping now!</a>";
                    mm.Body = String.Format(contentMail + linkContact);
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential nc = new NetworkCredential();
                    nc.UserName = "anhhtk3082@gmail.com";
                    nc.Password = "kimanh30082000";
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = nc;
                    smtp.Port = 587;
                    smtp.Send(mm);

                    //4.Update quantity
                    foreach (CartModel item in lstCart)
                    {
                        Product product = objModel.Products.SingleOrDefault(b => b.ProductID == item.Product.ProductID);
                        product.Quantity -= item.Quantity;
                        objModel.Entry(product).State = EntityState.Modified;
                        objModel.SaveChanges();
                    }
                    //5.Remove session
                    Session.Remove("cart");
                    return RedirectToAction("Index", "OrderHistory");
                }
                /*if (ModelState.IsValid)
                {
                    //1.Save order into Order table
                    List<CartModel> lstCart = (List<CartModel>)Session["cart"];
                    Account acc = (Account)Session["user"];
                    Order order = new Order()
                    {
                        UserID = acc.UserID,
                        CustomerName = frc["firstname"],
                        TotalPrice = lstCart.Sum(x => x.Quantity * x.Product.Price),
                        OrderDate = DateTime.Now,
                        Phone = frc["phone"],
                        Address = frc["address"],
                        Note = frc["note"],
                        Email = frc["email"]
                    };
                    objModel.Orders.Add(order);
                    objModel.SaveChanges();
                    //2.Save order detail
                    foreach (CartModel item in lstCart)
                    {
                        OrderDetail orderDetail = new OrderDetail()
                        {
                            OrderID = order.OrderID,
                            ProductID = item.Product.ProductID,
                            Quantity = item.Quantity,
                            UnitPrice = item.Quantity * item.Product.Price
                        };
                        objModel.OrderDetails.Add(orderDetail);
                        objModel.SaveChanges();
                    }
                    //3.Remove session
                    Session.Remove("cart");
                    return View("Index");
                }
                return View("Index");*/
                return View("Index", order);
            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
        }
    }
}