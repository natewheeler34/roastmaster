<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="roastmaster.WebForm3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="ContentProducts" ContentPlaceHolderID="MainContent" runat="server">

    <style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

</style>

        <h1>Products<asp:Label ID="Label1products" runat="server" Text="1 Product" style="float:right; font-size: small;"></asp:Label><asp:TextBox ID="TextBox2products" runat="server" style="float:right; font-size: small;">Search</asp:TextBox><Button type="button" style="font-size: small; float: right;">
        <asp:Image ID="Image3products" runat="server" ImageUrl="~/Images/icons8-filter-16.png" /><br /></Button>
    </h1>
        <p style="text-align: center;">
            <asp:Button ID="Button3products" runat="server" Text="New Product" style="float: right;" OnClick="Button3products_Click"/>
            <asp:Button ID="EditProduct" runat="server" Text="Edit" OnClick="EditProduct_Click" />
            <asp:Button ID="DeleteProduct" runat="server" Text="Delete" OnClick="DeleteProduct_Click" />
        </p>
        <table id="producttable">
  <tr>
    <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="false" ShowFooter="false"> 

          <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="SelectRowP" runat="server" Checked ="false" />
                </ItemTemplate>
            </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="IdDisplayP" runat="server" Text='<%# Bind("Id") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Product #" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditProductNumber" runat="server" Text='<%# Bind("ProductNumber") %>'></asp:TextBox>  
                </EditItemTemplate>   
                  <ItemTemplate>  
                    <asp:Label ID="ProductNumberlbl" runat="server" Text='<%# Bind("ProductNumber") %>'></asp:Label>  
                </ItemTemplate> 
                  </asp:TemplateField>
              <asp:TemplateField HeaderText="Product Description" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditProductDescription" runat="server" Text='<%# Bind("ProductDescription") %>'></asp:TextBox>  
                </EditItemTemplate>      
                  <ItemTemplate>  
                    <asp:Label ID="ProductDescriptionlbl" runat="server" Text='<%# Bind("ProductDescription") %>'></asp:Label>  
                </ItemTemplate> 
            </asp:TemplateField>   
              <asp:TemplateField HeaderText="Unit Type" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditUnitType" runat="server" Text='<%# Bind("UnitType") %>'></asp:TextBox>  
                </EditItemTemplate>  
                <ItemTemplate>  
                    <asp:Label ID="UnitTypelbl" runat="server" Text='<%# Bind("UnitType") %>'></asp:Label>
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="ROP" SortExpression="Name">
                  <EditItemTemplate>  
                    <asp:TextBox ID="EditROP" runat="server" Text='<%# Bind("ROP") %>'></asp:TextBox>  
                </EditItemTemplate> 
                  <ItemTemplate>
                      <asp:Label ID="ROPDisplay" runat="server" Text='<%# Bind("ROP") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label ID="FinishedGoodDisplay" runat="server" Text="Finished Good"/>
                </ItemTemplate>
            </asp:TemplateField>
              <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label ID="ModuleADisplay" runat="server" Text='<%# Bind("ModuleA") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label ID="QuantityADisplay" runat="server" Text='<%# Bind("QuantityA") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label ID="ModuleBDisplay" runat="server" Text='<%# Bind("ModuleB") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label ID="QuantityBDisplay" runat="server" Text='<%# Bind("QuantityB") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
          </Columns>
          
      </asp:GridView>
    
  </tr>
  
</table>

    <asp:LinkButton ID="lnkDummyP" runat="server"></asp:LinkButton>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender3" EnableViewState="true" TargetControlID="lnkDummyP" PopupControlID="Panel3" runat="server"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="Panel3" runat="server" CssClass="modal-content" Style="display: none">
    <asp:Button ID="modalclose3" runat="server" BackColor="Red" ForeColor="White" Text="x" style="float:right" OnClick="modalclose3_Click" />
    <br />
        <table>
            <tr>
                <td>Product #</td>
                <td>Product Description</td>
                <td>Unit Type</td>
                <td>ROP</td>
                <td>Product Type</td>
            </tr>
            <tr>
                <td><asp:TextBox ID="NewProductNumber" Style="width: 60px;" runat="server" Text='<%# Bind("ProductNumber") %>'></asp:TextBox></td>
                <td><asp:TextBox ID="NewProductDescription" Style="width: 300px;" runat="server" Text='<%# Bind("ProductDescription") %>'></asp:TextBox></td>
                <td><asp:DropDownList ID="NewUnitType" runat="server" Text='<%# Bind("UnitType") %>'>
                    <asp:listitem text="" value="0"></asp:listitem>
                    <asp:listitem text="LBS" value="1"></asp:listitem>
                    <asp:listitem Text="Units" Value="2"></asp:listitem>
                </asp:DropDownList>
                </td>
                <td><asp:TextBox ID="NewROP" Style="width: 60px;" runat="server" Text='<%# Bind("ROP") %>'></asp:TextBox><asp:Label ID="NANewROP" Text="N/A" runat="server"></asp:Label></td>
                <td><asp:DropDownList ID="NewProductType" runat="server" Text='<%# Bind("ProductType") %>'>
                    <asp:listitem text="Module" value="0"></asp:listitem>
                    <asp:listitem text="Finished Good" value="1"></asp:listitem>
                </asp:DropDownList>
                </td>
            </tr>
            </table>
            <br />
        <asp:DropDownList ID="NewModuleA" runat="server" Text='<%# Bind("ModuleA") %>'>
                    <asp:listitem text="Module A" value="0"></asp:listitem>
                    <asp:listitem text="GS-01" value="1"></asp:listitem>
                    <asp:listitem Text="GS-02" Value="2"></asp:listitem>
            </asp:DropDownList>
        
            <asp:TextBox ID="NewQuantityA" Type="number" min="0" runat="server" Style="width: 60px" Text='<%# Bind("QuantityA") %>'></asp:TextBox>
            <asp:DropDownList ID="NewModuleB" runat="server" Text='<%# Bind("ModuleB") %>'>
                    <asp:listitem text="Module B" value="0"></asp:listitem>
                    <asp:listitem text="GS-01" value="1"></asp:listitem>
                    <asp:listitem Text="GS-02" Value="2"></asp:listitem>
            </asp:DropDownList>
            <asp:TextBox ID="NewQuantityB" Type="number" min="0" runat="server" Style="width: 60px" Text='<%# Bind("QuantityB") %>'></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="NewProductFinish" runat="server" Text="Add Product" BackColor="#009933" ForeColor="White" OnClick="NewProduct_Click" Visible="false" />
        <asp:Button ID="UpdateProduct" runat="server" Text="Save Changes" BackColor="#009933" ForeColor="White" Visible="false" OnClick="UpdateProduct_Click"/>
        </asp:Panel>

</asp:Content>
