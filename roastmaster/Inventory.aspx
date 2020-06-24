<%@ Page Title="Inventory" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="roastmaster.WebForm1" %>
<asp:Content ID="ContentInv" ContentPlaceHolderID="MainContent" runat="server">

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

        <h1>Inventory</h1>
        <p style="text-align: center;">
            <asp:Button ID="Button1Inv" runat="server" Text="Inventory" style="float:left;" BackColor="Silver" OnClick="Button1Inv_Click"/>
            <asp:Button ID="Button2Inv" runat="server" Text="Locations" style="float: left" OnClick="Button2Inv_Click" BackColor="White"/>
            <asp:Button ID="Button3Inv" runat="server" Text="Add Products to Inventory" style="float: right;"/>
            <asp:Button ID="ButtonMoveInv" runat="server" Text="Move Inventory"/>
            <Button type="button">
        <asp:Image ID="Image2Inv" runat="server" ImageUrl="~/Images/icons8-edit-16.png" /><br /></Button>
            <Button type="button">
        <asp:Image ID="Image1Inv" runat="server" ImageUrl="~/Images/icons8-trash-16.png" /><br /></Button>
            <asp:Button ID="Button6Inv" runat="server" Text="Create Purchase Order" />
            <asp:Button ID="ButtonNewLocation" runat="server" Text="New Location" Enabled="False" />
        </p>
    <asp:MultiView ID="MultiView1Inv" runat="server" ActiveViewIndex="0">
    <asp:View ID="View1Inv" runat="server">
        <table>
  <tr>
    <th>Product #</th>
    <th>Location</th>
    <th>Product Name</th>
    <th>Units</th>
  </tr>
  <tr>
    <td>&nbsp;<asp:CheckBox ID="CheckBox1Inv" runat="server" />
        &nbsp; GS-01</td>
    <td>A1</td>
    <td>100% Organic Colombian Coffee Beans - Green</td>
    <td>250.00</td>
  </tr>
  
</table>
        </asp:View>
        <asp:View ID="View2Inv" runat="server">

                    <table>
  <tr>
    <th>Location Name</th>
  </tr>
  <tr>
    <td>&nbsp;<asp:CheckBox ID="CheckBox2Inv" runat="server" />
        &nbsp; A1</td>
  </tr>
  
</table>

        </asp:View>
        </asp:MultiView>

    <!-- The Modal -->
<div id="myModalInv" class="modal">

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
var modal = document.getElementById("myModalInv");

// Get the button that opens the modal
var btn = document.getElementById("myBtnInv");

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
