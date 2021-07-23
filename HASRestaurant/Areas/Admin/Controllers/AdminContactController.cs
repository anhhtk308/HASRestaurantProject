using HASRestaurant.Context;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace HASRestaurant.Areas.Admin.Controllers
{
    public class AdminContactController : Controller
    {
        PRN292_HASRestaurantEntities objModel = new PRN292_HASRestaurantEntities();
        // GET: Admin/AdminContact
        public ActionResult Index()
        {
            ViewBag.mess = TempData["mess"] as string;
            var lstContact = objModel.Contacts.OrderByDescending(n => n.CreateMessageDate).ToList();
            return View(lstContact);
        }
        [HttpGet]
        public ActionResult SendMessForm(int id)
        {
            var objContact = objModel.Contacts.Where(n => n.ContactID == id).FirstOrDefault();
            return View(objContact);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult SendMess(int id, FormCollection fc)
        {
            var objContact = objModel.Contacts.Where(n => n.ContactID == id).FirstOrDefault();
            if (!string.IsNullOrEmpty(fc["ResponseMessage"].ToString()))
            {
                objContact.ResponseMessageDate = DateTime.Now;
                objContact.ResponseMessage = fc["ResponseMessage"].ToString();
                objContact.Status = "Responded";
                objModel.Entry(objContact).State = EntityState.Modified;
                objModel.SaveChanges();
                //Send mail
                MailMessage mm = new MailMessage("anhhtk3082@gmail.com", objContact.Email);
                mm.Subject = "[HAS Restaurant - Customer Support!!!]";
                string contentMail = objContact.ResponseMessage;
                string linkContact = "<br/>Click <a href='http://localhost:62452/ContactUs/Index?id="+ objContact.ContactID +"'>here</a> to contact HAS Restaurant if you have any questions!";
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
                TempData["mess"] = "Send message successfully!!!";
                return RedirectToAction("Index");
            }
            return View("SendMessForm", objContact);
        }

        public ActionResult Details(int id)
        {
            var objContact = objModel.Contacts.Where(n => n.ContactID == id).FirstOrDefault();
            return View(objContact);
        }
    }
}