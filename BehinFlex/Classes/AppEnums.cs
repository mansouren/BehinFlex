using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BehinFlex.Classes
{
    public enum SmsType
    {
        [Display(Name = "خبری")]
        News=0,
        [Display(Name = "عادی")]
        Standard =1

    }
}