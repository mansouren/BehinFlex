using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BehinFlex.Models
{
    public class ShowShoppingCart
    {
        
        [Key]
        public int ProductId { get; set; }
        [Display(Name ="نام محصول")]
        public string ProductTitle { get; set; }
        [Display(Name = "جزئیات محصول")]
        public string ProductDetails { get; set; }
        [Display(Name = "تعداد")]
        public int ProductCount { get; set; }
        [Display(Name = "مبلغ")]
        public int? ProductPrice { get; set; }
        [Display(Name = "جمع ")]
        public int? Sum { get; set; }
        [Display(Name = "جمع با تخفیف ")]
        public int? SumWithDiscount { get; set; }
        [Display(Name = "جمع کل ")]
        public int? TotalSum { get; set; }
        [Display(Name = "جمع کل با تخفیف ")]
        public int? TotalsumWithDiscount { get; set; }
        public string Size { get; set; }
        public int DiscountPercent { get; set; }

       

    }
}