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
    
    [MetadataType(typeof(ProjectsMetadata))] // Mansoure
    public partial class Projects
    {
        public int ProjectID { get; set; }
        public string ProjectTitle { get; set; }
        public string ProjectDescription { get; set; }
        public string ProjectImageUrl { get; set; }
        public System.DateTime CreateDate { get; set; }
    }
}
