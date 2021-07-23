using HASRestaurant.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;


namespace HASRestaurant.Context
{
    [MetadataType(typeof(ProductMasterData))]
    public partial class Product
    {
    }
    [MetadataType(typeof(AccountMasterData))]
    public partial class Account
    {
    }
    [MetadataType(typeof(OrderMasterData))]
    public partial class Order
    {
    }
    [MetadataType(typeof(ReservationMasterData))]
    public partial class Reservation
    {
    }
    [MetadataType(typeof(ContactUsMasterData))]
    public partial class Contact
    {
    }
}