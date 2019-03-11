<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSurvey.aspx.cs" Inherits="TechKnowPro.ViewSurvey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
     <link rel="stylesheet" type="text/css" href="CSS_Ext/ViewSurvey.css">

    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 376px;
        }
        .auto-style4 {
            width: 376px;
            height: 23px;
        }
        .auto-style6 {
            height: 23px;
        }
        .auto-style7 {
            width: 376px;
            height: 30px;
        }
        .auto-style9 {
            height: 30px;
        }
        .auto-style10 {
            width: 307px;
        }
        .auto-style11 {
            width: 307px;
            height: 30px;
        }
        .auto-style12 {
            width: 307px;
            height: 23px;
        }
        .auto-style13 {
            width: 301px;
        }
        .auto-style14 {
            width: 301px;
            height: 30px;
        }
        .auto-style15 {
            width: 301px;
            height: 23px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <h1>
                <table class="w-100">
                    <tr>
                        <td> 
                            <h1 class="myH1">TechKnow Pro - Incident Report Management Software</h1></td>
                        <td>
                            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" class="btn btn-outline-warning"  />
                        </td>
                    </tr>
                </table>
            <br />
            <hr class="myHr">
             </h1>
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
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="This Field is Required " ForeColor="#CC0000" InitialValue="-- Select Customer --"></asp:RequiredFieldValidator>--%>
                </td>
                <td class="auto-style13">Customer Id:&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" enabled="false" CssClass="textbox2"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Survey List:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DropDownList2"   AppendDataBoundItems="true" runat="server" Height="25px" Width="239px" DataSourceID="SqlDataSource2" DataTextField="quer" DataValueField="survey_id" CssClass="textbox2">
                        <asp:ListItem Value="0">-- Select a Survey --</asp:ListItem>
                        
                    </asp:DropDownList>
                    </td>
                <td class="auto-style10">
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [survey_id], 'Survey result for incident '+ CONVERT(varchar(20), [incident_number]) as quer, [response_time], [technician_efficiency], [problem_efficiency], [contact_to_discuss], [preferred_contact], [additional_comment], [datetime], [customer_id] FROM [surveys] WHERE ([customer_id] = @customer_id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="customer_id" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2" ErrorMessage="This Field is Required" ForeColor="#CC0000" InitialValue="0"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Button ID="btnRetrieve" runat="server" Text="Retrieve Survey Details" OnClick="btnRetrieve_Click" class="btn btn-outline-dark"  />
                </td>
                <td class="auto-style11"></td>
                <td class="auto-style14"></td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style4">Customer Rating:</td>
                <td class="auto-style12"></td>
                <td class="auto-style15"></td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style4">Response Time:</td>
                <td class="auto-style12">
                    <asp:Label ID="lblResponseTime" runat="server"></asp:Label>
                </td>
                <td class="auto-style15">Contact to discuss Incident:</td>
                <td class="auto-style6">
                    <asp:Label ID="lblContactToDiscuss" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Technician Efficiency:</td>
                <td class="auto-style10">
                    <asp:Label ID="lblTechEfficiency" runat="server"></asp:Label>
                </td>
                <td class="auto-style13">Preferred Contact Method:</td>
                <td>
                    <asp:Label ID="lblPreferredContactMethod" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Problem Resolution:</td>
                <td class="auto-style10">
                    <asp:Label ID="lblProbReso" runat="server"></asp:Label>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Additional Comment:<asp:TextBox ID="txtAdditionalComments" runat="server" textmode="MultiLine" Style="resize:none" Height="123px" Width="572px" Enabled="false" CssClass="textbox2"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnHome" runat="server" Text="Home" class="btn btn-outline-dark" Width="192px"  />
                </td>
                <td class="auto-style10">
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [surveys] WHERE ([survey_id] = @survey_id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="survey_id" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </div>
    </form>
       <br />
    <div class="td">
    <hr class="myHr">
    @2019 - COMP2139 - Techknow Pro

    </div>
</body>
</html>
