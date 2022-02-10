using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BehinFlex.Models
{
    public class CommentProductViewModel
    {
        public IEnumerable<Products> IEProducts { get; set; }
        public Comments Comments { get; set; }
    }
}