using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc.Html;

namespace BehinFlex.Models.MetadataClasses
{
    [DisplayName("نظر")]
    [DisplayPluralName("نظرها")]
    public  class CommentsMetadata
    {
        [Key]
        public int CommentID { get; set; }
        [Display(Name = "محصول")]
        public int ProductID { get; set; }

        [Display(Name = "کاربر")]
        public int UserID { get; set; }
        
        [Display(Name = "متن نظر")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [DataType(DataType.MultilineText)]
        public string CommentText { get; set; }
        [Display(Name = "تائید /عدم تائید")]
        public Nullable<bool> IsApproved { get; set; }

        [Display(Name = "تاریخ ثبت")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
        public System.DateTime CommentDate { get; set; }

     
    }
}