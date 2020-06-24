<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="roastmaster.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Sign In</h2>
    <p>&nbsp;</p>
    
    <div>
        
        <p><asp:TextBox ID="TextBox1" runat="server">Email</asp:TextBox></p>
        <p><asp:TextBox ID="TextBox2" runat="server">Password</asp:TextBox></p>
        <p>
            <asp:HyperLink ID="HyperLink1" runat="server">Forgot your password?</asp:HyperLink>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Sign In" />
        &nbsp;&nbsp;&nbsp;
            <asp:CheckBox ID="CheckBox1" Text="Keep me signed in" runat="server" />
        </p>
        <p>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/About.aspx">Don't have an account? Register!</asp:HyperLink>
        </p>

    </div>
</asp:Content>
