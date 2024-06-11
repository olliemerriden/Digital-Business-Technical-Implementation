using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FastTrackPCs
{
    public class BasketItem
    {
        public string SessionID { get; set; }
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public float ProductPrice { get; set; }
        public int Quantity { get; set; }
        public float Amount { get; set; }
    }
}