using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class CarOrderInfo
    {
        public int ordercode { get; set; }

        public string carcode { get; set; }

        public string membercode { get; set; }

        public decimal orderprice { get; set; }

        public string state { get; set; }

        public string begindate { get; set; }

        public string enddate { get; set; }

        public string cardnumber { get; set; }

        public string cvv { get; set; }

        public string cardholdername { get; set; }

        public string validthru { get; set; }
    }
}
