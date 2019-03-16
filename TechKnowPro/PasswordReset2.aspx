<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PasswordReset2.aspx.cs" Inherits="TechKnowPro.PasswordReset2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TechKnowPro - Password Retrieval</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="CSS_Ext/Home.css" />
</head>
<body>

    <form id="form1" runat="server">
        <div>
            <asp:LinkButton ID="lkbhead" runat="server" Visible="True" ForeColor="#F0A15B" OnClick="lkbhead_Click" Font-Underline="False" CausesValidation="False"><h1 class="myH1">TechKnow Pro - Incident Report Management Software</h1></asp:LinkButton>
        </div>
        <br />
        <div class="homebg">
            <strong>Please answer the security question below:</strong><br />
            <br />
            <div>
                <asp:Label ID="lblQuestion" runat="server" Text=""></asp:Label>
            </div>
            <asp:TextBox ID="txtAnswer" runat="server"></asp:TextBox>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            <br />
            <br />
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Button ID="btnBack" runat="server" Text="Back to Login" CausesValidation="False" OnClick="btnBack_Click" />
        </div>
    </form>
    <br />

</body>
<asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:ConnectionString %>" selectcommand="SELECT customers.customer_id, customers.user_id, customers.email, customers.question_id, questions.description, customers.question_answer FROM customers INNER JOIN questions ON customers.question_id = questions.question_id"></asp:sqldatasource>
</html>
