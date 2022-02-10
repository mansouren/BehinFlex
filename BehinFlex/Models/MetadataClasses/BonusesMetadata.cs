using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc.Html;

namespace BehinFlex.Models.MetadataClasses
{
    [DisplayName("امتیاز")]
    [DisplayPluralName("امتیازها")]
    public class BonusesMetadata
    {
        [Key]
        public int BonusId { get; set; }

        [Display(Name = "نام کاربر")]
        public int? UserId { get; set; }
        [Display(Name = "امتیاز")]
        public int Bonus { get; set; }
        public int? RefID { get; set; }
        public int? OrderId { get; set; }

    }
}