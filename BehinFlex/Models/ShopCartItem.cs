using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BehinFlex.Models
{
    public class ShopCartItem
    {
        
        
        public int ProductId { get; set; }
        public int ProductCount { get; set; }
        
        
    }
}