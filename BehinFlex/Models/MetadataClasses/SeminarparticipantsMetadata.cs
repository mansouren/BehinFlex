using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc.Html;

namespace BehinFlex.Models.MetadataClasses
{
    [DisplayName("شرکت کننده در سمینار")]
    [DisplayPluralName("شرکت کنندگان در سمینار")]
    public  class SeminarparticipantsMetadata
    {
        [Key]
        public int SeminarID { get; set; }

        [Display(Name = "عنوان سمینار")]
        public int NewsID { get; set; }

        [Display(Name = "نام ونام خانوادگی")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید",AllowEmptyStrings = true)]
        //[DisplayFormat(ConvertEmptyStringToNull = false)]
        public string FullName { get; set; }

        [Display(Name = "شماره تماس")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید",AllowEmptyStrings = true)]
        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^(09{1})+([1-3]{1})+(\d{8})$", ErrorMessage = "{0} وارد شده معتبر نمی باشد")]
        public string Phone { get; set; }

        [Display(Name = "ایمیل")]
        [EmailAddress(ErrorMessage = "{0} وارد شده صحیح نمی باشد")]
        public string Email { get; set; }

        
    }
}