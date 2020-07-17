<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clients.aspx.cs" Inherits="roastmaster.WebForm2" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

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

        <h1>Clients<asp:Label ID="Label1client" runat="server" Text="1 Client" style="float:right; font-size: small;"></asp:Label><asp:TextBox ID="TextBox2client" runat="server" style="float:right; font-size: small;">Search</asp:TextBox><Button type="button" style="font-size: small; float: right;">
        <asp:Image ID="Image3client" runat="server" ImageUrl="~/Images/icons8-filter-16.png" /><br /></Button>
    </h1>
        <p style="text-align: center;">
            <asp:Button ID="Button3client" runat="server" Text="New Client" style="float: right;"/>
            <Button type="button">
        <asp:Image ID="Image2client" runat="server" ImageUrl="~/Images/icons8-edit-16.png" /><br /></Button>
            <Button type="button">
        <asp:Image ID="Image1client" runat="server" ImageUrl="~/Images/icons8-trash-16.png" /><br /></Button>
            <asp:Button ID="Button6client" runat="server" Text="Create Sales Order" />
        </p>
       <table id="leadtable">
  <tr>
      <asp:GridView ID="gvClients" runat="server" AutoGenerateColumns="false" ShowFooter="false"> 

          <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="SelectRowC" runat="server" Checked ="false" />
                </ItemTemplate>
            </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="IdDisplayC" runat="server" Text='<%# Bind("Id") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Company Name" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditCompanyNameC" runat="server" Text='<%# Bind("CompanyName") %>'></asp:TextBox>  
                </EditItemTemplate>   
                <ItemTemplate>  
                    <asp:Image ID="hotC" runat="server" ImageUrl="~/Images/icons8-fire-16.png" Visible="False" />&nbsp;&nbsp;<asp:Label ID="CompanyNameLblC" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="Contact Name" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditContactNameC" runat="server" Text='<%# Bind("ContactName") %>'></asp:TextBox>  
                </EditItemTemplate>    
                <ItemTemplate>  
                    <asp:Label ID="ContactNamelblC" runat="server" Text='<%# Bind("ContactName") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="Email" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditEmailC" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>  
                </EditItemTemplate>  
                <ItemTemplate>  
                    <asp:Label ID="EmaillblC" runat="server" Text='<%# Bind("Email") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="Phone #" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditPhoneNumberC" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>  
                </EditItemTemplate>    
                <ItemTemplate>  
                    <asp:Label ID="PhoneNumberlblC" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="State" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditStateC" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>  
                </EditItemTemplate>  
                <ItemTemplate>  
                    <asp:Label ID="StatelblC" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                  <ItemTemplate>
                      <asp:ImageButton ID="Expand1C" runat="server" CssClass="expandarrow" ImageUrl="~/Images/icons8-expand-arrow-16.png" CommandName="Select" />
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="IndustryDisplayC" runat="server" Text='<%# Bind("Industry") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="RevenueRangeDisplayC" runat="server" Text='<%# Bind("RevenueRange") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="NotesDisplayC" runat="server" Text='<%# Bind("Notes") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
          
      </asp:GridView>
      


  </tr>
  
</table>


   

</asp:Content>
