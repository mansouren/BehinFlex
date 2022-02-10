using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using BehinFlex.Classes;
using NPOI.OpenXmlFormats.Wordprocessing;

namespace BehinFlex.Models
{
    public class SmsInput
    {
        [Display(Name = "متن پیامک")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [DataType(DataType.MultilineText)]
        public string Body { get; set; }
        [Display(Name = "گیرندگان")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [DataType(DataType.MultilineText)]
        public string Receivers { get; set; }
        [Display(Name = "نوع پیامک")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public SmsType SmsType { get; set; }

        
    }
}