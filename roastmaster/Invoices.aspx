<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Invoices.aspx.cs" Inherits="roastmaster.WebForm4" %>
<asp:Content ID="Content1Invoices" ContentPlaceHolderID="MainContent" runat="server">

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

        <h1>Invoices</h1>
        <p style="text-align: center;">
            <asp:Button ID="Button1Invoices" runat="server" Text="Invoices Receivable" style="float:left;" BackColor="Silver" OnClick="Button1Invoices_Click"/>
            <asp:Button ID="Button2Invoices" runat="server" Text="Invoices Payable" style="float:left;" BackColor="White" OnClick="Button2Invoices_Click"/>
            <asp:Button ID="Button3Invoices" runat="server" Text="New Invoice" style="float: right;"/>
            <Button type="button">
        <asp:Image ID="Image2Invoices" runat="server" ImageUrl="~/Images/icons8-edit-16.png" /><br /></Button>
            <Button type="button">
        <asp:Image ID="Image1Invoices" runat="server" ImageUrl="~/Images/icons8-trash-16.png" /><br /></Button>
            <asp:Button ID="Button6Invoices" runat="server" Text="Create Journal Entry" />
        </p>
    <asp:MultiView ID="MultiView1Invoices" runat="server" ActiveViewIndex="0">
    <asp:View ID="View1Invoices" runat="server">
        <table>
  <tr>
    <th>Invoice #</th>
    <th>Client Code</th>
    <th>Date</th>
    <th>Order Details</th>
  </tr>
  <tr>
    <td>&nbsp;<asp:CheckBox ID="CheckBox1Invoices" runat="server" />
        &nbsp; INV#0001</td>
    <td>AFMUS</td>
    <td>06/23/20</td>
    <td>&nbsp;<a style="float: right;" id="myBtnInvoices";><asp:Image ID="ExpandInvoices" runat="server" ImageUrl="~/Images/icons8-expand-arrow-16.png"/></a>
      </td>
    
  </tr>
  
</table>
        </asp:View>
        <asp:View ID="View2Invoices" runat="server">

                    <table>
  <tr>
    <th>Invoice #</th>
    <th>Client Code</th>
    <th>Date</th>
    <th>Order Details</th>
  </tr>
  <tr>
    <td>&nbsp;<asp:CheckBox ID="CheckBox2Invoices" runat="server" />
        &nbsp; INV#0001</td>
    <td>CAFE</td>
    <td>06/23/20</td>
    <td>&nbsp;<a style="float: right;" id="myBtnInvoices2";><asp:Image ID="Image4Invoices" runat="server" ImageUrl="~/Images/icons8-expand-arrow-16.png"/></a>
      </td>
    
  </tr>
  
</table>

        </asp:View>
        </asp:MultiView>

    <!-- The Modal -->
<div id="myModalInvoices" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <table>
  <tr>
    <th>Company Name</th>
    <th>Industry</th>
    <th>Contact Name</th>
    <th>Email</th>
    <th>Phone #</th>
    <th>State</th>
    <th># of Times Contacted</th>
    <th>Date of Last Contact</th>
  </tr>
  <tr>
    <td>American Financial</td>
    <td>Insurance</td>
    <td>Scott Wheeler</td>
    <td>scott.wheeler@afmus.com</td>
    <td>402-429-7380</td>
    <td>MN</td>
    <td>1</td>
    <td>02/24/20
      </td>
    
  </tr>
  
</table>
      <p></p>
      <textarea>Notes</textarea>
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById("myModalInvoices");

// Get the button that opens the modal
var btn = document.getElementById("myBtnInvoices");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

</asp:Content>
