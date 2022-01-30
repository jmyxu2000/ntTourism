using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{

    public class CityInfo
    {
        private string citycode;

        public string Citycode
        {
            get { return citycode; }
            set { citycode = value; }
        }
        private string cityname;

        public string Cityname
        {
            get { return cityname; }
            set { cityname = value; }
        }
        private int seq;

        public int Seq
        {
            get { return seq; }
            set { seq = value; }
        }

    }
}

