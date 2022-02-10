using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BehinFlex.Models.ViewModels
{
    public class JsonResultWithMessage
    {
        public bool Successful { get; set; }
        public string MessageText { get; set; }
        public string MessageType { get; set; }
        public int Value { get; set; }
    }

    
}