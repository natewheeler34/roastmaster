<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clients.aspx.cs" Inherits="roastmaster.WebForm1" %>
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
        <table>
  <tr>
    <th>Company Name</th>
    <th>Contact Name</th>
    <th>Email</th>
    <th>Phone #</th>
    <th>State</th>
    <th>Status</th>
  </tr>
  <tr>
    <td>&nbsp;<asp:CheckBox ID="CheckBox1client" runat="server" />
&nbsp; American Financial</td>
    <td>Scott Wheeler</td>
    <td>scott.wheeler@afmus.com</td>
    <td>402-429-7380</td>
    <td>MN</td>
    <td>no current orders
        <a style="float: right;" id="myBtnclient";>
            <asp:Image ID="Expand1client" runat="server" ImageUrl="~/Images/icons8-expand-arrow-16.png"/></a>
      </td>
    
  </tr>
  
</table>

    <!-- The Modal -->
<div id="myModalclient" class="modal">

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
    <th>Status</th>
  </tr>
  <tr>
    <td>American Financial</td>
    <td>Insurance</td>
    <td>Scott Wheeler</td>
    <td>scott.wheeler@afmus.com</td>
    <td>402-429-7380</td>
    <td>MN</td>
    <td>no current orders</td>
  </tr>
  <tr>
      <th>Address</th>
      <th>Billing Address</th>
      <th>Payment Method</th>
      <th>Client Code</th>
      <th>Terms</th>
      <th>Sales Rep</th>
  </tr>
  <tr>
      <td>400 US-169, St. Louis Park, MN 55426</td>
      <td>400 US-169, St. Louis Park, MN 55426</td>
      <td>Credit Card</td>
      <td>AFMUS</td>
      <td>n/30</td>
      <td>Nate Wheeler</td>
  </tr> 
  
</table>
      <p></p>
      <p><textarea>Notes</textarea>&nbsp; <asp:CheckBox ID="CheckBoxclient2" runat="server"/>&nbsp; <asp:Label ID="taxexemptstatus" runat="server" Text="Is tax exempt"></asp:Label>
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById("myModalclient");

// Get the button that opens the modal
var btn = document.getElementById("myBtnclient");

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
