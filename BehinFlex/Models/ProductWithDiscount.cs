using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BehinFlex.Models
{
    public class ProductWithDiscount
    {
        public int ProductID { get; set; }
        public int ProductPrice { get; set; }
        public int RowTotal { get; set; }
        public int RowGrandTotal { get; set; }
    }
}