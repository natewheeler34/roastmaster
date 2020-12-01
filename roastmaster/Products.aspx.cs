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
    public partial class WebForm3 : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB; AttachDbFilename=C:\Users\Nate Wheeler\Documents\roastmaster.mdf; Integrated Security=True;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Products", sqlCon);
                    DataTable dtbl = new DataTable();
                    sqlDa.Fill(dtbl);
                    gvProducts.DataSource = dtbl;
                    gvProducts.DataBind();
                    sqlCon.Close();
                    Label1products.Text = (gvProducts.DataSource as DataTable).Rows.Count + " Products";
                    if (NewProductType.SelectedValue == "1")
                    {
                        NewModuleA.Visible = true;
                        NewQuantityA.Visible = true;
                        NewModuleB.Visible = true;
                        NewQuantityB.Visible = true;
                        NANewROP.Visible = true;
                        NewROP.Visible = false;
                    }
                    else
                    {
                        NewModuleA.Visible = false;
                        NewQuantityA.Visible = false;
                        NewModuleB.Visible = false;
                        NewQuantityB.Visible = false;
                        NANewROP.Visible = false;
                        NewROP.Visible = true;
                    }
                }

            }
        }

        protected void Button3products_Click(object sender, EventArgs e)
        {
            ModalPopupExtender3.Show();
            NewProductFinish.Visible = true;
            UpdateProduct.Visible = false;
        }

        protected void modalclose3_Click(object sender, EventArgs e)
        {
            ModalPopupExtender3.Hide();
            NewProductFinish.Visible = false;
            UpdateProduct.Visible = false;
        }

        public void NewProduct_Click(object sender, EventArgs e)
        {
            var productnumber = this.Panel3.FindControl("NewProductNumber") as TextBox;
            var productdescription = this.Panel3.FindControl("NewProductDescription") as TextBox;
            var unittype = this.Panel3.FindControl("NewUnitType") as DropDownList;
            var rop = this.Panel3.FindControl("NewROP") as TextBox;
            var modulea = this.Panel3.FindControl("NewModuleA") as DropDownList;
            var quantitya = this.Panel3.FindControl("NewQuantityA") as TextBox;
            var moduleb = this.Panel3.FindControl("NewModuleB") as DropDownList;
            var quantityb = this.Panel3.FindControl("NewQuantityB") as TextBox;
            var producttype = this.Panel3.FindControl("NewProductType") as DropDownList;

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Products(ProductNumber, ProductDescription, UnitType, ROP, ModuleA, QuantityA, ModuleB, QuantityB, ProductType) VALUES (@ProductNumber, @ProductDescription, @UnitType, @ROP, @ModuleA, @QuantityA, @ModuleB, @QuantityB, @ProductType)", sqlCon);
                cmd.Parameters.AddWithValue("@ProductNumber", productnumber.Text);
                cmd.Parameters.AddWithValue("@ProductDescription", productdescription.Text);
                cmd.Parameters.AddWithValue("@UnitType", unittype.Text);
                cmd.Parameters.AddWithValue("@ROP", rop.Text);
                cmd.Parameters.AddWithValue("@ModuleA", modulea.Text);
                cmd.Parameters.AddWithValue("@QuantityA", quantitya.Text);
                cmd.Parameters.AddWithValue("@ModuleB", moduleb.Text);
                cmd.Parameters.AddWithValue("@QuantityB", quantityb.Text);
                cmd.Parameters.AddWithValue("@ProductType", producttype.Text);
                sqlCon.Open();
                cmd.ExecuteNonQuery();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Products", sqlCon);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                gvProducts.DataSource = dtbl;
                gvProducts.DataBind();
                sqlCon.Close();
                Label1products.Text = (gvProducts.DataSource as DataTable).Rows.Count + " Products";
                if (NewProductType.SelectedValue == "1")
                {
                    NewModuleA.Visible = true;
                    NewQuantityA.Visible = true;
                    NewModuleB.Visible = true;
                    NewQuantityB.Visible = true;
                    NANewROP.Visible = true;
                    NewROP.Visible = false;
                }
                else
                {
                    NewModuleA.Visible = false;
                    NewQuantityA.Visible = false;
                    NewModuleB.Visible = false;
                    NewQuantityB.Visible = false;
                    NANewROP.Visible = false;
                    NewROP.Visible = true;
                }
            }
            ModalPopupExtender3.Hide();
            NewProductFinish.Visible = false;

        }

        protected void UpdateProduct_Click(object sender, EventArgs e)
        {
            ModalPopupExtender3.Hide();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                foreach (GridViewRow row in gvProducts.Rows)
                {
                    var chk = row.FindControl("SelectRowP") as CheckBox;
                    var productnumber = this.Panel3.FindControl("NewProductNumber") as TextBox;
                    var productdescription = this.Panel3.FindControl("NewProductDescription") as TextBox;
                    var unittype = this.Panel3.FindControl("NewUnitType") as DropDownList;
                    var rop = this.Panel3.FindControl("NewROP") as TextBox;
                    var modulea = this.Panel3.FindControl("NewModuleA") as DropDownList;
                    var quantitya = this.Panel3.FindControl("NewQuantityA") as TextBox;
                    var moduleb = this.Panel3.FindControl("NewModuleB") as DropDownList;
                    var quantityb = this.Panel3.FindControl("NewQuantityB") as TextBox;
                    var producttype = this.Panel3.FindControl("NewProductType") as DropDownList;
                    if (chk.Checked)
                    {
                        var lblID = row.FindControl("IdDisplayP") as Label;
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = "UPDATE Products SET ProductNumber = @ProductNumber, ProductDescription = @ProductDescription, UnitType = @UnitType, ROP = @ROP, ModuleA = @ModuleA, QuantityA = @QuantityA, ModuleB = @ModuleB, QuantityB = @QuantityB, ProductType = @ProductType WHERE Id=@id";
                        cmd.Connection = sqlCon;
                        cmd.Parameters.AddWithValue("@ProductNumber", productnumber.Text);
                        cmd.Parameters.AddWithValue("@ProductDescription", productdescription.Text);
                        cmd.Parameters.AddWithValue("@UnitType", unittype.Text);
                        cmd.Parameters.AddWithValue("@ROP", rop.Text);
                        cmd.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                        cmd.Parameters.AddWithValue("@ModuleA", modulea.Text);
                        cmd.Parameters.AddWithValue("@QuantityA", quantitya.Text);
                        cmd.Parameters.AddWithValue("@ModuleB", moduleb.Text);
                        cmd.Parameters.AddWithValue("@QuantityB", quantityb.Text);
                        cmd.Parameters.AddWithValue("@ProductType", producttype.Text);
                        sqlCon.Open();
                        cmd.ExecuteNonQuery();
                        SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Products", sqlCon);
                        DataTable dtbl = new DataTable();
                        sqlDa.Fill(dtbl);
                        gvProducts.DataSource = dtbl;
                        gvProducts.DataBind();
                        sqlCon.Close();
                    }
                }
                if (NewProductType.SelectedValue == "1")
                {
                    NewModuleA.Visible = true;
                    NewQuantityA.Visible = true;
                    NewModuleB.Visible = true;
                    NewQuantityB.Visible = true;
                    NANewROP.Visible = true;
                    NewROP.Visible = false;
                }
                else
                {
                    NewModuleA.Visible = false;
                    NewQuantityA.Visible = false;
                    NewModuleB.Visible = false;
                    NewQuantityB.Visible = false;
                    NANewROP.Visible = false;
                    NewROP.Visible = true;
                }
            }
        }

        protected void EditProduct_Click(object sender, EventArgs e)
        {
            ModalPopupExtender3.Show();
            UpdateProduct.Visible = true;
            NewProductNumber.Enabled = true;
            NewProductDescription.Enabled = true;
            NewUnitType.Enabled = true;
            NewROP.Enabled = true;
            NewProductType.Enabled = true;

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                foreach (GridViewRow row in gvProducts.Rows)
                {
                    var chk = row.FindControl("SelectRowP") as CheckBox;
                    if (chk.Checked)
                    {
                        var lblID = row.FindControl("IdDisplayP") as Label;
                        var productnumber = row.FindControl("ProductNumberlbl") as Label;
                        var productdescription = row.FindControl("ProductDescriptionlbl") as Label;
                        var unittype = row.FindControl("UnitTypelbl") as Label;
                        var rop = row.FindControl("ROPDisplay") as Label;
                        var modulea = this.Panel3.FindControl("NewModuleA") as DropDownList;
                        var quantitya = this.Panel3.FindControl("NewQuantityA") as TextBox;
                        var moduleb = this.Panel3.FindControl("NewModuleB") as DropDownList;
                        var quantityb = this.Panel3.FindControl("NewQuantityB") as TextBox;
                        var producttype = this.Panel3.FindControl("NewProductType") as DropDownList;
                        SqlCommand comm = new SqlCommand();
                        comm.CommandText = "SELECT * FROM Products WHERE Id=@id";
                        comm.Connection = sqlCon;
                        comm.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                        NewProductNumber.Text = productnumber.Text;
                        NewProductDescription.Text = productdescription.Text;
                        NewModuleA.Text = modulea.Text;
                        NewQuantityA.Text = quantitya.Text;
                        NewModuleB.Text = moduleb.Text;
                        NewQuantityB.Text = quantityb.Text;
                        if (unittype == null)
                        {
                            NewUnitType.Text = "";
                        }
                        else
                        {
                            NewUnitType.Text = unittype.Text;
                        }
                        if (producttype == null)
                        {
                            NewProductType.Text = "";
                        }
                        else
                        {
                            NewProductType.Text = producttype.Text;
                        }
                        NewROP.Text = rop.Text;
                        sqlCon.Open();
                        comm.ExecuteNonQuery();
                        sqlCon.Close();
                    }
                }
            }
        }

        protected void DeleteProduct_Click(object sender, EventArgs e)
        {
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                foreach (GridViewRow row in gvProducts.Rows)
                {
                    var chk = row.FindControl("SelectRowP") as CheckBox;
                    if (chk.Checked)
                    {
                        var lblID = row.FindControl("IdDisplayP") as Label;
                        SqlCommand comm = new SqlCommand();
                        comm.CommandText = "DELETE FROM Products WHERE Id=@id";
                        comm.Connection = sqlCon;
                        comm.Parameters.AddWithValue("@id", int.Parse(lblID.Text));
                        sqlCon.Open();
                        comm.ExecuteNonQuery();
                        SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Products", sqlCon);
                        DataTable dtbl = new DataTable();
                        sqlDa.Fill(dtbl);
                        gvProducts.DataSource = dtbl;
                        gvProducts.DataBind();
                        sqlCon.Close();
                    }
                }
            }
        }

        
    }
}