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


    public partial class WebForm1 : System.Web.UI.Page
    {

        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB; AttachDbFilename=C:\Users\Nate Wheeler\Documents\roastmaster.mdf; Integrated Security=True;";


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Leads", sqlCon);
                    DataTable dtbl = new DataTable();
                    sqlDa.Fill(dtbl);
                    gvLeads.DataSource = dtbl;
                    gvLeads.DataBind();
                    sqlCon.Close();
                    Label1.Text = (gvLeads.DataSource as DataTable).Rows.Count + " Leads";

                }

            }


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

        public void NewLeadFinish_Click(object sender, EventArgs e)
        {
            var companyname = this.Panel1.FindControl("NewCompanyName") as TextBox;
            var contactname = this.Panel1.FindControl("NewContactName") as TextBox;
            var email = this.Panel1.FindControl("NewEmail") as TextBox;
            var phonenumber = this.Panel1.FindControl("NewPhoneNumber") as TextBox;
            var state = this.Panel1.FindControl("NewState") as DropDownList;
            var numberoftimescontacted = this.Panel1.FindControl("NewNumberOfTimesContacted") as TextBox;
            var dateoflastcontact = this.Panel1.FindControl("NewDateOfLastContact") as TextBox;
            var industry = this.Panel1.FindControl("NewIndustry") as DropDownList;
            var revenuerange = this.Panel1.FindControl("RevenueRange") as DropDownList;
            var notes = this.Panel1.FindControl("Notes") as TextBox;

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Leads(CompanyName, Industry, ContactName, Email, PhoneNumber, State, NumberOfTimesContacted, DateOfLastContact, RevenueRange, Notes) VALUES (@CompanyName, @Industry, @ContactName, @Email, @PhoneNumber, @State, @NumberOfTimesContacted, @DateOfLastContact, @RevenueRange, @Notes)", sqlCon);
                cmd.Parameters.AddWithValue("@CompanyName", companyname.Text);
                cmd.Parameters.AddWithValue("@ContactName", contactname.Text);
                cmd.Parameters.AddWithValue("@Email", email.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", phonenumber.Text);
                cmd.Parameters.AddWithValue("@State", state.Text);
                cmd.Parameters.AddWithValue("@NumberOfTimesContacted", numberoftimescontacted.Text);
                cmd.Parameters.AddWithValue("@DateOfLastContact", dateoflastcontact.Text);
                cmd.Parameters.AddWithValue("@Industry", industry.Text);
                cmd.Parameters.AddWithValue("@RevenueRange", revenuerange.Text);
                cmd.Parameters.AddWithValue("@Notes", notes.Text);
                sqlCon.Open();
                cmd.ExecuteNonQuery();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Leads", sqlCon);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                gvLeads.DataSource = dtbl;
                gvLeads.DataBind();
                sqlCon.Close();
                Label1.Text = (gvLeads.DataSource as DataTable).Rows.Count + " Leads";
            }
            ModalPopupExtender1.Hide();
            NewLeadFinish.Visible = false;

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
            NewLeadFinish.Visible = true;
        }




        public void DeleteButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                foreach (GridViewRow row in gvLeads.Rows)
                {
                    var chk = row.FindControl("SelectRow") as CheckBox;
                    if (chk.Checked)
                    {
                        var lblID = row.FindControl("IdDisplay") as Label;
                        SqlCommand comm = new SqlCommand();
                        comm.CommandText = "DELETE FROM Leads WHERE Id=@id";
                        comm.Connection = sqlCon;
                        comm.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                        sqlCon.Open();
                        comm.ExecuteNonQuery();
                        SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Leads", sqlCon);
                        DataTable dtbl = new DataTable();
                        sqlDa.Fill(dtbl);
                        gvLeads.DataSource = dtbl;
                        gvLeads.DataBind();
                        sqlCon.Close();
                    }
                }
                Label1.Text = (gvLeads.DataSource as DataTable).Rows.Count + " Leads";
            }

        }

        protected void modalclose_Click(object sender, EventArgs e)
        {
                ModalPopupExtender1.Hide();
                NewLeadFinish.Visible = false;
                UpdateLead.Visible = false;
        }

        protected void edit_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
            UpdateLead.Visible = true;
            NewCompanyName.Enabled = true;
            NewIndustry.Enabled = true;
            NewContactName.Enabled = true;
            NewEmail.Enabled = true;
            NewPhoneNumber.Enabled = true;
            NewState.Enabled = true;
            NewNumberOfTimesContacted.Enabled = true;
            NewDateOfLastContact.Enabled = true;
            RevenueRange.Enabled = true;
            Notes.Enabled = true;
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                foreach (GridViewRow row in gvLeads.Rows)
                {
                    var chk = row.FindControl("SelectRow") as CheckBox;
                    if (chk.Checked)
                    {
                        var lblID = row.FindControl("IdDisplay") as Label;
                        var companyname = row.FindControl("CompanyNameLbl") as Label;
                        var contactname = row.FindControl("ContactNamelbl") as Label;
                        var industry = row.FindControl("IndustryDisplay") as Label;
                        var email = row.FindControl("Emaillbl") as Label;
                        var phonenumber = row.FindControl("PhoneNumberlbl") as Label;
                        var state = row.FindControl("Statelbl") as Label;
                        var numberoftimescontacted = row.FindControl("NumberOfTimesContactedlbl") as Label;
                        var dateoflastcontact = row.FindControl("DateOfLastContactlbl") as Label;
                        var revenuerange = row.FindControl("RevenueRangeDisplay") as Label;
                        var notes = row.FindControl("NotesDisplay") as Label;
                        SqlCommand comm = new SqlCommand();
                        comm.CommandText = "SELECT * FROM Leads WHERE Id=@id";
                        comm.Connection = sqlCon;
                        comm.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                        NewCompanyName.Text = companyname.Text;
                        NewContactName.Text = contactname.Text;
                        if (industry == null)
                        {
                            NewIndustry.Text = "";
                        }
                        else
                        {
                            NewIndustry.Text = industry.Text;
                        }
                        NewEmail.Text = email.Text;
                        NewPhoneNumber.Text = phonenumber.Text;
                        if (state == null)
                        {
                            NewState.Text = "";
                        }
                        else
                        {
                            NewState.Text = state.Text;
                        }
                        NewNumberOfTimesContacted.Text = numberoftimescontacted.Text;
                        NewDateOfLastContact.Text = dateoflastcontact.Text;
                        if (revenuerange == null)
                        {
                            RevenueRange.Text = "";
                        }
                        else
                        {
                            RevenueRange.Text = revenuerange.Text;
                        }
                        if (notes == null)
                        {
                            Notes.Text = "";
                        }
                        else
                        {
                            Notes.Text = notes.Text;
                        }
                        sqlCon.Open();
                        comm.ExecuteNonQuery();
                        sqlCon.Close();
                    }
                }
            }
        }

        protected void UpdateLead_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Hide();
            var companyname = this.Panel1.FindControl("NewCompanyName") as TextBox;
            var contactname = this.Panel1.FindControl("NewContactName") as TextBox;
            var email = this.Panel1.FindControl("NewEmail") as TextBox;
            var phonenumber = this.Panel1.FindControl("NewPhoneNumber") as TextBox;
            var state = this.Panel1.FindControl("NewState") as DropDownList;
            var numberoftimescontacted = this.Panel1.FindControl("NewNumberOfTimesContacted") as TextBox;
            var dateoflastcontact = this.Panel1.FindControl("NewDateOfLastContact") as TextBox;
            var industry = this.Panel1.FindControl("NewIndustry") as DropDownList;
            var revenuerange = this.Panel1.FindControl("RevenueRange") as DropDownList;
            var notes = this.Panel1.FindControl("Notes") as TextBox;

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                foreach (GridViewRow row in gvLeads.Rows)
                {
                    var chk = row.FindControl("SelectRow") as CheckBox;
                    if (chk.Checked)
                    {
                        var lblID = row.FindControl("IdDisplay") as Label;
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = "UPDATE Leads SET CompanyName = @CompanyName, Industry = @Industry, ContactName = @ContactName, Email = @Email, PhoneNumber = @PhoneNumber, State = @State, NumberOfTimesContacted = @NumberOfTimesContacted, DateOfLastContact = @DateOfLastContact, RevenueRange = @RevenueRange, Notes = @Notes WHERE Id=@id";
                        cmd.Connection = sqlCon;
                        cmd.Parameters.AddWithValue("@CompanyName", companyname.Text);
                        cmd.Parameters.AddWithValue("@ContactName", contactname.Text);
                        cmd.Parameters.AddWithValue("@Email", email.Text);
                        cmd.Parameters.AddWithValue("@PhoneNumber", phonenumber.Text);
                        cmd.Parameters.AddWithValue("@State", state.Text);
                        cmd.Parameters.AddWithValue("@NumberOfTimesContacted", numberoftimescontacted.Text);
                        cmd.Parameters.AddWithValue("@DateOfLastContact", dateoflastcontact.Text);
                        cmd.Parameters.AddWithValue("@Industry", industry.Text);
                        cmd.Parameters.AddWithValue("@RevenueRange", revenuerange.Text);
                        cmd.Parameters.AddWithValue("@Notes", notes.Text);
                        cmd.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                        sqlCon.Open();
                        cmd.ExecuteNonQuery();
                        SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Leads", sqlCon);
                        DataTable dtbl = new DataTable();
                        sqlDa.Fill(dtbl);
                        gvLeads.DataSource = dtbl;
                        gvLeads.DataBind();
                        sqlCon.Close();
                    }
                }
                
                //Label1.Text = (gvLeads.DataSource as DataTable).Rows.Count + " Leads";
            }
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            ModalPopupExtender1.Show();
            UpdateLead.Visible = false;
            NewCompanyName.Enabled = false;
            NewIndustry.Enabled = false;
            NewContactName.Enabled = false;
            NewEmail.Enabled = false;
            NewPhoneNumber.Enabled = false;
            NewState.Enabled = false;
            NewNumberOfTimesContacted.Enabled = false;
            NewDateOfLastContact.Enabled = false;
            RevenueRange.Enabled = false;
            Notes.Enabled = false;
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                var lblID = this.gvLeads.SelectedRow.FindControl("IdDisplay") as Label;
                var companyname = this.gvLeads.SelectedRow.FindControl("CompanyNameLbl") as Label;
                var contactname = this.gvLeads.SelectedRow.FindControl("ContactNamelbl") as Label;
                var industry = this.gvLeads.SelectedRow.FindControl("IndustryDisplay") as Label;
                var email = this.gvLeads.SelectedRow.FindControl("Emaillbl") as Label;
                var phonenumber = this.gvLeads.SelectedRow.FindControl("PhoneNumberlbl") as Label;
                var state = this.gvLeads.SelectedRow.FindControl("Statelbl") as Label;
                var numberoftimescontacted = this.gvLeads.SelectedRow.FindControl("NumberOfTimesContactedlbl") as Label;
                var dateoflastcontact = this.gvLeads.SelectedRow.FindControl("DateOfLastContactlbl") as Label;
                var revenuerange = this.gvLeads.SelectedRow.FindControl("RevenueRangeDisplay") as Label;
                var notes = this.gvLeads.SelectedRow.FindControl("NotesDisplay") as Label;
                SqlCommand comm = new SqlCommand();
                comm.CommandText = "SELECT * FROM Leads WHERE Id=@id";
                comm.Connection = sqlCon;
                comm.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                NewCompanyName.Text = companyname.Text;
                NewContactName.Text = contactname.Text;
                NewIndustry.Text = industry.Text;
                NewEmail.Text = email.Text;
                NewPhoneNumber.Text = phonenumber.Text;
                NewState.Text = state.Text;
                NewNumberOfTimesContacted.Text = numberoftimescontacted.Text;
                NewDateOfLastContact.Text = dateoflastcontact.Text;
                RevenueRange.Text = revenuerange.Text;
                Notes.Text = notes.Text;
                sqlCon.Open();
                comm.ExecuteNonQuery();
                sqlCon.Close();
            }

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                var companyname = this.Panel1.FindControl("NewCompanyName") as TextBox;
                var contactname = this.Panel1.FindControl("NewContactName") as TextBox;
                var email = this.Panel1.FindControl("NewEmail") as TextBox;
                var phonenumber = this.Panel1.FindControl("NewPhoneNumber") as TextBox;
                var state = this.Panel1.FindControl("NewState") as DropDownList;
                var numberoftimescontacted = this.Panel1.FindControl("NewNumberOfTimesContacted") as TextBox;
                var dateoflastcontact = this.Panel1.FindControl("NewDateOfLastContact") as TextBox;
                var industry = this.Panel1.FindControl("NewIndustry") as DropDownList;
                var revenuerange = this.Panel1.FindControl("RevenueRange") as DropDownList;
                var notes = this.Panel1.FindControl("Notes") as TextBox;
                foreach (GridViewRow row in gvLeads.Rows)
                {
                    var chk = row.FindControl("SelectRow") as CheckBox;
                    if (chk.Checked)
                    {
                        var lblID = row.FindControl("IdDisplay") as Label;
                        SqlCommand cmd = new SqlCommand("INSERT INTO Clients(CompanyName, Industry, ContactName, Email, PhoneNumber, State, RevenueRange, Notes) VALUES (@CompanyName, @Industry, @ContactName, @Email, @PhoneNumber, @State, @RevenueRange, @Notes)", sqlCon);
                        cmd.Parameters.AddWithValue("@CompanyName", companyname.Text);
                        cmd.Parameters.AddWithValue("@ContactName", contactname.Text);
                        cmd.Parameters.AddWithValue("@Email", email.Text);
                        cmd.Parameters.AddWithValue("@PhoneNumber", phonenumber.Text);
                        cmd.Parameters.AddWithValue("@State", state.Text);
                        cmd.Parameters.AddWithValue("@NumberOfTimesContacted", numberoftimescontacted.Text);
                        cmd.Parameters.AddWithValue("@DateOfLastContact", dateoflastcontact.Text);
                        cmd.Parameters.AddWithValue("@Industry", industry.Text);
                        cmd.Parameters.AddWithValue("@RevenueRange", revenuerange.Text);
                        cmd.Parameters.AddWithValue("@Notes", notes.Text);
                        SqlCommand comm = new SqlCommand();
                        comm.CommandText = "DELETE FROM Leads WHERE Id=@id";
                        comm.Connection = sqlCon;
                        comm.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                        sqlCon.Open();
                        comm.ExecuteNonQuery();
                        cmd.ExecuteNonQuery();
                        SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Leads", sqlCon);
                        DataTable dtbl = new DataTable();
                        sqlDa.Fill(dtbl);
                        gvLeads.DataSource = dtbl;
                        gvLeads.DataBind();
                        sqlCon.Close();
                    }
                }
            }
        }
    }  

}