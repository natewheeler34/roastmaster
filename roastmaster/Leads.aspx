<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Leads.aspx.cs" Inherits="roastmaster.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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

.expandarrow{
    float: right;
}


</style>

        <h1>Leads<asp:Label ID="Label1" runat="server" style="float:right; font-size: small;"></asp:Label><asp:TextBox ID="TextBox1" runat="server" style="float:right; font-size: small;">Search</asp:TextBox><Button type="button" style="font-size: small; float: right;">
        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/icons8-filter-16.png" /><br /></Button>
    </h1>
        <p style="text-align: center;">
            <asp:Button ID="Button1" runat="server" Text="Active Leads" style="float:left;" BackColor="Silver" OnClick="Button1_Click"/>
            <asp:Button ID="Button2" runat="server" Text="Inactive Leads" style="float: left" OnClick="Button2_Click" BackColor="White"/>
            <asp:Button ID="Button3" runat="server" Text="New Lead" style="float: right;" OnClick="Button3_Click"/>
            <asp:Button ID="Button4" runat="server" Text="Mark As Inactive" OnClick="Button4_Click"/>
            <asp:Button ID="Button5" runat="server" Text="Mark As Hot" OnClick="Button5_Click"/>
            <asp:Button ID="edit" runat="server" Text="Edit" OnClick="edit_Click"/>
            <asp:Button ID="trash" runat="server" Text="Delete" OnClick="DeleteButton_Click"/>
            <asp:Button ID="Button6" runat="server" Text="Create Client" OnClick="Button6_Click"/>
        </p>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
    <asp:View ID="View1" runat="server">
        <table id="leadtable">
  <tr>
      <asp:GridView ID="gvLeads" runat="server" AutoGenerateColumns="false" ShowFooter="false" OnSelectedIndexChanged = "OnSelectedIndexChanged"> 

          <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="SelectRow" runat="server" Checked ="false" />
                </ItemTemplate>
            </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="IdDisplay" runat="server" Text='<%# Bind("Id") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Company Name" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditCompanyName" runat="server" Text='<%# Bind("CompanyName") %>'></asp:TextBox>  
                </EditItemTemplate>   
                <ItemTemplate>  
                    <asp:Image ID="hot" runat="server" ImageUrl="~/Images/icons8-fire-16.png" Visible="False" />&nbsp;&nbsp;<asp:Label ID="CompanyNameLbl" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="Contact Name" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditContactName" runat="server" Text='<%# Bind("ContactName") %>'></asp:TextBox>  
                </EditItemTemplate>    
                <ItemTemplate>  
                    <asp:Label ID="ContactNamelbl" runat="server" Text='<%# Bind("ContactName") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="Email" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>  
                </EditItemTemplate>  
                <ItemTemplate>  
                    <asp:Label ID="Emaillbl" runat="server" Text='<%# Bind("Email") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="Phone #" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditPhoneNumber" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>  
                </EditItemTemplate>    
                <ItemTemplate>  
                    <asp:Label ID="PhoneNumberlbl" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="State" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditState" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>  
                </EditItemTemplate>  
                <ItemTemplate>  
                    <asp:Label ID="Statelbl" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="# of Times Contacted" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditNumberOfTimesContacted" runat="server" Text='<%# Bind("NumberOfTimesContacted") %>'></asp:TextBox>  
                </EditItemTemplate>  
                <ItemTemplate>  
                    <asp:Label ID="NumberOfTimesContactedlbl" runat="server" Text='<%# Bind("NumberOfTimesContacted") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="Date of Last Contact" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditDateOfLastContact" runat="server" Text='<%# Bind("DateOfLastContact") %>'></asp:TextBox>  
                </EditItemTemplate>  
                <ItemTemplate>  
                    <asp:Label ID="DateOfLastContactlbl" runat="server" Text='<%# Bind("DateOfLastContact") %>'></asp:Label>
                </ItemTemplate>  
            </asp:TemplateField>
              <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                  <ItemTemplate>
                      <asp:ImageButton ID="Expand1" runat="server" CssClass="expandarrow" ImageUrl="~/Images/icons8-expand-arrow-16.png" CommandName="Select" />
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="IndustryDisplay" runat="server" Text='<%# Bind("Industry") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="RevenueRangeDisplay" runat="server" Text='<%# Bind("RevenueRange") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="NotesDisplay" runat="server" Text='<%# Bind("Notes") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
          
      </asp:GridView>
      


  </tr>
  
</table>
        </asp:View>
        <asp:View ID="View2" runat="server">

                    <table id="inactiveleadtable">
  <tr>
      <asp:GridView ID="gvInactiveLeads" runat="server" AutoGenerateColumns="false" ShowFooter="false" OnSelectedIndexChanged = "OnSelectedIndexChanged"> 

          <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:CheckBox ID="SelectRow2" runat="server" Checked ="false" />
                </ItemTemplate>
            </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="IdDisplay2" runat="server" Text='<%# Bind("Id") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="Company Name" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditCompanyName2" runat="server" Text='<%# Bind("CompanyName") %>'></asp:TextBox>  
                </EditItemTemplate>   
                <ItemTemplate>  
                    <asp:Image ID="hot2" runat="server" ImageUrl="~/Images/icons8-fire-16.png" Visible="False" />&nbsp;&nbsp;<asp:Label ID="CompanyNameLbl2" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="Contact Name" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditContactName2" runat="server" Text='<%# Bind("ContactName") %>'></asp:TextBox>  
                </EditItemTemplate>    
                <ItemTemplate>  
                    <asp:Label ID="ContactNamelbl2" runat="server" Text='<%# Bind("ContactName") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="Email" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditEmail2" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>  
                </EditItemTemplate>  
                <ItemTemplate>  
                    <asp:Label ID="Emaillbl2" runat="server" Text='<%# Bind("Email") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="Phone #" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditPhoneNumber2" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:TextBox>  
                </EditItemTemplate>    
                <ItemTemplate>  
                    <asp:Label ID="PhoneNumberlbl2" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="State" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditState2" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>  
                </EditItemTemplate>  
                <ItemTemplate>  
                    <asp:Label ID="Statelbl2" runat="server" Text='<%# Bind("State") %>'></asp:Label>
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="# of Times Contacted" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditNumberOfTimesContacted2" runat="server" Text='<%# Bind("NumberOfTimesContacted") %>'></asp:TextBox>  
                </EditItemTemplate>  
                <ItemTemplate>  
                    <asp:Label ID="NumberOfTimesContactedlbl2" runat="server" Text='<%# Bind("NumberOfTimesContacted") %>'></asp:Label>  
                </ItemTemplate>  
            </asp:TemplateField>  
              <asp:TemplateField HeaderText="Date of Last Contact" SortExpression="Name">  
                <EditItemTemplate>  
                    <asp:TextBox ID="EditDateOfLastContact2" runat="server" Text='<%# Bind("DateOfLastContact") %>'></asp:TextBox>  
                </EditItemTemplate>  
                <ItemTemplate>  
                    <asp:Label ID="DateOfLastContactlbl2" runat="server" Text='<%# Bind("DateOfLastContact") %>'></asp:Label>
                </ItemTemplate>  
            </asp:TemplateField>
              <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                  <ItemTemplate>
                      <asp:ImageButton ID="Expand12" runat="server" CssClass="expandarrow" ImageUrl="~/Images/icons8-expand-arrow-16.png" CommandName="Select" />
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="IndustryDisplay2" runat="server" Text='<%# Bind("Industry") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="RevenueRangeDisplay2" runat="server" Text='<%# Bind("RevenueRange") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField  Visible="false">
                  <ItemTemplate>
                      <asp:Label ID="NotesDisplay2" runat="server" Text='<%# Bind("Notes") %>'/>
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
          
      </asp:GridView>
      


  </tr>
  
</table>
  

        </asp:View>
        </asp:MultiView>

    <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" EnableViewState="true" TargetControlID="lnkDummy" PopupControlID="Panel1" runat="server"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" CssClass="modal-content" Style="display: none">
    <asp:Button ID="modalclose" runat="server" BackColor="Red" ForeColor="White" Text="x" style="float:right" OnClick="modalclose_Click"/>
        <br />
        <table>
            <tr>
                <td>Company Name</td>
                <td>Industry</td>
                <td>Contact Name</td>
                <td>Email</td>
                <td>Phone #</td>
            </tr>
            <tr>
                <td><asp:TextBox ID="NewCompanyName" Style="width: 150px;" runat="server" Text='<%# Bind("CompanyName") %>'></asp:TextBox></td>
                <td><asp:DropDownList ID="NewIndustry" runat="server" Text='<%# Bind("Industry") %>'>
                    <asp:listitem text="" value="0"></asp:listitem>
                    <asp:listitem text="Insurance" value="1"></asp:listitem>
                    <asp:listitem text="Healthcare" value="2"></asp:listitem>
                     </asp:DropDownList></td>
                <td><asp:TextBox ID="NewContactName" Style="width: 125px;" runat="server" Text='<%# Bind("ContactName") %>'></asp:TextBox></td>
                <td><asp:TextBox ID="NewEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox></td>
                <td><asp:TextBox ID="NewPhoneNumber" Style="width: 100px;" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:TextBox></td>
            </tr>
            <tr>
                
                <td>State</td>
                <td># of Times Contacted</td>
                <td>Date of Last Contact</td>
                <td>Revenue Range</td>
            </tr>
            <tr>
                <td><asp:DropDownList ID="NewState" runat="server" Text='<%# Bind("State") %>'>
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
                    <td><asp:TextBox ID="NewNumberOfTimesContacted" Type="number" min="0" runat="server" Style="width: 60px" Text='<%# Bind("NumberOfTimesContacted") %>'></asp:TextBox></td>
                    <td><asp:TextBox ID="NewDateOfLastContact" Type="date" runat="server" Text='<%# Bind("DateOfLastContact") %>'></asp:TextBox></td>
                    <td><asp:DropDownList ID="RevenueRange" runat="server" Text='<%# Bind("RevenueRange") %>'>
                        <asp:listitem text="" value="0"></asp:listitem>
                        <asp:listitem text="0 - 24,999" value="1"></asp:listitem>
                        <asp:listitem text="25,000 - 99,999" value="2"></asp:listitem>
                        <asp:listitem text="100,000 - 499,999" value="3"></asp:listitem>
                        <asp:listitem text="500,000 - 999,999" value="4"></asp:listitem>
                        <asp:listitem text="1,000,000 - 9,999,999" value="5"></asp:listitem>
                        <asp:listitem text="10,000,000 - 99,999,999" value="6"></asp:listitem>
                        <asp:listitem text="100,000,000+" value="7"></asp:listitem>
                        </asp:DropDownList></td>
            </tr>
        </table>
        <br />
        <asp:TextBox ID="Notes" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="NewLeadFinish" runat="server" Text="Add Lead" BackColor="#009933" ForeColor="White" OnClick="NewLeadFinish_Click" Visible="false" />
        <asp:Button ID="UpdateLead" runat="server" Text="Save Changes" BackColor="#009933" ForeColor="White" Visible="false" OnClick="UpdateLead_Click"/>
    </asp:Panel>

</asp:Content>
