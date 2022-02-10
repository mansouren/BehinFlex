using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BehinFlex.Models.MetadataClasses
{
    public class RefCodeMetadata
    {
        [Key]
        public int RefID { get; set; }
        [Display(Name = "کد معرفی")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string Ref_Code { get; set; }
        [Display(Name = "نام کاربر")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public int UserId { get; set; }

    }
}