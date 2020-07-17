using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data.Sql;
using System.ComponentModel;
using System.Web.Services.Description;
using System.Web.DynamicData;
using System.Configuration;
using System.Security.AccessControl;
using Newtonsoft.Json.Converters;
using System.Globalization;
using Microsoft.Ajax.Utilities;
using System.Web.UI.HtmlControls;
using System.Drawing;

namespace roastmaster
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB; AttachDbFilename=C:\Users\Nate Wheeler\Documents\roastmaster.mdf; Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Clients", sqlCon);
                    DataTable dtbl = new DataTable();
                    sqlDa.Fill(dtbl);
                    gvClients.DataSource = dtbl;
                    gvClients.DataBind();
                    sqlCon.Close();
                    Label1client.Text = (gvClients.DataSource as DataTable).Rows.Count + " Leads";

                }

            }
        }
    }
}