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
    public partial class SO : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB; AttachDbFilename=C:\Users\Nate Wheeler\Documents\roastmaster.mdf; Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM SO", sqlCon);
                    DataTable dtbl = new DataTable();
                    sqlDa.Fill(dtbl);
                    gvSO.DataSource = dtbl;
                    gvSO.DataBind();
                    sqlCon.Close();
                    Label1SO.Text = (gvSO.DataSource as DataTable).Rows.Count + " Sales Orders";

                }

            }
        }

        protected void Button3SO_Click(object sender, EventArgs e)
        {
            ModalPopupExtender4.Show();
            NewSOFinish.Visible = true;
        }

        protected void EditSO_Click(object sender, EventArgs e)
        {
            ModalPopupExtender4.Show();
            UpdateSO.Visible = true;
            NewSONumber.Enabled = true;
            NewCompanyNameSO.Enabled = true;
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                foreach (GridViewRow row in gvSO.Rows)
                {
                    var chk = row.FindControl("SelectRowSO") as CheckBox;
                    if (chk.Checked)
                    {
                        var lblID = row.FindControl("IdDisplaySO") as Label;
                        var companyname = row.FindControl("CompanyNameSOlbl") as Label;
                        var sonumber = row.FindControl("SONumberlbl") as Label;
                        var date = row.FindControl("DateDisplaySO") as Label;
                        var address = row.FindControl("AddressDisplaySO") as Label;
                        var billingaddress = row.FindControl("BillingAddressDisplaySO") as Label;
                        var salesrep = row.FindControl("SalesRepDisplaySO") as Label;
                        var clientcode = row.FindControl("ClientCodeDisplaySO") as Label;
                        var terms = row.FindControl("TermsDisplaySO") as Label;
                        var phonenumber = row.FindControl("PhoneNumberDisplaySO") as Label;
                        var email = row.FindControl("EmailDisplaySO") as Label;
                        SqlCommand comm = new SqlCommand();
                        comm.CommandText = "SELECT * FROM SO WHERE Id=@id";
                        comm.Connection = sqlCon;
                        comm.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                        NewSONumber.Text = sonumber.Text;
                        NewCompanyNameSO.Text = companyname.Text;
                        NewDateSO.Text = date.Text;
                        NewAddressSO.Text = address.Text;
                        NewBillingAddressSO.Text = billingaddress.Text;
                        NewSalesRepSO.Text = salesrep.Text;
                        NewClientCodeSO.Text = clientcode.Text;
                        NewTermsSO.Text = terms.Text;
                        NewPhoneNumberSO.Text = phonenumber.Text;
                        NewEmailSO.Text = email.Text;
                        sqlCon.Open();
                        comm.ExecuteNonQuery();
                        sqlCon.Close();
                    }
                }
            }
        }

        protected void DeleteSO_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                foreach (GridViewRow row in gvSO.Rows)
                {
                    var chk = row.FindControl("SelectRowSO") as CheckBox;
                    if (chk.Checked)
                    {
                        var lblID = row.FindControl("IdDisplaySO") as Label;
                        SqlCommand comm = new SqlCommand();
                        comm.CommandText = "DELETE FROM SO WHERE Id=@id";
                        comm.Connection = sqlCon;
                        comm.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                        sqlCon.Open();
                        comm.ExecuteNonQuery();
                        SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM SO", sqlCon);
                        DataTable dtbl = new DataTable();
                        sqlDa.Fill(dtbl);
                        gvSO.DataSource = dtbl;
                        gvSO.DataBind();
                        sqlCon.Close();
                    }
                }
            }
        }

        protected void modalclose4_Click(object sender, EventArgs e)
        {
            ModalPopupExtender4.Hide();
            NewSOFinish.Visible = false;
            UpdateSO.Visible = false;
            Button6SO.Enabled = true;
        }

        public void NewSOFinish_Click(object sender, EventArgs e)
        {
            var companyname = this.Panel4.FindControl("NewCompanyNameSO") as TextBox;
            var sonumber = this.Panel4.FindControl("NewSONumber") as TextBox;
            var date = this.Panel4.FindControl("NewDateSO") as TextBox;
            var address = this.Panel4.FindControl("NewAddressSO") as TextBox;
            var billingaddress = this.Panel4.FindControl("NewBillingAddressSO") as TextBox;
            var salesrep = this.Panel4.FindControl("NewSalesRepSO") as DropDownList;
            var clientcode = this.Panel4.FindControl("NewClientCodeSO") as TextBox;
            var terms = this.Panel4.FindControl("NewTermsSO") as DropDownList;
            var phonenumber = this.Panel4.FindControl("NewPhoneNumberSO") as TextBox;
            var email = this.Panel4.FindControl("NewEmailSO") as TextBox;

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO SO(CompanyName, SONumber, Date, Address, BillingAddress, SalesRep, ClientCode, Terms, PhoneNumber, Email) VALUES (@CompanyName, @SONumber, @Date, @Address, @BillingAddress, @SalesRep, @ClientCode, @Terms, @PhoneNumber, @Email)", sqlCon);
                cmd.Parameters.AddWithValue("@CompanyName", companyname.Text);
                cmd.Parameters.AddWithValue("@SONumber", sonumber.Text);
                cmd.Parameters.AddWithValue("@Date", date.Text);
                cmd.Parameters.AddWithValue("@Address", address.Text);
                cmd.Parameters.AddWithValue("@BillingAddress", billingaddress.Text);
                cmd.Parameters.AddWithValue("@SalesRep", salesrep.Text);
                cmd.Parameters.AddWithValue("@ClientCode", clientcode.Text);
                cmd.Parameters.AddWithValue("@Terms", terms.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", phonenumber.Text);
                cmd.Parameters.AddWithValue("@Email", email.Text);
                sqlCon.Open();
                cmd.ExecuteNonQuery();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM SO", sqlCon);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                gvSO.DataSource = dtbl;
                gvSO.DataBind();
                sqlCon.Close();
                Label1SO.Text = (gvSO.DataSource as DataTable).Rows.Count + " Sales Orders";
            }
            ModalPopupExtender4.Hide();
            NewSOFinish.Visible = false;

        }

        protected void UpdateSO_Click(object sender, EventArgs e)
        {
            ModalPopupExtender4.Hide();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                foreach (GridViewRow row in gvSO.Rows)
                {
                    var chk = row.FindControl("SelectRowSO") as CheckBox;
                    var companyname = this.Panel4.FindControl("NewCompanyNameSO") as TextBox;
                    var sonumber = this.Panel4.FindControl("NewSONumber") as TextBox;
                    var date = this.Panel4.FindControl("NewDateSO") as TextBox;
                    var address = this.Panel4.FindControl("NewAddressSO") as TextBox;
                    var billingaddress = this.Panel4.FindControl("NewBillingAddressSO") as TextBox;
                    var salesrep = this.Panel4.FindControl("NewSalesRepSO") as DropDownList;
                    var clientcode = this.Panel4.FindControl("NewClientCodeSO") as TextBox;
                    var terms = this.Panel4.FindControl("NewTermsSO") as DropDownList;
                    var phonenumber = this.Panel4.FindControl("NewPhoneNumberSO") as TextBox;
                    var email = this.Panel4.FindControl("NewEmailSO") as TextBox;
                    if (chk.Checked)
                    {
                        var lblID = row.FindControl("IdDisplaySO") as Label;
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = "UPDATE SO SET CompanyName = @CompanyName, SONumber = @SONumber, Date = @Date, Address = @Address, BillingAddress = @BillingAddress, SalesRep = @SalesRep, ClientCode = @ClientCode, Terms = @Terms, PhoneNumber = @PhoneNumber, Email = @Email WHERE Id=@id";
                        cmd.Connection = sqlCon;
                        cmd.Parameters.AddWithValue("@CompanyName", companyname.Text);
                        cmd.Parameters.AddWithValue("@SONumber", sonumber.Text);
                        cmd.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                        cmd.Parameters.AddWithValue("@Date", date.Text);
                        cmd.Parameters.AddWithValue("@Address", address.Text);
                        cmd.Parameters.AddWithValue("@BillingAddress", billingaddress.Text);
                        cmd.Parameters.AddWithValue("@SalesRep", salesrep.Text);
                        cmd.Parameters.AddWithValue("@ClientCode", clientcode.Text);
                        cmd.Parameters.AddWithValue("@Terms", terms.Text);
                        cmd.Parameters.AddWithValue("@PhoneNumber", phonenumber.Text);
                        cmd.Parameters.AddWithValue("@Email", email.Text);
                        sqlCon.Open();
                        cmd.ExecuteNonQuery();
                        SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM SO", sqlCon);
                        DataTable dtbl = new DataTable();
                        sqlDa.Fill(dtbl);
                        gvSO.DataSource = dtbl;
                        gvSO.DataBind();
                        sqlCon.Close();
                    }
                }
            }
        }
    }
}