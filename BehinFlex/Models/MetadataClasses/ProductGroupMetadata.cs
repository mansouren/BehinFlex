using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc.Html;

namespace BehinFlex.Models
{
    [DisplayName("گروه محصول")]
    [DisplayPluralName("گروه محصولات")]
    public  class ProductGroupMetadata
    {
        [Key]
        public int ProductGroupID { get; set; }

        [Display(Name = "برند محصول")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public int ProductBrandID { get; set; }

        [Display(Name = "گروه محصول")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string ProductGroupTitle { get; set; }

       }
}