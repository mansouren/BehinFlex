using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BehinFlex.Models
{
    public enum DiscountUseType
    {
        Success,
        ExpireDate,
        NotFound,
        Finished,
        Used,
        NotAllowed
    }
}