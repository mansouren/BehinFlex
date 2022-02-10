using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc.Html;

namespace BehinFlex.Models.MetadataClasses
{
    [DisplayName("ویدیو")]
    [DisplayPluralName("ویدیوها")]
    public  class VideosMetadata
    {
        [Key]
        public int VideoID { get; set; }

        [Display(Name = "عنوان ویدیو")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string VideoTitle { get; set; }
        [Display(Name = "ویدئو")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string VideoUrl { get; set; }

        [Display(Name = "تاریخ ثبت")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        public Nullable<System.DateTime> CreateDate { get; set; }
    }
}