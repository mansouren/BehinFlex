using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace BehinFlex.Models.MetadataClasses
{
    [DisplayName("پروژه")]
    [DisplayPluralName("پروژه ها")]
    public class ProjectsMetadata
    {
        [Key]
        public int ProjectID { get; set; }
        [Display(Name = "عنوان پروژه")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string ProjectTitle { get; set; }
        [Display(Name = "توضیحات")]
        [AllowHtml]
        [DataType(DataType.MultilineText)]
        public string ProjectDescription { get; set; }
        [Display(Name = "تصویر")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string ProjectImageUrl { get; set; }

        [Display(Name = "تاریخ انجام پروژه")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> CreateDate { get; set; }
    }
}