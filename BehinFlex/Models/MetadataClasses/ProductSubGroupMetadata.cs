using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc.Html;

namespace BehinFlex.Models.MetadataClasses
{
    [DisplayName("زیرگروه محصول")]
    [DisplayPluralName("زیرگروه محصولات")]
    public  class ProductSubGroupMetadata
    {
        [Key]
        public int ProductSubGroupID { get; set; }
        [Display(Name = "گروه محصول")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public int ProductGroupID { get; set; }
        [Display(Name = "عنوان زیرگروه محصول")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string ProductSubGroupTitle { get; set; }

        
    }
}