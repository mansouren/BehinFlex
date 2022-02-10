using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc.Html;

namespace BehinFlex.Models.MetadataClasses
{
    [DisplayName("پیش فاکتور")]
    [DisplayPluralName("پیش فاکتورها")]
    internal class OrdersMetadata
    {
        [Display(Name = "شماره پیش فاکتور")]
        public int OrderId { get; set; }

        [Display(Name = "نام مشتری")]
        public int UserId { get; set; }

        [Display(Name = "تاریخ سفارش")]
        [DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}", ApplyFormatInEditMode = true)]
        public System.DateTime OrderDate { get; set; }

        [Display(Name = "تایید پیش فاکتور")]
        public bool IsFinally { get; set; }

        [Display(Name = "جمع کل")]
        [DisplayFormat(DataFormatString = "{0: #,0}")]
        public int? OrderTotalSum { get; set; }

        [Display(Name = "جمع کل با تخفیف")]
        [DisplayFormat(DataFormatString = "{0: #,0}")]
        public int? OrderTotalSumWithDiscount { get; set; }

        [Display(Name = "کد تخفیف")]
        public Nullable<int> DiscountCodeID { get; set; }

        [Display(Name = "مبلغ پس از کسر کد تخفیف")]
        public Nullable<int> OrderTotalAfterDiscountCodeApply { get; set; }

        //[Display(Name = "امتیاز سفارش")]
        //public int? BonusId { get; set; }
    }
}