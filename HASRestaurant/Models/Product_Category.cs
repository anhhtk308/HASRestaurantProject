using HASRestaurant.Context;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HASRestaurant.Models
{
    public class Product_Category
    {
        public List<Category> ListCategory { get; set; }
        //public List<Product> ListProduct { get; set; }
        public IPagedList<Product> ListProduct { get; set; }

    }
}