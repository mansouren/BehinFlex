using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc.Html;

namespace BehinFlex.Models.MetadataClasses
{
    [DisplayName("برند محصول")]
    [DisplayPluralName("برند محصولات")]
    public class ProductBrandMetadata
    {
        [Key]
        public int ProductBrandID { get; set; }
        [Display(Name = "برند محصول")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string ProductBrandTitle { get; set; }

    }
}