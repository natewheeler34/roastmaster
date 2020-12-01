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

        protected void EditClient_Click(object sender, EventArgs e)
        {
            ModalPopupExtender2.Show();
            UpdateClient.Visible = true;
            NewCompanyNameC.Enabled = true;
            NewIndustryC.Enabled = true;
            NewContactNameC.Enabled = true;
            NewEmailC.Enabled = true;
            NewPhoneNumberC.Enabled = true;
            NewStateC.Enabled = true;
            NewAddress.Enabled = true;
            NewBillingAddress.Enabled = true;
            NewRevenueRangeC.Enabled = true;
            NotesC.Enabled = true;
            NewClientCode.Enabled = true;
            NewCreditLimit.Enabled = true;
            Button6Client.Enabled = false;
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                foreach (GridViewRow row in gvClients.Rows)
                {
                    var chk = row.FindControl("SelectRowC") as CheckBox;
                    if (chk.Checked)
                    {
                        var lblID = row.FindControl("IdDisplayC") as Label;
                        var companyname = row.FindControl("CompanyNameLblC") as Label;
                        var contactname = row.FindControl("ContactNamelblC") as Label;
                        var industry = row.FindControl("IndustryDisplayC") as Label;
                        var email = row.FindControl("EmaillblC") as Label;
                        var phonenumber = row.FindControl("PhoneNumberlblC") as Label;
                        var state = row.FindControl("StatelblC") as Label;
                        var revenuerange = row.FindControl("RevenueRangeDisplayC") as Label;
                        var notes = row.FindControl("NotesDisplayC") as Label;
                        var address = row.FindControl("AddressDisplay") as Label;
                        var billingaddress = row.FindControl("BillingAddressDisplay") as Label;
                        var paymentmethod = row.FindControl("PaymentMethodDisplay") as Label;
                        var clientcode = row.FindControl("ClientCodeDisplay") as Label;
                        var terms = row.FindControl("TermsDisplay") as Label;
                        var salesrep = row.FindControl("SalesRepDisplay") as Label;
                        var creditlimit = row.FindControl("CreditLimitDisplay") as Label;
                        SqlCommand comm = new SqlCommand();
                        comm.CommandText = "SELECT * FROM Clients WHERE Id=@id";
                        comm.Connection = sqlCon;
                        comm.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                        NewCompanyNameC.Text = companyname.Text;
                        NewContactNameC.Text = contactname.Text;
                        if (industry == null)
                        {
                            NewIndustryC.Text = "";
                        }
                        else
                        {
                            NewIndustryC.Text = industry.Text;
                        }
                        NewEmailC.Text = email.Text;
                        NewPhoneNumberC.Text = phonenumber.Text;
                        if (state == null)
                        {
                            NewStateC.Text = "";
                        }
                        else
                        {
                            NewStateC.Text = state.Text;
                        }
                        if (revenuerange == null)
                        {
                            NewRevenueRangeC.Text = "";
                        }
                        else
                        {
                            NewRevenueRangeC.Text = revenuerange.Text;
                        }
                        if (notes == null)
                        {
                            NotesC.Text = "";
                        }
                        else
                        {
                            NotesC.Text = notes.Text;
                        }
                        NewAddress.Text = address.Text;
                        NewBillingAddress.Text = billingaddress.Text;
                        if (paymentmethod == null)
                        {
                            NewPaymentMethod.Text = "";
                        }
                        else
                        {
                            NewPaymentMethod.Text = paymentmethod.Text;
                        }
                        NewClientCode.Text = clientcode.Text;
                        if (terms == null)
                        {
                            NewTerms.Text = "";
                        }
                        else
                        {
                            NewTerms.Text = terms.Text;
                        }
                        if (salesrep == null)
                        {
                            NewSalesRep.Text = "";
                        }
                        else
                        {
                            NewSalesRep.Text = salesrep.Text;
                        }
                        NewCreditLimit.Text = creditlimit.Text = "";
                        sqlCon.Open();
                        comm.ExecuteNonQuery();
                        sqlCon.Close();
                    }
                }
            }
        }

        protected void DeleteClient_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                foreach (GridViewRow row in gvClients.Rows)
                {
                    var chk = row.FindControl("SelectRowC") as CheckBox;
                    if (chk.Checked)
                    {
                        var lblID = row.FindControl("IdDisplayC") as Label;
                        SqlCommand comm = new SqlCommand();
                        comm.CommandText = "DELETE FROM Clients WHERE Id=@id";
                        comm.Connection = sqlCon;
                        comm.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                        sqlCon.Open();
                        comm.ExecuteNonQuery();
                        SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Clients", sqlCon);
                        DataTable dtbl = new DataTable();
                        sqlDa.Fill(dtbl);
                        gvClients.DataSource = dtbl;
                        gvClients.DataBind();
                        sqlCon.Close();
                    }
                }
            }
        }

        protected void Button3client_Click(object sender, EventArgs e)
        {
            ModalPopupExtender2.Show();
            NewClientFinish.Visible = true;
        }

        protected void modalclose2_Click(object sender, EventArgs e)
        {
            ModalPopupExtender2.Hide();
            NewClientFinish.Visible = false;
            UpdateClient.Visible = false;
            Button6Client.Enabled = true;
        }

        public void NewClientFinish_Click(object sender, EventArgs e)
        {
            var companyname = this.Panel2.FindControl("NewCompanyNameC") as TextBox;
            var contactname = this.Panel2.FindControl("NewContactNameC") as TextBox;
            var email = this.Panel2.FindControl("NewEmailC") as TextBox;
            var phonenumber = this.Panel2.FindControl("NewPhoneNumberC") as TextBox;
            var state = this.Panel2.FindControl("NewStateC") as DropDownList;
            var address = this.Panel2.FindControl("NewAddress") as TextBox;
            var billingaddress = this.Panel2.FindControl("NewBillingAddress") as TextBox;
            var industry = this.Panel2.FindControl("NewIndustryC") as DropDownList;
            var revenuerange = this.Panel2.FindControl("NewRevenueRangeC") as DropDownList;
            var notes = this.Panel2.FindControl("NotesC") as TextBox;
            var paymentmethod = this.Panel2.FindControl("NewPaymentMethod") as DropDownList;
            var clientcode = this.Panel2.FindControl("NewClientCode") as TextBox;
            var terms = this.Panel2.FindControl("NewTerms") as DropDownList;
            var salesrep = this.Panel2.FindControl("NewSalesRep") as DropDownList;
            var creditlimit = this.Panel2.FindControl("NewCreditLimit") as TextBox;

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Clients(CompanyName, Industry, ContactName, Email, PhoneNumber, State, Address, BillingAddress, RevenueRange, Notes, PaymentMethod, ClientCode, Terms, SalesRep, CreditLimit) VALUES (@CompanyName, @Industry, @ContactName, @Email, @PhoneNumber, @State, @Address, @BillingAddress, @RevenueRange, @Notes, @PaymentMethod, @ClientCode, @Terms, @SalesRep, @CreditLimit)", sqlCon);
                cmd.Parameters.AddWithValue("@CompanyName", companyname.Text);
                cmd.Parameters.AddWithValue("@ContactName", contactname.Text);
                cmd.Parameters.AddWithValue("@Email", email.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", phonenumber.Text);
                cmd.Parameters.AddWithValue("@State", state.Text);
                cmd.Parameters.AddWithValue("@PaymentMethod", paymentmethod.Text);
                cmd.Parameters.AddWithValue("@ClientCode", clientcode.Text);
                cmd.Parameters.AddWithValue("@Industry", industry.Text);
                cmd.Parameters.AddWithValue("@RevenueRange", revenuerange.Text);
                cmd.Parameters.AddWithValue("@Notes", notes.Text);
                cmd.Parameters.AddWithValue("@Terms", terms.Text);
                cmd.Parameters.AddWithValue("@SalesRep", salesrep.Text);
                cmd.Parameters.AddWithValue("@Address", address.Text);
                cmd.Parameters.AddWithValue("@BillingAddress", billingaddress.Text);
                cmd.Parameters.AddWithValue("@CreditLimit", creditlimit.Text);
                sqlCon.Open();
                cmd.ExecuteNonQuery();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Clients", sqlCon);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                gvClients.DataSource = dtbl;
                gvClients.DataBind();
                sqlCon.Close();
                Label1client.Text = (gvClients.DataSource as DataTable).Rows.Count + " Clients";
            }
            ModalPopupExtender2.Hide();
            NewClientFinish.Visible = false;

        }

        protected void UpdateClient_Click(object sender, EventArgs e)
        {
            ModalPopupExtender2.Hide();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                foreach (GridViewRow row in gvClients.Rows)
                {
                    var chk = row.FindControl("SelectRowC") as CheckBox;
                    var companyname = this.Panel2.FindControl("NewCompanyNameC") as TextBox;
                    var contactname = this.Panel2.FindControl("NewContactNameC") as TextBox;
                    var email = this.Panel2.FindControl("NewEmailC") as TextBox;
                    var phonenumber = this.Panel2.FindControl("NewPhoneNumberC") as TextBox;
                    var state = this.Panel2.FindControl("NewStateC") as DropDownList;
                    var industry = this.Panel2.FindControl("NewIndustryC") as DropDownList;
                    var revenuerange = this.Panel2.FindControl("NewRevenueRangeC") as DropDownList;
                    var notes = this.Panel2.FindControl("NotesC") as TextBox;
                    var address = this.Panel2.FindControl("NewAddress") as TextBox;
                    var billingaddress = this.Panel2.FindControl("NewBillingAddress") as TextBox;
                    var paymentmethod = this.Panel2.FindControl("NewPaymentMethod") as DropDownList;
                    var clientcode = this.Panel2.FindControl("NewClientCode") as TextBox;
                    var salesrep = this.Panel2.FindControl("NewSalesRep") as DropDownList;
                    var terms = this.Panel2.FindControl("NewTerms") as DropDownList;
                    var creditlimit = this.Panel2.FindControl("NewCreditLimit") as TextBox;
                    if (chk.Checked)
                    {
                        var lblID = row.FindControl("IdDisplayC") as Label;
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = "UPDATE Clients SET CompanyName = @CompanyName, Industry = @Industry, ContactName = @ContactName, Email = @Email, PhoneNumber = @PhoneNumber, State = @State,  RevenueRange = @RevenueRange, Notes = @Notes, Address = @Address, BillingAddress = @BillingAddress, PaymentMethod = @PaymentMethod, ClientCode = @ClientCode, Terms = @Terms, SalesRep = @SalesRep, CreditLimit = @CreditLimit WHERE Id=@id";
                        cmd.Connection = sqlCon;
                        cmd.Parameters.AddWithValue("@CompanyName", companyname.Text);
                        cmd.Parameters.AddWithValue("@ContactName", contactname.Text);
                        cmd.Parameters.AddWithValue("@Email", email.Text);
                        cmd.Parameters.AddWithValue("@PhoneNumber", phonenumber.Text);
                        cmd.Parameters.AddWithValue("@State", state.Text);
                        cmd.Parameters.AddWithValue("@Address", address.Text);
                        cmd.Parameters.AddWithValue("@BillingAddress", billingaddress.Text);
                        cmd.Parameters.AddWithValue("@Industry", industry.Text);
                        cmd.Parameters.AddWithValue("@RevenueRange", revenuerange.Text);
                        cmd.Parameters.AddWithValue("@Notes", notes.Text);
                        cmd.Parameters.AddWithValue("@PaymentMethod", paymentmethod.Text);
                        cmd.Parameters.AddWithValue("@ClientCode", clientcode.Text);
                        cmd.Parameters.AddWithValue("@Terms", terms.Text);
                        cmd.Parameters.AddWithValue("@SalesRep", salesrep.Text);
                        cmd.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                        cmd.Parameters.AddWithValue("@CreditLimit", creditlimit.Text);
                        sqlCon.Open();
                        cmd.ExecuteNonQuery();
                        SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Clients", sqlCon);
                        DataTable dtbl = new DataTable();
                        sqlDa.Fill(dtbl);
                        gvClients.DataSource = dtbl;
                        gvClients.DataBind();
                        sqlCon.Close();
                    }
                }
            }
        }
        protected void ExpandArrowClient_Click(object sender, EventArgs e)
        {
            ModalPopupExtender2.Show();
            UpdateClient.Visible = false;
            NewCompanyNameC.Enabled = false;
            NewIndustryC.Enabled = false;
            NewContactNameC.Enabled = false;
            NewEmailC.Enabled = false;
            NewPhoneNumberC.Enabled = false;
            NewStateC.Enabled = false;
            NewRevenueRangeC.Enabled = false;
            NotesC.Enabled = false;
            NewAddress.Enabled = false;
            NewBillingAddress.Enabled = false;
            NewPaymentMethod.Enabled = false;
            NewClientCode.Enabled = false;
            NewTerms.Enabled = false;
            NewSalesRep.Enabled = false;
            NewCreditLimit.Enabled = false;
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                foreach (GridViewRow row in gvClients.Rows)
                {
                    var lblID = this.gvClients.SelectedRow.FindControl("IdDisplayC") as Label;
                    var companyname = this.gvClients.SelectedRow.FindControl("CompanyNameLblC") as Label;
                    var contactname = this.gvClients.SelectedRow.FindControl("ContactNamelblC") as Label;
                    var industry = this.gvClients.SelectedRow.FindControl("IndustryDisplayC") as Label;
                    var email = this.gvClients.SelectedRow.FindControl("EmaillblC") as Label;
                    var phonenumber = this.gvClients.SelectedRow.FindControl("PhoneNumberlblC") as Label;
                    var state = this.gvClients.SelectedRow.FindControl("StatelblC") as Label;
                    var address = this.gvClients.SelectedRow.FindControl("AddressDisplay") as Label;
                    var billingaddress = this.gvClients.SelectedRow.FindControl("BillingAddressDisplay") as Label;
                    var revenuerange = this.gvClients.SelectedRow.FindControl("RevenueRangeDisplayC") as Label;
                    var notes = this.gvClients.SelectedRow.FindControl("NotesDisplayC") as Label;
                    var paymentmethod = this.gvClients.SelectedRow.FindControl("PaymentMethodDisplay") as Label;
                    var clientcode = this.gvClients.SelectedRow.FindControl("ClientCodeDisplay") as Label;
                    var terms = this.gvClients.SelectedRow.FindControl("TermsDisplay") as Label;
                    var salesrep = this.gvClients.SelectedRow.FindControl("SalesRepDisplay") as Label;
                    var creditlimit = this.gvClients.SelectedRow.FindControl("CreditLimitDislay") as Label;
                    SqlCommand comm = new SqlCommand();
                    comm.CommandText = "SELECT * FROM Clients WHERE Id=@id";
                    comm.Connection = sqlCon;
                    comm.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                    NewCompanyNameC.Text = companyname.Text;
                    NewContactNameC.Text = contactname.Text;
                    NewIndustryC.Text = industry.Text;
                    NewEmailC.Text = email.Text;
                    NewPhoneNumberC.Text = phonenumber.Text;
                    NewStateC.Text = state.Text;
                    NewRevenueRangeC.Text = revenuerange.Text;
                    NotesC.Text = notes.Text;
                    NewAddress.Text = address.Text;
                    NewBillingAddress.Text = billingaddress.Text;
                    NewPaymentMethod.Text = paymentmethod.Text;
                    NewClientCode.Text = clientcode.Text;
                    NewTerms.Text = terms.Text;
                    NewSalesRep.Text = salesrep.Text;
                    NewCreditLimit.Text = creditlimit.Text;
                    sqlCon.Open();
                    comm.ExecuteNonQuery();
                    sqlCon.Close();
                }
            }
        }

        protected void Button6Client_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                var companyname = this.Panel2.FindControl("NewCompanyNameC") as TextBox;
    
                foreach (GridViewRow row in gvClients.Rows)
                {
                    var chk = row.FindControl("SelectRowC") as CheckBox;
                    if (chk.Checked)
                    {
                        var lblID = row.FindControl("IdDisplayC") as Label;
                        SqlCommand cmd = new SqlCommand("INSERT INTO SO(CompanyName) VALUES (@CompanyName)", sqlCon);
                        cmd.Parameters.AddWithValue("@CompanyName", companyname.Text);
                        cmd.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                        sqlCon.Open();
                        cmd.ExecuteNonQuery();
                        SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Clients", sqlCon);
                        DataTable dtbl = new DataTable();
                        sqlDa.Fill(dtbl);
                        gvClients.DataSource = dtbl;
                        gvClients.DataBind();
                        sqlCon.Close();
                    }
                }
            }
        }
    }
}