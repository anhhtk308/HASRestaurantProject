using HASRestaurant.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

namespace HASRestaurant.Controllers
{
    public class LoginController : Controller
    {
        PRN292_HASRestaurantEntities objModel = new PRN292_HASRestaurantEntities();
        // GET: Login
        public ActionResult Index()
        {
            Session.Remove("account");
            Session.Remove("code");
            return View();
        }
        [HttpPost]
        public ActionResult Index(Account user)
        {
            if (ModelState.IsValid == true)
            {
                var data = objModel.Accounts.Where(Models => Models.UserName == user.UserName && Models.Password == user.Password).ToList();
                if (data.Count > 0)
                {
                    Session["user"] = data.FirstOrDefault();
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.error = "Login Failed";
                    return View("Index");
                }

            }
            return View();
        }
      
        public ActionResult Logout()
        {
            Session.Clear();
            return View("Index");
        }
        // GET: Register
        public ActionResult RegisterIndex()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(Account account)
        {
            if (ModelState.IsValid)
            {
                var checkEmail = objModel.Accounts.FirstOrDefault(Models => Models.Email == account.Email);
                var check = objModel.Accounts.FirstOrDefault(Models => Models.UserName == account.UserName);
                if (checkEmail == null && check == null)
                {
                    if (account.Email.Trim() == "")
                    {
                        ModelState.AddModelError("name", "Please Input Email");
                        return View("RegisterIndex");
                    }
                    else
                    {
                        account.Role = "false";
                        objModel.Accounts.Add(account);
                        objModel.SaveChanges();
                        return View("Index");
                    }
                }
                else
                {
                    ModelState.AddModelError("name", "UserName Already Exists.");
                    return View("RegisterIndex");
                }
            }
            return View("RegisterIndex");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SendCode(Account account)
        {
            if (ModelState.IsValid)
            {
                var checkEmail = objModel.Accounts.FirstOrDefault(Models => Models.Email == account.Email);
                var checkUser = objModel.Accounts.FirstOrDefault(Models => Models.UserName == account.UserName);
                if (account.Email.Trim() == "")
                {
                    ModelState.AddModelError("checkname", "Please Enter Email");
                    return View("RegisterIndex", account);
                }
                if (checkUser != null)
                {
                    ModelState.AddModelError("checkname", "UserName Already Exists.");
                    return View("RegisterIndex", account);
                }
                else if (checkEmail != null)
                {
                    ModelState.AddModelError("checkemail", "Email Already Exists.");
                    return View("RegisterIndex", account);
                }
                else if (checkEmail == null && checkUser == null)
                {
                    Random rand = new Random((int)DateTime.Now.Ticks);
                    int RandomNumber;
                    RandomNumber = rand.Next(100000, 999999);

                    Session.Remove("account");
                    Session.Remove("code");

                    account.Role = "User";

                    Session["account"] = account;
                    Session["code"] = RandomNumber;

                    MailMessage mm = new MailMessage("anhhtk3082@gmail.com", account.Email);
                    mm.Subject = "Your Password!";
                    mm.Body = String.Format("Hello! \n Your code is '" + RandomNumber + "'");
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
                    DateTime arrival = DateTime.Now.AddMinutes(1);
                    Session["time"] = arrival;
                    return View("cfRegisterView");
                }
            }
            return View("RegisterIndex", account);
        }


        public ActionResult cfRegisterView()
        {
            return View();
        }

        [HttpPost]
        public ActionResult cfRegister(FormCollection formCollection)
        {
            DateTime start = (DateTime)Session["time"];
            DateTime end = DateTime.Now;
            int code = (int)Session["code"];
            TimeSpan timeSpan = start - end;
            Account account = (Account)Session["account"];
            if (timeSpan.TotalSeconds >= 0)
            {
                if (formCollection["code"] == code.ToString())
                {
                    objModel.Accounts.Add(account);
                    objModel.SaveChanges();
                    /*Session.Remove("account");
                    Session.Remove("code");*/
                    Session.Remove("time");
                    return View("Index", account);
                }
                else
                {
                    ModelState.AddModelError("pass", "Code invalid!");
                }
            }
            ModelState.AddModelError("pass", "Code time out!");
            Session.Remove("time");
            return View("RegisterIndex", account);
        }

        public ActionResult ChangePass()
        {
            return View();
        }
        [HttpPost]

        public ActionResult ChangePass(FormCollection formCollection)
        {
            string username = formCollection["username"];
            string password = formCollection["password"];
            string Newpassword = formCollection["NewPassword"];
            string confirmPass = formCollection["confirmPass"];

            var hasPass = new Regex(@"(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$");

            if (username.Trim() == "" || password.Trim() == "" || Newpassword.Trim() == "" || confirmPass.Trim() == "")
            {
                ModelState.AddModelError("correct", "Please Input all of this !!!");
                return View("ChangePass");
            }
            if (!hasPass.IsMatch(Newpassword))
            {
                ModelState.AddModelError("correct", "Your New password must have A lowercase letter, A uppercase letter ,A number  and minimun 8ch");
                return View("ChangePass");
            }
            else
            if (ModelState.IsValid == true)
            {
                var data = objModel.Accounts.Where(Models => Models.UserName == username && Models.Password == password).ToList();
                if (data.Count > 0)
                {
                    if (password == Newpassword)
                    {
                        ModelState.AddModelError("correct", "Your Current Password is same with new password");
                        return View("ChangePass");
                    }
                    else
                    {
                        if (Newpassword != confirmPass)
                        {
                            ModelState.AddModelError("pass", "New Password and Confirm Password is not same !");
                            return View("ChangePass");
                        }
                        else
                        {
                            var CAccount = objModel.Accounts.First(Model => Model.UserName == username);
                            CAccount.Password = Newpassword;
                            objModel.SaveChanges();
                            ModelState.AddModelError("correct", "Change successfully !");
                            return View("ChangePass");
                        }
                    }
                }
                else
                {
                    ModelState.AddModelError("UserPass", "Wrong Username or Password");
                    return View("ChangePass");
                }

            }
            return View();
        }

        public ActionResult ForgotPassword()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ForgotPassword(Account account)
        {
            var query = objModel.Accounts
                .Where(s => s.Email == account.Email)
                .FirstOrDefault<Account>();
            if (query == null)
            {
                ModelState.AddModelError("name", "This Email is not Exists.");
                return View("ForgotPassword");
            }
            else
            {
                string username = query.UserName;
                string password = query.Password;
                MailMessage mm = new MailMessage("anhhtk3082@gmail.com", account.Email);
                mm.Subject = "Your Password!";
                mm.Body = "Hello!!! \n '" + username + "' is your Email id \n Your password is '" + password + "'";
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
            }
            return View("Index");
        }

    }
}