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
    
    [MetadataType(typeof(CommentsMetadata))] // Mansoure
    public partial class Comments
    {
        public int CommentID { get; set; }
        public int ProductID { get; set; }
        public int UserID { get; set; }
        public string CommentText { get; set; }
        public bool IsApproved { get; set; }
        public System.DateTime CommentDate { get; set; }
    
        public virtual Users Users { get; set; }
        public virtual Products Products { get; set; }
    }
}
