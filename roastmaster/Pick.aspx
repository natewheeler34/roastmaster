<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pick.aspx.cs" Inherits="roastmaster.WebForm4" %>
<asp:Content ID="Content1pick" ContentPlaceHolderID="MainContent" runat="server">

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

        <h1>Picking Tickets<asp:Label ID="Label1pick" runat="server" Text="1 Picking Ticket" style="float:right; font-size: small;"></asp:Label><asp:TextBox ID="TextBox1pick" runat="server" style="float:right; font-size: small;">Search</asp:TextBox><Button type="button" style="font-size: small; float: right;">
        <asp:Image ID="Image3pick" runat="server" ImageUrl="~/Images/icons8-filter-16.png" /><br /></Button>
    </h1>
        <p style="text-align: center;">
            <asp:Button ID="Button1pick" runat="server" Text="Picking Tickets" style="float:left;" BackColor="Silver" OnClick="Button1pick_Click"/>
            <asp:Button ID="Button2pick" runat="server" Text="Printing Queue" style="float:left;" BackColor="White" OnClick="Button2pick_Click"/>
            <a id="gearButton" style="float:right;"><asp:Image ID="gearpick" runat="server" ImageUrl="~/Images/icons8-settings-16.png"/></a>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3pick" runat="server" Text="New Picking Ticket" style="float: right;"/>
            <Button type="button">
        <asp:Image ID="Image2pick" runat="server" ImageUrl="~/Images/icons8-edit-16.png" /><br /></Button>
            <Button type="button">
        <asp:Image ID="Image1pick" runat="server" ImageUrl="~/Images/icons8-trash-16.png" /><br /></Button>
            <asp:Button ID="Button6pick" runat="server" Text="Create Batch" />
        </p>
    <asp:MultiView ID="MultiView1pick" runat="server" ActiveViewIndex="0">
    <asp:View ID="View1pick" runat="server">
        <table>
  <tr>
    <th>Picking Ticket #</th>
    <th>Client Code</th>
    <th>Quantity (LBS)</th>
    <th>Item</th>
    <th>Location</th>
  </tr>
  <tr>
    <td>&nbsp;<asp:CheckBox ID="CheckBox1pick" runat="server" />
&nbsp; PT#0001</td>
    <td>AFMUS</td>
    <td>33.00</td>
    <td>colombian</td>
    <td>A1
        <a style="float: right;" id="myBtnpick";>
            <asp:Image ID="Expand1pick" runat="server" ImageUrl="~/Images/icons8-expand-arrow-16.png"/></a>
      </td>
    
  </tr>
  
</table>
        </asp:View>
        <asp:View ID="View2pick" runat="server">

                    <table>
  <tr>
    <th>Picking Ticket #</th>
    <th>Client Code</th>
    <th>Quantity</th>
    <th>Custom Label</th>
    <th>Custom Card</th>
  </tr>
  <tr>
    <td>&nbsp;<asp:CheckBox ID="CheckBox2pick" runat="server" />
        &nbsp; PT#0001</td>
    <td>AFMUS</td>
    <td>30.00</td>
    <td>see attachment</td>
    <td>see attachment
        <a style="float: right;" id="myBtnpick2";>
            <asp:Image ID="Image4pick" runat="server" ImageUrl="~/Images/icons8-expand-arrow-16.png"/></a>
      </td>
    
  </tr>
  
</table>

        </asp:View>
        </asp:MultiView>

    <!-- The Modal -->
<div id="myModalpick" class="modal">

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
var modal = document.getElementById("myModalpick");

// Get the button that opens the modal
var btn = document.getElementById("myBtnpick");

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

      <!-- The Modal -->
<div id="myModalpick2" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>

      <h2>Adjust Shrinkage</h2>
      <p></p>
      <asp:TextBox ID="shrinkage" runat="server"></asp:TextBox><asp:Label ID="Labelshrinkage" runat="server" Text="%"></asp:Label>
      <p></p>
      <asp:Button ID="saveshrinkage" runat="server" Text="Save Changes" />

      <script>
          // Get the modal
          var modal = document.getElementById("myModalpick2");

          // Get the button that opens the modal
          var btn = document.getElementById("gearButton");

          // Get the <span> element that closes the modal
          var span = document.getElementsByClassName("close")[0];

          // When the user clicks the button, open the modal 
          btn.onclick = function () {
              modal.style.display = "block";
          }

          // When the user clicks on <span> (x), close the modal
          span.onclick = function () {
              modal.style.display = "none";
          }

          // When the user clicks anywhere outside of the modal, close it
          window.onclick = function (event) {
              if (event.target == modal) {
                  modal.style.display = "none";
              }
          }
</script>

    </div>
    </div>
</asp:Content>
