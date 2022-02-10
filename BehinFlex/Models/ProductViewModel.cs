using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BehinFlex.Models
{
    public class ProductViewModel
    {
        
        public IEnumerable<Products> IEProduct { get; set; }
        public Products Product { get; set; }
        public IEnumerable<ProductSubGroup> IEProductsubgroup { get; set; }
        public IEnumerable<ProductGroup> IEProductGroup { get; set; }
        
        public IEnumerable<ShowShoppingCart> IEShowShoppingCarts { get; set; }
        public ShowShoppingCart ShowShoppingCarts { get; set; }
        //public Tuple<IEnumerable<Products>, IEnumerable<OrderDetails>> IETuple { get; set; }

    }
} 