using HASRestaurant.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HASRestaurant.Models
{
    public class CartModel
    {
        public Product Product { get; set; }
        public int Quantity { get; set; }
        public CartModel(Product product, int quantity)
        {
            Product = product;
            Quantity = quantity;
        }
    }
}