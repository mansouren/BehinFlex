using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BehinFlex.Models.MetadataClasses
{
    public  class CustomerTypeMetadata
    {
        [Key]
        public int CustomerTypeID { get; set; }
        [Display(Name = "نوع مشتری")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string CustomerTypeTitle { get; set; }

        [Display(Name = "عنوان سیستمی نوع مشتری")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string CustomerTypeName { get; set; }

        
    }
}