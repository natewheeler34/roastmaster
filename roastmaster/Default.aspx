<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="roastmaster._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p></p>
    <p></p>
    <Button type="button" style="width:125px; height:125px;" onclick="window.location.href='Leads.aspx';">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/icons8-phone-32.png" /><br />
        Leads</Button>

&nbsp;&nbsp;&nbsp;
    <button type="button" style="width:125px; height:125px;" onclick="window.location.href='Clients.aspx';">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/icons8-people-32.png" />
        <br />
        Clients
    </button>

&nbsp;&nbsp;&nbsp;
    <button type="button" style="width:125px; height:125px;" onclick="window.location.href='SO.aspx';">
        <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/icons8-us-dollar-32.png" />
        <br />
        Sales
        Orders
    </button>

&nbsp;&nbsp;&nbsp;
    <button style="width:125px; height:125px;" onclick="window.location.href='Pick.aspx';" type="button">
        <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/icons8-hand-box-32.png" />
        <br />
        Picking Tickets</button>

&nbsp;&nbsp;&nbsp;
    <button style="width:125px; height:126px;" onclick="window.location.href='Products.aspx';" type="button">
        <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/icons8-launch-32.png" />
        <br />
        Products</button>

&nbsp;&nbsp;&nbsp;
    <button style="width:125px; height:125px;" onclick="window.location.href='Inventory.aspx';" type="button">
        <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/icons8-warehouse-32.png" />
        <br />
        Inventory</button>

&nbsp;&nbsp;&nbsp;
    <button style="width:125px; height:125px;" onclick="window.location.href='Batches.aspx';" type="button">
        <asp:Image ID="Image7" runat="server" ImageUrl="~/Images/icons8-java-bean-32.png" />
        <br />
        Batches</button>

&nbsp;&nbsp;&nbsp;
    <button style="width:125px; height:125px;" onclick="window.location.href='Pack.aspx';" type="button">
        <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/icons8-cardboard-box-32.png" />
        <br />
        Packing Slips
    </button>

    <br />
    <br />
    <button style="width:125px; height:125px;" onclick="window.location.href='Vendors.aspx';" type="button">
        <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/icons8-shop-32.png" />
        <br />
        Vendors</button>

&nbsp;&nbsp;&nbsp;
    <button style="width:125px; height:125px;" onclick="window.location.href='PO.aspx';" type="button">
        <asp:Image ID="Image10" runat="server" ImageUrl="~/Images/icons8-receipt-dollar-32.png" />
        <br />
        Purchase Orders</button>

&nbsp;&nbsp;&nbsp;
    <button style="width:125px; height:125px;" onclick="window.location.href='Invoices.aspx';" type="button">
        <asp:Image ID="Image11" runat="server" ImageUrl="~/Images/icons8-file-invoice-32.png" />
        <br />
        Invoices</button>

&nbsp;&nbsp;&nbsp;
    <button style="width:125px; height:125px;" type="button">
        <asp:Image ID="Image12" runat="server" ImageUrl="~/Images/icons8-estimate-32.png" />
        <br />
        Accounting</button>

&nbsp;&nbsp;&nbsp;
    <button style="width:125px; height:125px;" type="button">
        <asp:Image ID="Image13" runat="server" ImageUrl="~/Images/icons8-return-32.png" />
        <br />
        Returns</button>

    &nbsp;&nbsp;&nbsp;
    <button style="width:125px; height:125px;" type="button">
        <asp:Image ID="Image14" runat="server" ImageUrl="~/Images/icons8-chart-32.png" />
        <br />
        Reports</button>

    &nbsp;&nbsp;&nbsp;
    <button style="width:125px; height:125px;" type="button">
        <asp:Image ID="Image15" runat="server" ImageUrl="~/Images/icons8-security-pass-32.png" />
        <br />
        Employees</button>

    &nbsp;&nbsp;&nbsp;
    <button style="width:125px; height:125px;" type="button">
        <asp:Image ID="Image16" runat="server" ImageUrl="~/Images/icons8-cheque-32.png" />
        <br />
        Payroll</button>

</asp:Content>
