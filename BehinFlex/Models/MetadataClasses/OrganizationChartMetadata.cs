using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc.Html;

namespace BehinFlex.Models.MetadataClasses
{
    [DisplayName("پست سازمانی")]
    [DisplayPluralName("پستهای سازمانی")]
    public  class OrganizationChartMetadata
    {
        [Key]
        public int OrgChartID { get; set; }
        [Display(Name = "پست سازمانی")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string OrgChartPost { get; set; }
        [Display(Name = "نام و نام خانوادگی")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string OrgChartFullName { get; set; }

        [Display(Name = "شماره تماس")]
        public string OrgChartPhone { get; set; }

        [Display(Name = "ایمیل")]
        [EmailAddress(ErrorMessage = "{0} وارد شده صحیح نمی باشد")]
        public string OrgChartEmail { get; set; }

        [Display(Name = "تلگرام")]
        public string OrgChartTelegramID { get; set; }
    }
}