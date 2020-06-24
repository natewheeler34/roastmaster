<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SO.aspx.cs" Inherits="roastmaster.WebForm1" %>
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
            <asp:Button ID="Button3SO" runat="server" Text="New Sales Order" style="float: right;"/>
            <Button type="button">
        <asp:Image ID="Image2SO" runat="server" ImageUrl="~/Images/icons8-edit-16.png" /><br /></Button>
            <Button type="button">
        <asp:Image ID="Image1SO" runat="server" ImageUrl="~/Images/icons8-trash-16.png" /><br /></Button>
            <asp:Button ID="Button6SO" runat="server" Text="Create Picking Ticket" />
        </p>
        <table>
  <tr>
    <th>SO#</th>
    <th>Client Code</th>
    <th>Custom Label</th>
    <th>Card</th>
  </tr>
  <tr>
    <td>&nbsp;<asp:CheckBox ID="CheckBox1SO" runat="server" />
&nbsp; SO#0001</td>
    <td>AFMUS</td>
    <td style="text-align: center;">upload</td>
    <td style="text-align: center;">upload
        <a style="float: right;" id="myBtnSO";>
            <asp:Image ID="Expand1SO" runat="server" ImageUrl="~/Images/icons8-expand-arrow-16.png"/></a>
      </td>
    
  </tr>
  
</table>

    <!-- The Modal -->
<div id="myModalSO" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <table>
  <tr>
    <th>SO#</th>
    <th>Date</th>
    <th>Client Code</th>
    <th>Company Name</th>
    <th>Address</th>
    <th>Billing Address</th>
    <th>Sales Rep</th>
    <th>Terms</th>
  </tr>
  <tr>
    <td>SO#0001</td>
    <td>06.17.20</td>
    <td>AFMUS</td>
    <td>American Financial</td>
    <td>400 US-169, St. Louis Park, MN 55426</td>
    <td>400 US-169, St. Louis Park, MN 55426</td>
    <td>Nate Wheeler</td>
    <td>n/30</td>
  </tr>
  <tr>
      <th>Item #</th>
      <th>Description</th>
      <th>Quantity</th>
      <th>Price</th>
      <th>Amount</th>
  </tr>
  <tr>
      <td>GS-01</td>
      <td>100% Organic Colombian Coffee - GROUND - 1 LBS</td>
      <td>250</td>
      <td>20.00</td>
      <td>5,000.00</td>
  </tr> 
  
</table>
      <p></p>
      <p>Subtotal: 5,000.00</p>
      <p>Discount: (500.00)</p>
      <p>Tax: 270.000</p>
      <p>Shipping: 110.00</p>
      <p>Total: 4,880.00</p>
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById("myModalSO");

// Get the button that opens the modal
var btn = document.getElementById("myBtnSO");

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
