//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BehinFlex.Models
{
    using System.ComponentModel.DataAnnotations; // Mansoure
    using MetadataClasses; //Mansoure
    using System;
    using System.Collections.Generic;
    
    [MetadataType(typeof(OrderDetailsMetadata))] // Mansoure
    public partial class OrderDetails
    {
        public int DetailId { get; set; }
        public int OrderId { get; set; }
        public int ProductId { get; set; }
        public int ProductCount { get; set; }
        public Nullable<int> ProductPrice { get; set; }
        public Nullable<int> Sum { get; set; }
        public Nullable<int> SumWithDiscount { get; set; }
    
        public virtual Orders Orders { get; set; }
        public virtual Products Products { get; set; }
    }
}
