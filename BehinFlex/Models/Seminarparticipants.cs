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
    
    [MetadataType(typeof(SeminarparticipantsMetadata))] // Mansoure
    public partial class Seminarparticipants
    {
        public int SeminarID { get; set; }
        public int NewsID { get; set; }
        public string FullName { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
    
        public virtual News News { get; set; }
    }
}
