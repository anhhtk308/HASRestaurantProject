using HASRestaurant.Context;
using HASRestaurant.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HASRestaurant.Controllers
{
    public class CartController : Controller
    {
        PRN292_HASRestaurantEntities db = new PRN292_HASRestaurantEntities();
        // GET: Cart
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult OrderNow(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            Product p = db.Products.Find(id);
            if (p.Quantity != 0)
            {
                if (Session["cart"] == null)
                {
                    List<CartModel> lstCart = new List<CartModel>
                {
                    new CartModel(db.Products.Find(id),1)
                };
                    Session["cart"] = lstCart;
                }
                else
                {
                    List<CartModel> lstCart = (List<CartModel>)Session["cart"];
                    int checkExist = isExistCheck(id);
                    if (checkExist == -1)
                    {
                        if (isValidProduct(id) != -1)
                        {
                            lstCart.Add(new CartModel(db.Products.Find(id), 1));
                        }
                    }
                    else
                    {
                        if (lstCart[checkExist].Quantity < db.Products.Find(id).Quantity)
                        {
                            lstCart[checkExist].Quantity++;
                        }
                    }
                    Session["cart"] = lstCart;
                }
                return View("Index");
            }
            else
            {
                TempData["mess"] = "Product Out Stock!!!";
                return RedirectToAction("Index","Menu");
            }
        }
        private int isExistCheck(int? id)
        {
            List<CartModel> lstCart = (List<CartModel>)Session["cart"];
            for (int i = 0; i < lstCart.Count; i++)
            {
                if (lstCart[i].Product.ProductID == id) return i;
            }
            return -1;
        }
        private int isValidProduct(int? id)
        {
            var lstAllProduct = db.Products.ToList();
            for (int i = 0; i < lstAllProduct.Count; i++)
            {
                if (lstAllProduct[i].ProductID == id) return lstAllProduct[i].ProductID;
            }
            return -1;
        }
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            int check = isExistCheck(id);
            List<CartModel> lstCart = (List<CartModel>)Session["cart"];
            if (check != -1)
            {
                lstCart.RemoveAt(check);
            }
            Session["cart"] = lstCart;
            return View("Index");
        }
        public ActionResult AddQuantity(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }

            int check = isExistCheck(id);
            List<CartModel> lstCart = (List<CartModel>)Session["cart"];
            if (check != -1)
            {
                if (lstCart[check].Quantity < db.Products.Find(id).Quantity)
                {
                    lstCart[check].Quantity++;
                }
            }
            Session["cart"] = lstCart;
            return View("Index");
        }
        public ActionResult SubQuantity(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            int check = isExistCheck(id);
            List<CartModel> lstCart = (List<CartModel>)Session["cart"];
            if (check != -1)
            {
                if (lstCart[check].Quantity > 1)
                {
                    lstCart[check].Quantity--;
                }
            }
            Session["cart"] = lstCart;
            return View("Index");
        }
    }
}