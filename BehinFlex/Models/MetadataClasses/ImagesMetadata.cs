using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc.Html;

namespace BehinFlex.Models.MetadataClasses
{
    [DisplayName("تصویر")]
    [DisplayPluralName("تصاویر")]
    public  class ImagesMetadata
    {
        [Key]
        public int ImageID { get; set; }

        [Display(Name = "عنوان تصویر")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string ImageTitle { get; set; }
        [Display(Name = "تصویر")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string ImageUrl { get; set; }

        [Display(Name = "تاریخ ثبت")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        public Nullable<System.DateTime> CreateDate { get; set; }
    }
}