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
            <asp:Button ID="Button3client" runat="server" Text="New Client" style="float: right;" OnClick="Button3client_Click"/>
            <asp:Button ID="EditClient" runat="server" Text="Edit" OnClick="EditClient_Click" />
            <asp:Button ID="DeleteClient" runat="server" Text="Delete" OnClick="DeleteClient_Click" />
            <asp:Button ID="Button6Client" runat="server" Text="Create Sales Order" OnClick="Button6Client_Click" />
        </p>
       <table id="clienttable">
  <tr>
      <asp:GridView ID="gvClients" runat="server" AutoGenerateColumns="false" ShowFooter="false" OnSelectedIndexChanged="ExpandArrowClient_Click"> 

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
              <asp:TemplateField HeaderText="Status" SortExpression="Name">    
                <ItemTemplate>  
                    <asp:Label ID="Statuslbl" runat="server" Text="no current orders"></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                  <ItemTemplate>
                      <asp:ImageButton ID="Expand1C" runat="server" CssClass="expandarrow" ImageUrl="~/Images/icons8-expand-arrow-16.png" OnClick="ExpandArrowClient_Click" />
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
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="AddressDisplay" runat="server" Text='<%# Bind("Address") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="BillingAddressDisplay" runat="server" Text='<%# Bind("BillingAddress") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="PaymentMethodDisplay" runat="server" Text='<%# Bind("PaymentMethod") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="ClientCodeDisplay" runat="server" Text='<%# Bind("ClientCode") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="TermsDisplay" runat="server" Text='<%# Bind("Terms") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="SalesRepDisplay" runat="server" Text='<%# Bind("SalesRep") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="CreditLimitDisplay" runat="server" Text='<%# Bind("CreditLimit") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField Visible="false">
                  <ItemTemplate>
                      <asp:CheckBox ID="TaxExempt" runat="server" />
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
          
      </asp:GridView>
      


  </tr>
  
</table>

    <asp:LinkButton ID="lnkDummyC" runat="server"></asp:LinkButton>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" EnableViewState="true" TargetControlID="lnkDummyC" PopupControlID="Panel2" runat="server"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="Panel2" runat="server" CssClass="modal-content" Style="display: none">
    <asp:Button ID="modalclose2" runat="server" BackColor="Red" ForeColor="White" Text="x" style="float:right" OnClick="modalclose2_Click"/>
        <br />
        <table>
            <tr>
                <td>Company Name</td>
                <td>Industry</td>
                <td>Revenue Range</td>
                <td>Contact Name</td>
                <td>Email</td>
                <td>Phone Number</td>
            </tr>
            <tr>
                <td><asp:TextBox ID="NewCompanyNameC" Style="width: 150px;" runat="server" Text='<%# Bind("CompanyName") %>'></asp:TextBox></td>
                <td><asp:DropDownList ID="NewIndustryC" runat="server" Text='<%# Bind("Industry") %>'>
                    <asp:listitem text="" value="0"></asp:listitem>
                    <asp:listitem text="Insurance" value="1"></asp:listitem>
                    <asp:listitem text="Healthcare" value="2"></asp:listitem>
                     </asp:DropDownList></td>
                <td><asp:DropDownList ID="NewRevenueRangeC" runat="server" Text='<%# Bind("RevenueRange") %>'>
                    <asp:listitem text="" value="0"></asp:listitem>
                        <asp:listitem text="0 - 24,999" value="1"></asp:listitem>
                        <asp:listitem text="25,000 - 99,999" value="2"></asp:listitem>
                        <asp:listitem text="100,000 - 499,999" value="3"></asp:listitem>
                        <asp:listitem text="500,000 - 999,999" value="4"></asp:listitem>
                        <asp:listitem text="1,000,000 - 9,999,999" value="5"></asp:listitem>
                        <asp:listitem text="10,000,000 - 99,999,999" value="6"></asp:listitem>
                        <asp:listitem text="100,000,000+" value="7"></asp:listitem>
                    </asp:DropDownList></td>
                <td><asp:TextBox ID="NewContactNameC" Style="width: 125px;" runat="server" Text='<%# Bind("ContactName") %>'></asp:TextBox></td>
                <td><asp:TextBox ID="NewEmailC" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox></td>
                <td><asp:TextBox ID="NewPhoneNumberC" Style="width: 100px;" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:TextBox></td>
             
            </tr>
            <tr>
                <td>State</td>
                <td>Address</td>
                <td>Billing Address</td>
                <td>Payment Method</td>
                <td>Client Code</td>
                <td>Terms</td>
            </tr>
            <tr>
                       <td><asp:DropDownList ID="NewStateC" runat="server" Text='<%# Bind("State") %>'>
                        <asp:listitem text="" value="0"></asp:listitem>
                        <asp:listitem text="AL" value="1"></asp:listitem>
                        <asp:listitem text="AK" value="2"></asp:listitem>
                        <asp:listitem text="AZ" value="3"></asp:listitem>
                        <asp:listitem text="AR" value="4"></asp:listitem>
                        <asp:listitem text="CA" value="5"></asp:listitem>
                        <asp:listitem text="CO" value="6"></asp:listitem>
                        <asp:listitem text="CT" value="7"></asp:listitem>
                        <asp:listitem text="DE" value="8"></asp:listitem>
                        <asp:listitem text="FL" value="9"></asp:listitem>
                        <asp:listitem text="GA" value="10"></asp:listitem>
                        <asp:listitem text="HI" value="11"></asp:listitem>
                        <asp:listitem text="ID" value="12"></asp:listitem>
                        <asp:listitem text="IL" value="13"></asp:listitem>
                        <asp:listitem text="IN" value="14"></asp:listitem>
                        <asp:listitem text="IA" value="15"></asp:listitem>
                        <asp:listitem text="KS" value="16"></asp:listitem>
                        <asp:listitem text="KY" value="17"></asp:listitem>
                        <asp:listitem text="LA" value="18"></asp:listitem>
                        <asp:listitem text="ME" value="19"></asp:listitem>
                        <asp:listitem text="MD" value="20"></asp:listitem>
                        <asp:listitem text="MA" value="21"></asp:listitem>
                        <asp:listitem text="MI" value="22"></asp:listitem>
                        <asp:listitem text="MN" value="23"></asp:listitem>
                        <asp:listitem text="MS" value="24"></asp:listitem>
                        <asp:listitem text="MO" value="25"></asp:listitem>
                        <asp:listitem text="MT" value="26"></asp:listitem>
                        <asp:listitem text="NE" value="27"></asp:listitem>
                        <asp:listitem text="NV" value="28"></asp:listitem>
                        <asp:listitem text="NH" value="29"></asp:listitem>
                        <asp:listitem text="NJ" value="30"></asp:listitem>
                        <asp:listitem text="NM" value="31"></asp:listitem>
                        <asp:listitem text="NY" value="32"></asp:listitem>
                        <asp:listitem text="NC" value="33"></asp:listitem>
                        <asp:listitem text="ND" value="34"></asp:listitem>
                        <asp:listitem text="OH" value="35"></asp:listitem>
                        <asp:listitem text="OK" value="36"></asp:listitem>
                        <asp:listitem text="OR" value="37"></asp:listitem>
                        <asp:listitem text="PA" value="38"></asp:listitem>
                        <asp:listitem text="RI" value="39"></asp:listitem>
                        <asp:listitem text="SC" value="40"></asp:listitem>
                        <asp:listitem text="SD" value="41"></asp:listitem>
                        <asp:listitem text="TN" value="42"></asp:listitem>
                        <asp:listitem text="TX" value="43"></asp:listitem>
                        <asp:listitem text="UT" value="44"></asp:listitem>
                        <asp:listitem text="VT" value="45"></asp:listitem>
                        <asp:listitem text="VA" value="46"></asp:listitem>
                        <asp:listitem text="WA" value="47"></asp:listitem>
                        <asp:listitem text="WV" value="48"></asp:listitem>
                        <asp:listitem text="WI" value="49"></asp:listitem>
                        <asp:listitem text="WY" value="50"></asp:listitem>

                    </asp:DropDownList></td>
                    <td><asp:TextBox ID="NewAddress" runat="server" Style="width: 150px" Text='<%# Bind("Address") %>'></asp:TextBox></td>
                    <td><asp:TextBox ID="NewBillingAddress" runat="server" Text='<%# Bind("BillingAddress") %>'></asp:TextBox></td>
                    <td><asp:DropDownList ID="NewPaymentMethod" runat="server" Text='<%# Bind("PaymentMethod") %>'>
                        <asp:listitem text="" value="0"></asp:listitem>
                        <asp:listitem text="Credit Card" value="1"></asp:listitem>
                        <asp:listitem text="Check" value="2"></asp:listitem>
                        <asp:ListItem Text="Wire Transfer" value="3"></asp:ListItem>
                        </asp:DropDownList></td>
                    <td><asp:TextBox ID="NewClientCode" runat="server" Style="width: 60px" Text='<%# Bind("ClientCode") %>'></asp:TextBox></td>
                    <td><asp:DropDownList ID="NewTerms" runat="server" Text='<%# Bind("Terms") %>'>
                        <asp:listitem text="" value="0"></asp:listitem>
                        <asp:listitem text="n/30" value="1"></asp:listitem>
                        </asp:DropDownList></td>
            </tr>
            <tr>
                <td>Sales Rep</td>
                <td>Notes</td>
                <td>Credit Limit</td>
                <td>Tax Exempt</td>
            </tr>
            <tr>
                <td><asp:DropDownList ID="NewSalesRep" runat="server" Text='<%# Bind("SalesRep") %>'>
                        <asp:listitem text="" value="0"></asp:listitem>
                        <asp:listitem text="Nate Wheeler" value="1"></asp:listitem>
                        </asp:DropDownList></td>
                <td>
                     <asp:TextBox ID="NotesC" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="NewCreditLimit" runat="server" Text='<%# Bind("CreditLimit") %>'></asp:TextBox>
                </td>
                <td>
                    <asp:CheckBox ID="NewTaxExempt" runat="server" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="NewClientFinish" runat="server" Text="Add Client" BackColor="#009933" ForeColor="White" OnClick="NewClientFinish_Click" Visible="false" />
        <asp:Button ID="UpdateClient" runat="server" Text="Save Changes" BackColor="#009933" ForeColor="White" Visible="false" OnClick="UpdateClient_Click"/>
    </asp:Panel>


   

</asp:Content>
