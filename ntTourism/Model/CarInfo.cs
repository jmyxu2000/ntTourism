using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class CarInfo
    {
        private string carcode;

        public string Carcode
        {
            get { return carcode; }
            set { carcode = value; }
        }

        private string cartype;

        public string Cartype
        {
            get { return cartype; }
            set { cartype = value; }
        }

        private decimal budget;

        public decimal Budget
        {
            get { return budget; }
            set { budget = value; }
        }

        private string describe;

        public string Describe
        {
            get { return describe; }
            set { describe = value; }
        }

        private string location;

        public string Location
        {
            get { return location; }
            set { location = value; }
        }

        private string pic;

        public string Pic
        {
            get { return pic; }
            set { pic = value; }
        }

        private int number;

        public int Number
        {
            get { return number; }
            set { number = value; }
        }

        private int seq;

        public int Seq
        {
            get { return seq; }
            set { seq = value; }
        }

        private string citycode;

        public string Citycode
        {
            get { return citycode; }
            set { citycode = value; }
        }

        private string state;

        public string State
        {
            get { return state; }
            set { state = value; }
        }
    }
}
