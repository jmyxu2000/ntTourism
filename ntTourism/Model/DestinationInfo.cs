using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class DestinationInfo
    {
        private string destinationcode;

        public string Destinationcode
        {
            get { return destinationcode; }
            set { destinationcode = value; }
        }

        private string destinationname;

        public string Destinationname
        {
            get { return destinationname; }
            set { destinationname = value; }
        }

        private string citycode;

        public string Citycode
        {
            get { return citycode; }
            set { citycode = value; }
        }

        private decimal needmoney;

        public decimal Needmoney
        {
            get { return needmoney; }
            set { needmoney = value; }
        }

       

        private string describe;

        public string Describe
        {
            get { return describe; }
            set { describe = value; }
        }

        private int seq;

        public int Seq
        {
            get { return seq; }
            set { seq = value; }
        }

        private string pic;

        public string Pic
        {
            get { return pic; }
            set { pic = value; }
        }

        private string state;

        public string State
        {
            get { return state; }
            set { state = value; }
        }
    }
}
