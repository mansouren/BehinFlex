using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;

namespace BehinFlex.Models
{
    public class ContactUsViewModel
    {
        [Display(Name = "نام و نام خانوادگی")]
        [Required(ErrorMessage = "حداقل 4 حرف وارد کنید")]
        [StringLength(30,ErrorMessage = "حداقل 4 حرف و حداکثر 30 حرف وارد کنید", MinimumLength = 4)]
        public string name { get; set; }

        [Display(Name = "ایمیل")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [EmailAddress(ErrorMessage = "{0} وارد شده صحیح نمی باشد")]
        public string Email { get; set; }

        [Display(Name = "موضوع")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string subject { get; set; }

        [Display(Name = "متن پیام")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        //[StringLength(300,ErrorMessage = "حداقل 8 حرف وارد کنید", MinimumLength = 8)]
        [MinLength(8, ErrorMessage = "حداقل 8 حرف وارد کنید")]
        [DataType(DataType.MultilineText)]
        public string message { get; set; }
    }
}