using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace BehinFlex.Models.MetadataClasses
{
    [DisplayName("محصول")]
    [DisplayPluralName("محصولات")]
    public  class ProductsMetadata
    {

        [Key]
        public int ProductID { get; set; }

        [Display(Name = "زیر گروه محصول ")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public int ProductSubGroupID { get; set; }

        [Display(Name = "عنوان محصول")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string ProductTitle { get; set; }

        [Display(Name = "عنوان انگلیسی محصول")]
        public string ProductEnTitle { get; set; }

        [Display(Name = "توضیحات محصول")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [AllowHtml]
        [DataType(DataType.MultilineText)]
        public string ProductDescription { get; set; }

        [Display(Name = "مبلغ")]
        //[DisplayFormat(DataFormatString = "{0: #,0}")]
        [DisplayFormat(ApplyFormatInEditMode = false, DataFormatString = "{0:#,0 ریال}")]
        public int ProductPrice { get; set; }

        [Display(Name = "تصویر")]
        //[StringLength(100, ErrorMessage = "{0} میبایست حداقل {2} کاراکتر و حداکثر {1} کاراکتر باشد", MinimumLength = 10)]
        //[Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string ProductImageUrl { get; set; }

        [Display(Name = "تاریخ ثبت")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        public Nullable<System.DateTime> CreateDate { get; set; }

        [Display(Name = "مشخصات فنی محصول")]
        [DataType(DataType.MultilineText)]
        public string ProductDetails { get; set; }

        [Display(Name = "سایز")]
        public string Size { get; set; }
        
        [Display(Name = "شگفت انگیز")]
        public bool? IsSpecial { get; set; }


    }
}