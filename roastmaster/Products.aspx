<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="roastmaster.WebForm1" %>
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
            <asp:Button ID="Button3products" runat="server" Text="New Product" style="float: right;"/>
            <Button type="button">
        <asp:Image ID="Image2products" runat="server" ImageUrl="~/Images/icons8-edit-16.png" /><br /></Button>
            <Button type="button">
        <asp:Image ID="Image1products" runat="server" ImageUrl="~/Images/icons8-trash-16.png" /><br /></Button>
        </p>
        <table>
  <tr>
    <th>Product #</th>
    <th>Product Name</th>
    <th>Unit Type</th>
    <th>ROP</th>
    <th>Product Description</th>
  </tr>
  <tr>
    <td>&nbsp;<asp:CheckBox ID="CheckBox1products" runat="server" />
        &nbsp; GS-01</td>
    <td>100% Organic Colombian Coffee Beans - Green</td>
    <td>LBS</td>
    <td>100.00</td>
    <td>
        <a style="float: right;" id="myBtnproducts";>
            <asp:Image ID="Expand1products" runat="server" ImageUrl="~/Images/icons8-expand-arrow-16.png"/></a>
      </td>
    
  </tr>
  
</table>

    <!-- The Modal -->
<div id="myModalproducts" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <table>
  <tr>
    <th>Product #</th>
    <th>Product Name</th>
    <th>Unit Type</th>
    <th>ROP</th>
    <th>Product Description</th>
  </tr>
  <tr>
    <td>GS-01</td>
    <td>100% Organic Colombian Coffee Beans - Green</td>
    <td>LBS</td>
    <td>100.00</td>
    <td>Arabica</td>
  </tr>
</table>
  </div>

</div>

<script>
// Get the modal
var modal = document.getElementById("myModalproducts");

// Get the button that opens the modal
var btn = document.getElementById("myBtnproducts");

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
