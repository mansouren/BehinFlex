using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace BehinFlex.Models.MetadataClasses
{
    [DisplayName("تخفیف")]
    [DisplayPluralName("تخفیف ها")]
    public class DiscountsMetadata
    {
        [Key]
        public int DiscountID { get; set; }

    

        [Display(Name = "درصد تخفیف")]
        [Required(ErrorMessage = "لطفا درصد تخفیف را وارد نمایید")]
        public int DiscountPercent { get; set; }

     

        [Display(Name = "محصول")]
        public int? ProductID { get; set; }
    }
}