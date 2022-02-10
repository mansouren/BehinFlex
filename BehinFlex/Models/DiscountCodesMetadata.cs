using System.ComponentModel.DataAnnotations;

namespace BehinFlex.Models
{
    public partial class DiscountCodesMetadata
    {
        [Key]
        public int DiscountCodeID { get; set; }

        [Display(Name = "کاربر مجاز به استفاده")]
        public int UserID { get; set; }
        
        [Display(Name="عنوان کد")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string DiscountCodeTitle { get; set; }

        [Display(Name = "تاریخ انقضای کد")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}",ApplyFormatInEditMode = true)]
        public System.DateTime DiscountCodeExpireDate { get; set; }

        [Display(Name = "درصد تخفیف")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public int DiscountPercent { get; set; }

        [Display(Name = "حداکثر مبلغ تخفیف")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        [DisplayFormat(ApplyFormatInEditMode = false,DataFormatString = "{0:#,0 ریال}")]
        public int DiscountMaxAmount { get; set; }

        [Display(Name = "دفعات استفاده")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public int DiscountCodeUsageCount { get; set; }

        [Display(Name = "کد تخفیف")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string DiscountCode { get; set; }
    }
}