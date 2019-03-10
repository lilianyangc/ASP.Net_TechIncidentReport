<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubmitSurvey.aspx.cs" Inherits="TechKnowPro.SubmitSurvey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <link href="Content/bootstrap.min.css" rel="stylesheet" />
     <link rel="stylesheet" type="text/css" href="CSS_Ext/Home.css">

    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

    <style type="text/css">

        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 108px;
        }
        .auto-style3 {
            height: 102px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
             <table class="w-100">
                    <tr>
                        <td class="auto-style3"> 
                            <h1 class="myH1">TechKnow </h1>
                            <span>Incident Report Management Software</span>
                        </td>
                    </tr>
                </table>
                <br />
                <hr class="myHr" />
            <div class="homebg">
                <h2><strong>Survey Complete!</strong></h2>
                <p>Thank you for your feedback!</p>
                <p>A customer service representative will contact you within 24 hours.</p>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">
                            <asp:Button ID="btnHome" runat="server" Text="Home" Width="69px" class="btn btn-outline-dark"  />
                        </td>
                        <td>
                            <asp:Button ID="btnReturnSurvey" runat="server" Text="Return to Survey" PostBackUrl="~/Survey.aspx" class="btn btn-outline-dark" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </form>
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

    <div class="td">
    <hr class="myHr" />
    @2019 - COMP2139 - Techknow Pro

    </div>
</body>
</html>
