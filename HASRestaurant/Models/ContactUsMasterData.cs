using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HASRestaurant.Models
{
    public partial class ContactUsMasterData
    {
        [Display(Name = "YourName")]
        [Required(ErrorMessage = "Please enter Customer Name")]
        [StringLength(50)]
        public string CustomerName { get; set; }
        [Required(ErrorMessage = "Please enter Phone")]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$", ErrorMessage = "Not a valid phone number: 123-123-1234")]
        public string Phone { get; set; }
        [Required(ErrorMessage = "Please enter address")]
        [StringLength(200)]
        public string Address { get; set; }
        [Required(ErrorMessage = "Please enter Email")]
        [DataType(DataType.EmailAddress)]
        [RegularExpression(@"[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$", ErrorMessage = "Invalid Email: character@character.domain")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Please enter message")]
        [StringLength(1000)]
        public string Message { get; set; }
        public int ContactID { get; set; }
        public string Status { get; set; }
        public string ResponseMessage { get; set; }
        public Nullable<System.DateTime> CreateMessageDate { get; set; }
        public Nullable<System.DateTime> ResponseMessageDate { get; set; }
    }
}