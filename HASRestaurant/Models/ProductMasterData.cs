using HASRestaurant.Context;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HASRestaurant.Models
{
    public partial class ProductMasterData
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProductMasterData()
        {
            this.Carts = new HashSet<Cart>();
            this.OrderDetails = new HashSet<OrderDetail>();
        }
        public int ProductID { get; set; }
        [Required(ErrorMessage ="Please enter Product name")]
        [StringLength(250, MinimumLength = 2, ErrorMessage = "{0} must be from {2} to {1} characters")]
        public string ProductName { get; set; }
        [Required(ErrorMessage = "Please enter Price")]
        [Range(0,maximum:double.MaxValue,ErrorMessage ="Price must >= 0")]
        public Nullable<double> Price { get; set; }
        [Required(ErrorMessage = "Please enter Quantity")]
        [Range(0, maximum: Int32.MaxValue, ErrorMessage = "Quantity must > 0")]
        public Nullable<int> Quantity { get; set; }
        [Required(ErrorMessage = "Please enter ShortDes")]
        [StringLength(70)]
        public string ShortDes { get; set; }
        [Required(ErrorMessage = "Please enter Description")]
        public string Description { get; set; }
        [Required(ErrorMessage = "Please enter url Image")]
        public string Image { get; set; }
        public Nullable<int> CategoryID { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cart> Carts { get; set; }
        public virtual Category Category { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}