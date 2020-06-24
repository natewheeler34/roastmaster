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
        protected void Page_Load3(object sender, EventArgs e)
        {

        }

        protected void Button2Invoices_Click(object sender, EventArgs e)
        {
            MultiView1Invoices.ActiveViewIndex = 1;
            Button2Invoices.BackColor = System.Drawing.Color.Silver;
            Button1Invoices.BackColor = System.Drawing.Color.White;
        }

        protected void Button1Invoices_Click(object sender, EventArgs e)
        {
            MultiView1Invoices.ActiveViewIndex = 0;
            Button2Invoices.BackColor = System.Drawing.Color.White;
            Button1Invoices.BackColor = System.Drawing.Color.Silver;
        }
    }
}