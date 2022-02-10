using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BehinFlex.Models.ViewModels;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using BehinFlex.Models.ViewModels;
using System.Web.Mvc;

namespace BehinFlex.Models.ViewModels
{
    public class MapViewModel
    {
        
        [Display(Name = "نام و نام خانوادگی")]
        [Required(ErrorMessage = "حداقل 4 حرف وارد کنید")]
        [StringLength(30, ErrorMessage = "حداقل 4 حرف و حداکثر 30 حرف وارد کنید", MinimumLength = 4)]
        public string FullName { get; set; }

        [Display(Name = "ایمیل")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [EmailAddress(ErrorMessage = "{0} وارد شده صحیح نمی باشد")]
        public string Email { get; set; }

        [Display(Name = "شماره تماس")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^(09|9)[0123][0-9]\d{7}$",
                   ErrorMessage = "شماره موبایل وارد شده صحیح نمی باشد.")]
        public string Phone { get; set; }

        [Display(Name = "متن پیام")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [MinLength(8, ErrorMessage = "حداقل 8 حرف وارد کنید")]
        [DataType(DataType.MultilineText)]
        public string message { get; set; }

       

        public IList<string> SelectedMapType { get; set; }
        public IList<SelectListItem> AvailableMapType { get; set; }
        public MapViewModel()
        {
            SelectedMapType = new List<string>();
            AvailableMapType = new List<SelectListItem>();
        }




    }
}