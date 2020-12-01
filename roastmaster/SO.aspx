<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SO.aspx.cs" Inherits="roastmaster.SO" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content2SO" ContentPlaceHolderID="MainContent" runat="server">

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

        <h1>Sales Orders<asp:Label ID="Label1SO" runat="server" Text="1 Sales Order" style="float:right; font-size: small;"></asp:Label><asp:TextBox ID="TextBox2SO" runat="server" style="float:right; font-size: small;">Search</asp:TextBox><Button type="button" style="font-size: small; float: right;">
        <asp:Image ID="Image3SO" runat="server" ImageUrl="~/Images/icons8-filter-16.png" /><br /></Button></h1>
    <p style="text-align: center;">
            <asp:Button ID="Button3SO" runat="server" Text="New Sales Order" style="float: right;" OnClick="Button3SO_Click"/>
            <asp:Button ID="Button4SO" runat="server" Text="Edit" OnClick="EditSO_Click"/>
            <asp:Button ID="Button5SO" runat="server" Text="Delete" OnClick="DeleteSO_Click"/>
            <asp:Button ID="Button6SO" runat="server" Text="Create Picking Ticket" />
        </p>
    <table id="SOtable">
        <tr>
            <asp:GridView ID="gvSO" runat="server" AutoGenerateColumns="false" ShowFooter="false"> 
                <Columns>
                    <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="SelectRowSO" runat="server" Checked ="false" />
                </ItemTemplate>
            </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="IdDisplaySO" runat="server" Text='<%# Bind("Id") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
            <asp:TemplateField HeaderText="SO #" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditSONumber" runat="server" Text='<%# Bind("SONumber") %>'></asp:TextBox>  
                </EditItemTemplate>    
                <ItemTemplate>  
                    <asp:Label ID="SONumberlbl" runat="server" Text='<%# Bind("SONumber") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Company Name" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditCompanyNameSO" runat="server" Text='<%# Bind("CompanyName") %>'></asp:TextBox>  
                </EditItemTemplate>    
                <ItemTemplate>  
                    <asp:Label ID="CompanyNameSOlbl" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Custom Label" SortExpression="Name">    
                <ItemTemplate>  
                    <asp:Label ID="CustomLabellbl" runat="server" Text="upload"></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Card" SortExpression="Name">    
                <ItemTemplate>  
                    <asp:Label ID="Cardlbl" runat="server" Text="upload"></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label ID="DateDisplaySO" runat="server" Text='<%# Bind("Date") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label ID="AddressDisplaySO" runat="server" Text='<%# Bind("Address") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label ID="BillingAddressDisplaySO" runat="server" Text='<%# Bind("BillingAddress") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label ID="SalesRepDisplaySO" runat="server" Text='<%# Bind("SalesRep") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label ID="ClientCodeDisplaySO" runat="server" Text='<%# Bind("ClientCode") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label ID="TermsDisplaySO" runat="server" Text='<%# Bind("Terms") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label ID="PhoneNumberDisplaySO" runat="server" Text='<%# Bind("PhoneNumber") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField Visible="false">
                <ItemTemplate>
                    <asp:Label ID="EmailDisplaySO" runat="server" Text='<%# Bind("Email") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </tr>
    </table>

    <asp:LinkButton ID="lnkDummySO" runat="server"></asp:LinkButton>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender4" EnableViewState="true" TargetControlID="lnkDummySO" PopupControlID="Panel4" runat="server"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="Panel4" runat="server" CssClass="modal-content" Style="display: none">
    <asp:Button ID="modalclose4" runat="server" BackColor="Red" ForeColor="White" Text="x" style="float:right" OnClick="modalclose4_Click"/>
        <br />
        <table>
            <tr>
                <td>SO #</td>
                <td>Company Name</td>
                <td>Date</td>
                <td>Address</td>
                <td>Billing Address</td>
            </tr>
            <tr>
                <td><asp:TextBox ID="NewSONumber" Style="width: 150px;" runat="server" Text='<%# Bind("SONumber") %>'></asp:TextBox></td>
                <td><asp:TextBox ID="NewCompanyNameSO" Style="width: 150px;" runat="server" Text='<%# Bind("ContactName") %>'></asp:TextBox></td>
                <td><asp:TextBox ID="NewDateSO" Type="date" Style="width: 150px;" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox></td>
                <td><asp:TextBox ID="NewAddressSO" Style="width: 150px;" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox></td>
                <td><asp:TextBox ID="NewBillingAddressSO" Style="width: 150px;" runat="server" Text='<%# Bind("BillingAddress") %>'></asp:TextBox></td>
            </tr>
            <tr>
                <td>Sales Rep</td>
                <td>Client Code</td>
                <td>Terms</td>
                <td>Phone Number</td>
                <td>Email</td>
            </tr>
            <tr>
                <td><asp:DropDownList ID="NewSalesRepSO" runat="server" Text='<%# Bind("SalesRep") %>'>
                        <asp:listitem text="" value="0"></asp:listitem>
                        <asp:listitem text="Nate Wheeler" value="1"></asp:listitem>
                        </asp:DropDownList></td>
                 <td><asp:TextBox ID="NewClientCodeSO" runat="server" Style="width: 60px" Text='<%# Bind("ClientCode") %>'></asp:TextBox></td>
                 <td><asp:DropDownList ID="NewTermsSO" runat="server" Text='<%# Bind("Terms") %>'>
                        <asp:listitem text="" value="0"></asp:listitem>
                        <asp:listitem text="n/30" value="1"></asp:listitem>
                        </asp:DropDownList></td>
                <td><asp:TextBox ID="NewPhoneNumberSO" Style="width: 100px;" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:TextBox></td>
                <td><asp:TextBox ID="NewEmailSO" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox></td>
            </tr>
            <tr>
                <td>Product #</td>
                <td>Description</td>
            </tr>
            <tr>
                <td><asp:DropDownList ID="NewProductNumberSO" runat="server" Text='<%# Bind("ProductNumber") %>'>
                    <asp:listitem text="" value="0"></asp:listitem>
                    <asp:listitem text="GS-03" value="1"></asp:listitem>
            </asp:DropDownList></td>
            <td>
                <asp:Label ID="NewDescription" Text="N/A" runat="server"></asp:Label>
            </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="NewSOFinish" runat="server" Text="Create Sales Order" BackColor="#009933" ForeColor="White" OnClick="NewSOFinish_Click" Visible="false" />
        <asp:Button ID="UpdateSO" runat="server" Text="Save Changes" BackColor="#009933" ForeColor="White" Visible="false" OnClick="UpdateSO_Click"/>
    </asp:Panel>



</asp:Content>
