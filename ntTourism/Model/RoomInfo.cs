using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class RoomInfo
    {
        private string roomcode;

        public string Roomcode
        {
            get { return roomcode; }
            set { roomcode = value; }
        }

        private string roomname;

        public string Roomname
        {
            get { return roomname; }
            set { roomname = value; }
        }

        private string hotelcode;

        public string Hotelcode
        {
            get { return hotelcode; }
            set { hotelcode = value; }
        }

        private string roomtype;

        public string Roomtype
        {
            get { return roomtype; }
            set { roomtype = value; }
        }

        private decimal price;

        public decimal Price
        {
            get { return price; }
            set { price = value; }
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
        public string State { get; set; }
    }
}
