<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordReset1.aspx.cs" Inherits="TechKnowPro.PasswordReset1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Please enter your email address:<br />
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            <br />
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
        </div>
        <br />
        <asp:Button ID="btnBack" runat="server" Text="Back to Login" OnClick="btnBack_Click" CausesValidation="False" />
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [email] FROM [customers]"></asp:SqlDataSource>
        
    </form>
</body>
</html>
