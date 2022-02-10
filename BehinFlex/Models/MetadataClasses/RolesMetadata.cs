using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace BehinFlex.Models.MetadataClasses
{
    public  class RolesMetadata
    {
      
        [Key]
        public int RoleID { get; set; }

        [Display(Name = "عنوان سیستمی نقش کاربر")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string RoleName { get; set; }

        [Display(Name = "نقش کاربر")]
        [Required(ErrorMessage = "لطفا {0} را وارد کنید")]
        public string RoleTitle { get; set; }

        
    }
}