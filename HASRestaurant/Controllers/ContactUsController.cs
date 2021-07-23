using HASRestaurant.Context;
using HASRestaurant.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace HASRestaurant.Controllers
{
    public class ContactUsController : Controller
    {
        PRN292_HASRestaurantEntities objModel = new PRN292_HASRestaurantEntities();
        // GET: ContactUs
        public ActionResult Index(int? id)
        {
            ViewBag.mess = TempData["mess"] as string;
            if (id != null)
            {
                Contact c = objModel.Contacts.Find(id);
                c.Message = "";
                return View(c);
            }
            else
            {
                if (Session["user"] != null)
                {
                    Contact c = new Contact();
                    c.Email = ((Account)Session["user"]).Email;
                    return View(c);
                }
            }
            return View();
        }
        [HttpPost]
        public ActionResult Create(Contact contact)
        {
            if (ModelState.IsValid)
            {
                var respone = Request["g-recaptcha-response"];
                const string secret = "6Lc3cq8bAAAAAKF5CcoSjC-bDLwKblMEuEXCp1wR";
                var client = new WebClient();
                var reply = client.DownloadString(
                    string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", secret, respone)
                    );
                var captchaResponse = JsonConvert.DeserializeObject<CaptchaResponse>(reply);
                //check error return from goofle recaptcha
                if (!captchaResponse.Success)
                {
                    //Hanle error messages
                    if(captchaResponse.ErrorCodes.Count <= 0) return View("Index");
                    var error = captchaResponse.ErrorCodes[0].ToLower();
                    switch (error)
                    {
                        case "missing-input-secret":
                            ModelState.AddModelError("errorCaptcha", "The secret parameter is missing.");
                            break;
                        case "invalid-input-secret":
                            ModelState.AddModelError("errorCaptcha", "The secret parameter is invalid or malformed.");
                            break;
                        case "missing-input-response":
                            ModelState.AddModelError("errorCaptcha", "The response parameter is missing.");
                            break;
                        case "invalid-input-response":
                            ModelState.AddModelError("errorCaptcha", "The response parameter is invalid or malformed.");
                            break;
                        case "bad-request":
                            ModelState.AddModelError("errorCaptcha", "The request is invalid or malformed.");
                            break;
                        case "timeout-or-duplicate":
                            ModelState.AddModelError("errorCaptcha", "The response is no longer valid: either is too old or has been used previously.");
                            break;
                        default:
                            ModelState.AddModelError("errorCaptcha", "Error occured. Please try again later!");
                            break;
                    }
                }
                else
                {
                    //Handle success case
                    contact.Status = "No response yet";
                    contact.CreateMessageDate = DateTime.Now;
                    objModel.Contacts.Add(contact);
                    objModel.SaveChanges();
                    TempData["mess"] = "Contact successfully!!! HAS Restaurant will send you feedback as soon as possible";
                    return RedirectToAction("Index");
                }
            }
            return View("Index",contact);
        }
    }
}