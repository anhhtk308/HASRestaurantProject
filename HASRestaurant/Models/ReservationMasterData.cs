using HASRestaurant.Context;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace HASRestaurant.Models
{
    public partial class ReservationMasterData
    {
        public int ReservationID { get; set; }
        public Nullable<int> UserID { get; set; }
        [DisplayName("Your Name")]
        [Required(ErrorMessage = "Please enter your name")]
        [StringLength(50)]
        public string CustomerName { get; set; }
        [Required(ErrorMessage = "Please enter Email")]
        [DataType(DataType.EmailAddress)]
        [RegularExpression(@"[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$", ErrorMessage = "Invalid Email: character@character.domain")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Please enter Phone")]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$", ErrorMessage = "Not a valid phone number: 123-123-1234")]
        public string Phone { get; set; }
        [Required(ErrorMessage = "Please enter Number of Guest")]
        public Nullable<int> NumOfGuests { get; set; }
        [Required(ErrorMessage = "Please enter Date time")]
        public Nullable<System.DateTime> ReservationDate { get; set; }
        [Required(ErrorMessage = "Please enter Time")]
        public string Time { get; set; }
        public string Message { get; set; }

        public virtual Account Account { get; set; }
    }
}