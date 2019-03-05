<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordReset3.aspx.cs" Inherits="TechKnowPro.PasswordReset3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 181px;
        }
    </style>
</head>
<body>
    Password Reset
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Enter new password:</td>
                    <td>
                        <asp:TextBox ID="txtPassword1" runat="server" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Re-type password:</td>
                    <td>
                        <asp:TextBox ID="txtPassword2" runat="server" TextMode="Password"></asp:TextBox>
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
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
    </form>
</body>
    <asp:SqlDataSource ID="sdsPassword" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" UpdateCommand="UPDATE [users] SET [password] = @password WHERE [user_id] = @user_id">                  
        <UpdateParameters>
            <asp:ControlParameter ControlID="txtPassword1" Name="password" PropertyName="Text" Type="String" />
            <asp:SessionParameter Name="user_id" SessionField="UserId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</html>
