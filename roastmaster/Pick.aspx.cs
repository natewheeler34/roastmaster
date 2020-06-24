using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace roastmaster
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2pick_Click(object sender, EventArgs e)
        {
            MultiView1pick.ActiveViewIndex = 1;
            Button2pick.BackColor = System.Drawing.Color.Silver;
            Button1pick.BackColor = System.Drawing.Color.White;
        }

        protected void Button1pick_Click(object sender, EventArgs e)
        {
            MultiView1pick.ActiveViewIndex = 0;
            Button2pick.BackColor = System.Drawing.Color.White;
            Button1pick.BackColor = System.Drawing.Color.Silver;
        }

    }
}