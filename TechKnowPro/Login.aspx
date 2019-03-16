<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TechKnowPro.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TechKnowPro</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="CSS_Ext/Login.css" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <style type="text/css">
    </style>
</head>
<body>

    <div class="outer">
        <div class="middle">
            <div class="inner">
                <h1>TechKnow Pro</h1>
                <p>&nbsp; Incident Management System</p>
                <div class="container">
                    <form id="form1" runat="server">
                        LOGIN<table class="auto-style1">
                            <tr>
                                <td class="auto-style2">Username:</td>
                                <td>&nbsp;<asp:TextBox ID="txtUsername" runat="server" class="textbox"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter a username!" ControlToValidate="txtUsername" ForeColor="Red" ValidationGroup="vg">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Username must be a valid email!" ControlToValidate="txtUsername" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="vg">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Password:</td>
                                <td class="auto-style4">&nbsp;<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="textbox"></asp:TextBox>
                                </td>
                                <td>&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a password" ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="vg">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3"></td>
                                <td class="auto-style4">
                                    <asp:HyperLink ID="hypPasswordReset" runat="server" NavigateUrl="~/PasswordReset1.aspx">Forgot password?</asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td>
                                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" class="btn btn-outline-dark" ValidationGroup="vg" />
                                    <asp:Button ID="btnRegister" runat="server" Text="Register" CausesValidation="False" OnClick="btnRegister_Click" class="btn btn-outline-dark" />
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT users.user_id, users.username, users.password, roles.definition FROM roles INNER JOIN user_roles ON roles.role_id = user_roles.role_id INNER JOIN users ON user_roles.user_id = users.user_id"></asp:SqlDataSource>
                        <asp:Label ID="lblResult" runat="server" ForeColor="Red" class="label"></asp:Label>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ForeColor="Red" ValidationGroup="vg" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
