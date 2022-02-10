using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace BehinFlex.Models.MetadataClasses
{
    [DisplayName("خبر")]
    [DisplayPluralName("اخبار")]
    public  class NewsMetadata
    {
        [Key]
        public int NewsID { get; set; }

        [Display(Name = "عنوان خبر/سمینار")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string NewsTitle { get; set; }

        [Display(Name = "متن خبر")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        //[MinLength(250,ErrorMessage = "متن خبر باید حداقل شامل 250 کاراکتر باشد")]
        [AllowHtml]
        [DataType(DataType.MultilineText)]
        public string NewsDescription { get; set; }

        [Display(Name = "تصویر")]
        //[Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string NewsImageUrl { get; set; }

        [Display(Name = "ویدئو")]
        public string NewsVideoUrl { get; set; }

        [Display(Name = "تاریخ ثبت")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}", ApplyFormatInEditMode = true)]
        public System.DateTime CreateDate { get; set; }

        [Display(Name = "همایش")]
        public bool IsSeminar { get; set; }

        }
}