<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordReset3.aspx.cs" Inherits="TechKnowPro.PasswordReset3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TechKnowPro - Password Retrieval</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS_Ext/Home.css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 181px;
        }
        .auto-style3 {
            width: 181px;
            height: 76px;
        }
        .auto-style4 {
            height: 76px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:LinkButton ID="lkbhead" runat="server" Visible="True" ForeColor="#F0A15B" OnClick="lkbhead_Click" Font-Underline="False" CausesValidation="False"><h1 class="myH1">TechKnow Pro - Incident Report Management Software</h1></asp:LinkButton>
        </div>
        <br />
        <div class="homebg">
            <strong>Password Reset</strong>
            <div>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">Enter new password:</td>
                        <td>
                            <asp:TextBox ID="txtPassword1" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPassword1" ErrorMessage="Password length must be from 6 - 12 characters!" ForeColor="Red" ValidationExpression="^.{6,12}$" Display="Dynamic"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!" ControlToValidate="txtPassword1" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Re-type password:</td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtPassword2" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required!" ControlToValidate="txtPassword2" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>
                            <asp:Button ID="btnSubmit" runat="server" Text="Reset Password" OnClick="btnSubmit_Click" />
                        </td>
                    </tr>
                </table>
            </div>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword1" ControlToValidate="txtPassword2" ErrorMessage="Passwords must match!" ForeColor="Red"></asp:CompareValidator>
            <br />
            <asp:Label ID="lblMsg" runat="server" Text="" Display="Dynamic"></asp:Label>
            <asp:Label ID="lblErr" runat="server" ForeColor="Red" Display="Dynamic"></asp:Label>
        </div>
    </form>
    <asp:SqlDataSource ID="sdsPassword" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" UpdateCommand="UPDATE [users] SET [password] = @password WHERE [user_id] = @user_id">
        <UpdateParameters>
            <asp:SessionParameter Name="password" SessionField="password" Type="string" />
            <asp:SessionParameter Name="user_id" SessionField="UserId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</body>
</html>
