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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            Button2.BackColor = System.Drawing.Color.Silver;
            Button1.BackColor = System.Drawing.Color.White;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            Button2.BackColor = System.Drawing.Color.White;
            Button1.BackColor = System.Drawing.Color.Silver;
        }
    }
}