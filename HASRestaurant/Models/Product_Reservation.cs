using HASRestaurant.Context;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HASRestaurant.Models
{
    public class Product_Reservation
    {
        public List<Product> ListProduct { get; set; }
        public Reservation Reservation { get; set; }
    }
}