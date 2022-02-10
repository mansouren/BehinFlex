using System;
using System.ComponentModel.DataAnnotations;

namespace BehinFlex.Models.MetadataClasses
{
    internal class OrderDetailsMetadata
    {
        public int DetailId { get; set; }
        public int OrderId { get; set; }
        public int ProductId { get; set; }
        public int ProductCount { get; set; }
        [Display(Name = "قیمت")]
        [DisplayFormat(DataFormatString = "{0: #,0}")]
        public int? ProductPrice { get; set; }
        [Display(Name = "جمع")]
        [DisplayFormat(DataFormatString = "{0: #,0}")]
        public int? Sum { get; set; }
        [Display(Name = "جمع با تخفیف")]
        [DisplayFormat(DataFormatString = "{0: #,0}")]
        public int? SumWithDiscount { get; set; }
    }
}