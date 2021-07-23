using HASRestaurant.Context;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HASRestaurant.Models
{
    public partial class OrderMasterData
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public OrderMasterData()
        {
            this.OrderDetails = new HashSet<OrderDetail>();
        }

        public int OrderID { get; set; }
        public Nullable<int> UserID { get; set; }
        /*
         * UserName can contain the first and last names with a single space.
           The last name is optional.If the last name is not present, then there shouldn’t be any space after the first name.
           Only upper and lower case alphabets are allowed.*/
        [Required(ErrorMessage = "Please enter Name")]
        //[RegularExpression(@"^(([A-za-z]+[\s]{1}[A-za-z]+)|([A-Za-z]+))$", ErrorMessage = "Invalid Name")]
        [StringLength(50)]
        public string CustomerName { get; set; }
        public Nullable<double> TotalPrice { get; set; }
        public Nullable<System.DateTime> OrderDate { get; set; }
        [Required(ErrorMessage = "Please enter Phone Number")]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$", ErrorMessage = "Not a valid phone number")]
        public string Phone { get; set; }
        [Required(ErrorMessage = "Please enter Address")]
        [StringLength(100)]
        public string Address { get; set; }
        [StringLength(300)]
        public string Note { get; set; }
        [Required(ErrorMessage = "Please enter email")]
        [DataType(DataType.EmailAddress)]
        [RegularExpression(@"[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$", ErrorMessage = "Invalid Email")]
        public string Email { get; set; }

        public virtual Account Account { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}