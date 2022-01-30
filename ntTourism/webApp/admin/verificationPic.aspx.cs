using System;
using System.Collections.Generic;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_verificationPic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string str = GetNum(4);
        Session["random"] = str;
        CreateImage(str);
    }
    public string GetNum(int lenth)
    {
        string str = "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z";
        string[] arraystr = str.Split(',');
        Response.Write(arraystr[3]);
        string Vnum = string.Empty;
        Random random = new Random();

        for (int i = 0; i < lenth; i++)
        {
            int res = random.Next(arraystr.Length);
            string aft = arraystr[res];
            bool control = true;
            random = new Random(unchecked((int)DateTime.Now.Ticks));
            do
            {
                int result = Vnum.IndexOf(aft);
                if (result > -1)
                {
                    res = random.Next(arraystr.Length);
                    aft = arraystr[res];
                }
                else
                {
                    Vnum = Vnum + aft;
                    control = false;
                }
            } while (control);

        }

        return Vnum;
    }

    public void CreateImage(string VNum)
    {
        int Gheight = (int)(VNum.Length * 11.5);
        System.Drawing.Bitmap Img = new System.Drawing.Bitmap(Gheight, 20);
        Graphics g = Graphics.FromImage(Img);
        g.DrawString(VNum, new System.Drawing.Font("Courier New", 12), new System.Drawing.SolidBrush(Color.Red), 1, 1);
        System.IO.MemoryStream ms = new System.IO.MemoryStream();
        Img.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
        Response.ClearContent();
        Response.ContentType = "image/png";
        Response.BinaryWrite(ms.ToArray());
        g.Dispose();
        Img.Dispose();
        Response.End();


    }
}