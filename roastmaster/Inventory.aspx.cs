using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace roastmaster
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load2(object sender, EventArgs e)
        {

        }

        protected void Button2Inv_Click(object sender, EventArgs e)
        {
            MultiView1Inv.ActiveViewIndex = 1;
            Button2Inv.BackColor = System.Drawing.Color.Silver;
            Button1Inv.BackColor = System.Drawing.Color.White;
            ButtonNewLocation.Enabled = true;
            ButtonMoveInv.Enabled = false;
            Button6Inv.Enabled = false;
            Button3Inv.Enabled = false;

        }

        protected void Button1Inv_Click(object sender, EventArgs e)
        {
            MultiView1Inv.ActiveViewIndex = 0;
            Button2Inv.BackColor = System.Drawing.Color.White;
            Button1Inv.BackColor = System.Drawing.Color.Silver;
            ButtonNewLocation.Enabled = false;
            ButtonMoveInv.Enabled = true;
            Button6Inv.Enabled = true;
            Button3Inv.Enabled = true;
        }

    }
}