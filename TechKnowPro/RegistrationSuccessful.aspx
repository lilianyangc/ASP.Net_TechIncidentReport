<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationSuccessful.aspx.cs" Inherits="TechKnowPro.RegistrationSuccessful" %>

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
    <form id="form1" runat="server">
        <div class="homebg">
            <h1>Registration Successful</h1>
            <br />
            <p>
                <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label></p>
            <asp:Button ID="btnLogin" runat="server" Text="Go Back to Login page" OnClick="btnLogin_Click" />
        </div>
    </form>
</body>
</html>
