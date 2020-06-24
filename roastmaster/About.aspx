<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="roastmaster.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Register</h2>
    <p>&nbsp;</p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server">Email</asp:TextBox>
    </p>
    <p>
        <asp:TextBox ID="TextBox2" runat="server">First Name</asp:TextBox>
&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server">Last Name</asp:TextBox>
    </p>
    <p>
        <asp:TextBox ID="TextBox4" runat="server">Password</asp:TextBox>
    </p>
    <p>
        <asp:TextBox ID="TextBox5" runat="server">Confirm Password</asp:TextBox>
    </p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Permissions</asp:ListItem>
            <asp:ListItem>Employee</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Register" />
    </p>
    <p>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Contact.aspx">Already have an account? Sign in!</asp:HyperLink>
    </p>
</asp:Content>
