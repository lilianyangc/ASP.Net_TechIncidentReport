<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSurvey.aspx.cs" Inherits="TechKnowPro.ViewSurvey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TechKnowPro</title>
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
     <link rel="stylesheet" type="text/css" href="CSS_Ext/ViewSurvey.css" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="w-100">
                <tr>
                    <td><asp:LinkButton ID="lkb" runat="server" OnClick="lkb_Click" Font-Underline="False" CausesValidation="False" ForeColor="#F0A15B"><h1 class="myH1">TechKnow Pro - Incident Report Management Software</h1></asp:LinkButton></td>
                    <td><asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" class="btn btn-outline-warning" /></td>
                </tr>
            </table>
            <br />
            <hr class="myHr" />
            <h2>View Survey</h2>
            </div>
        <div class="homebg">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Select Customer:&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownList1"  AppendDataBoundItems="true" runat="server" Height="25px" Width="239px" DataSourceID="SqlDataSource1" DataTextField="quer" DataValueField="customer_id" AutoPostBack="True" CssClass="textbox2">
                        <asp:ListItem Value="0">-- Select Customer --</asp:ListItem>
                        
                    </asp:DropDownList>
                    </td>
                <td class="auto-style10">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * , [lastname] + ', ' + [firstname] as quer FROM [customers]"></asp:SqlDataSource>
                </td>
                <td class="auto-style13">Customer Id:&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" enabled="false" CssClass="textbox2"></asp:TextBox>
                </td>
                <td class="auto-style16">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Survey List:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ListBox ID="lbSurvey" runat="server" DataSourceID="SqlDataSource2" DataTextField="quer" DataValueField="survey_id" Height="152px" Width="245px"></asp:ListBox>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [survey_id], [incident_id], [response_time], [technician_efficiency], [problem_efficiency], [contact_to_discuss], [preferred_contact], [additional_comment], [datetime], [customer_id], 'Survey result for incident ' + CONVERT(varchar(20),[incident_number]) as quer FROM [surveys] WHERE ([customer_id] = @customer_id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox1" Name="customer_id" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </td>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Button ID="btnRetrieve" runat="server" Text="Retrieve Survey Details" OnClick="btnRetrieve_Click" class="btn btn-outline-dark" Width="239px"  />
                    <br />
                    <asp:Label ID="lblNoSurvey" runat="server" Text=""></asp:Label>
                </td>
                <td class="auto-style11"></td>
                <td class="auto-style14"></td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style17">Customer Rating:</td>
                <td class="auto-style18"></td>
                <td class="auto-style19"></td>
                <td class="auto-style20"></td>
            </tr>
            <tr>
                <td class="auto-style4">Response Time:</td>
                <td class="auto-style12">
                    <asp:Label ID="lblResponseTime" runat="server" BorderColor="Blue"></asp:Label>
                </td>
                <td class="auto-style15">Contact to discuss Incident: </td>
                <td class="auto-style6">
                    <asp:Label ID="lblContactToDiscuss" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Technician Efficiency:</td>
                <td class="auto-style10">
                    <asp:Label ID="lblTechEfficiency" runat="server"></asp:Label>
                </td>
                <td class="auto-style13">Contact Method:</td>
                <td class="auto-style16">
                    <asp:Label ID="lblPreferredContactMethod" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Problem Resolution:</td>
                <td class="auto-style10">
                    <asp:Label ID="lblProbReso" runat="server"></asp:Label>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Additional Comment:</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtAdditionalComments" runat="server" textmode="MultiLine" Style="resize:none" Height="123px" Width="440px" Enabled="false" CssClass="textbox2"></asp:TextBox>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnHome" runat="server" Text="Home" class="btn btn-outline-dark" Width="239px" OnClick="btnHome_Click"  />
                </td>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
            </tr>
        </table>
        </div>
    </form>
       <br />
    <div class="td">
    <hr class="myHr" />
    @2019 - COMP2139 - Techknow Pro

    </div>
    <br />
    <br />
</body>
</html>
