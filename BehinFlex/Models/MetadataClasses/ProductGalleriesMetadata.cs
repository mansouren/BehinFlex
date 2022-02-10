using System;
using System.ComponentModel.DataAnnotations;

namespace BehinFlex.Models.MetadataClasses
{
    public  class ProductGalleriesMetadata
    {
        [Key]
        public int GalleryID { get; set; }
        [Display(Name = "محصول")]
        public Nullable<int> ProductID { get; set; }
        [Display(Name = "تصویر")]
        public string ImageName { get; set; }

        
    }
}