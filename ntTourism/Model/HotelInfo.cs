using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class HotelInfo
    {
        private string hotelcode;

        public string Hotelcode
        {
            get { return hotelcode; }
            set { hotelcode = value; }
        }
        private string citycode;

        public string Citycode
        {
            get { return citycode; }
            set { citycode = value; }
        }
        private string hotelname;

        public string Hotelname
        {
            get { return hotelname; }
            set { hotelname = value; }
        }
        private string describe;

        public string Describe
        {
            get { return describe; }
            set { describe = value; }
        }
        private int roomNum;

        public int RoomNum
        {
            get { return roomNum; }
            set { roomNum = value; }
        }
        private string hotelpic;

        public string Hotelpic
        {
            get { return hotelpic; }
            set { hotelpic = value; }
        }
        private int seq;

        public int Seq
        {
            get { return seq; }
            set { seq = value; }
        }
        private decimal budget;

        public decimal Budget
        {
            get { return budget; }
            set { budget = value; }
        }
    }
}
