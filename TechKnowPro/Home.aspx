<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TechKnowPro.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TechKnowPro</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS_Ext/Home.css" />
</head>
<body>
    <form id="form1" runat="server" >
        <table class="w-100">
            <tr>
                <td><asp:LinkButton ID="lkb" runat="server" OnClick="lkb_Click" Font-Underline="False" CausesValidation="False" ForeColor="#F0A15B"><h1 class="myH1">TechKnow Pro - Incident Report Management Software</h1></asp:LinkButton></td>
                <td><asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" class="btn btn-outline-warning" CausesValidation="False" /></td>
            </tr>
        </table>
        <br />
        <hr class="myHr" />
        <div class="homebg">
            <h2>Welcome to the Techknow Pro Support Portal</h2>
            <br />
        </div>
        <div class="homebg">
            <h3>Getting Started</h3>
            <asp:Label ID="lblGetStarted" runat="server" Text=""></asp:Label>
        </div>
        <div class="homebg">
            <asp:Button ID="btnTarget" runat="server" Text="Customers" OnClick="btnTarget_Click" class="btn btn-outline-dark" />
            <asp:Button ID="btnTarget2" runat="server" Text="Contact List" OnClick="btnTarget2_Click" class="btn btn-outline-dark" />
            <asp:Button ID="btnTarget3" runat="server" Text="View Surveys" OnClick="btnTarget3_Click" class="btn btn-outline-dark" />
            <asp:Button ID="btnTarget4" runat="server" Text="View Incident"  Visible="false" OnClick="btnTarget4_Click" class="btn btn-outline-dark"/>
             <br /><br />
             <asp:HiddenField ID="hfUserID" runat="server" />
        <asp:SqlDataSource 
            ID="SqlDataSource1" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [customer_id] FROM customers WHERE [user_id] = @user_id">
            <SelectParameters>
                <asp:ControlParameter ControlID="hfUserID" Name="user_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
        </form>
        <div class="homebg">
            <h3><asp:Label ID="lblContent1" runat="server" Text=""></asp:Label></h3>
            <asp:Label ID="lblContent2" runat="server" Text=""></asp:Label>
            <br />
            <br />  
            <h3>Group Members</h3>
            1. Aldrin Jacildo - 101112293<br />
            2. Francis Victa - 101159185<br />
            3. Maria Lilian Yang - 101151657<br />
            4. Sir Angel Naguit - 101152749<br />
            5. Orell Steeven Wemin - 101091788<br />     
        </div>
        <div class="td">
                <hr class="myHr" />
                @2019 - COMP2139 - Techknow Pro
        </div>
        <br />
        <br />
</body>
</html>
