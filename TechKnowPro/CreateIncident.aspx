<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateIncident.aspx.cs" Inherits="TechKnowPro.CreateIncident" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TechKnowPro</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="CSS_Ext/Home.css" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 438px;
        }

        .auto-style3 {
            width: 95%;
            margin-top: 0px;
        }

        .auto-style4 {
            height: 26px;
        }

        .auto-style8 {
            width: 182px;
        }

        .auto-style9 {
            height: 26px;
            width: 182px;
        }

        .auto-style10 {
            background-color: white;
            padding: 3em;
            margin: 2em;
            color: black;
            height: 814px;
        }

        .auto-style11 {
            height: 490px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="w-100">
            <tr>
                <td>
                    <asp:LinkButton ID="lkb" runat="server" OnClick="lkb_Click" Font-Underline="False" CausesValidation="False" ForeColor="#F0A15B"><h1 class="myH1">TechKnow Pro - Incident Report Management Software</h1></asp:LinkButton>
                </td>
                <td>
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" class="btn btn-outline-warning" CausesValidation="False" />
                </td>
            </tr>
        </table>
        <br />
        <hr class="myHr" />
        <h2>Incident Report Page</h2>
        <br />
        <div class="auto-style10">
            <div>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">
                            <table class="auto-style3">
                                <tr>
                                    <td class="auto-style8">
                                        <asp:Label ID="Label1" runat="server" Text="Select a Customer:"></asp:Label>;
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlCustomers" AppendDataBoundItems="true" runat="server" Height="25px" Width="160px" CssClass="textbox2" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="customer_name" DataValueField="customer_id">
                                            <asp:ListItem Selected="True">SELECT CUSTOMER</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Please select a Customer!" ForeColor="Red" ControlToValidate="ddlCustomers" ValidationGroup="vg" OnServerValidate="CustomValidator1_ServerValidate1">*</asp:CustomValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style9">
                                        <asp:Label ID="Label2" runat="server" Text="Customer ID:"></asp:Label>
                                    </td>
                                    <td class="auto-style4">
                                        <asp:TextBox ID="txtCustomerId" runat="server" Width="160px" ReadOnly="True" CssClass="textbox2"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style9">
                                        <asp:Label ID="Label7" runat="server" Text="Product Name:"></asp:Label>&nbsp;
                                    </td>
                                    <td class="auto-style4">
                                        <asp:TextBox ID="txtProductName" runat="server" Width="160px" CssClass="textbox2"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Product Name Required!" ForeColor="Red" ControlToValidate="txtProductName" ValidationGroup="vg">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <table class="auto-style1">
                                <tr>
                                    <td class="auto-style8">
                                        <asp:Label ID="Label3" runat="server" Text="Report Date and Time:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDateTime" runat="server" Width="230px" ReadOnly="True" CssClass="textbox2"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style9">
                                        <asp:Label ID="Label4" runat="server" Text="Incident #: "></asp:Label>
                                    </td>
                                    <td class="auto-style4">
                                        <asp:TextBox ID="txtIncidentNum" runat="server" Width="230px" ReadOnly="True" AutoPostBack="True" CssClass="textbox2"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">
                                        <asp:Label ID="Label5" runat="server" Text="Status: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlStatus" runat="server" Height="25px" Width="230px" CssClass="textbox2">
                                            <asp:ListItem Selected="True">NEW</asp:ListItem>
                                            <asp:ListItem>IN PROGRESS</asp:ListItem>
                                            <asp:ListItem>CLOSED</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <p>Description of Problem:</p>
                &nbsp;&nbsp;&nbsp;    
            <asp:TextBox ID="txtDescription" runat="server" Height="177px" TextMode="MultiLine" Width="869px" CssClass="textbox2"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescription" ErrorMessage="Problem Description Required!" ForeColor="Red" ValidationGroup="vg">*</asp:RequiredFieldValidator>
            </div>
            <div class="auto-style11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Contact Method Required!" ControlToValidate="rblContactMethod" ForeColor="Red" ValidationGroup="vg">*</asp:RequiredFieldValidator>&nbsp;
            <asp:Label ID="Label6" runat="server" Text="Method of Contact: "></asp:Label>

                <asp:RadioButtonList ID="rblContactMethod" runat="server" CssClass="textbox">
                    <asp:ListItem>Phone</asp:ListItem>
                    <asp:ListItem>Email</asp:ListItem>
                    <asp:ListItem>In Person</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" PostBackUrl="~/CreateIncident.aspx" class="btn btn-outline-dark" ValidationGroup="vg" />
                <br />
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Height="280px" ValidationGroup="vg" />
                <br />
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [customer_id], [user_id], ([lastname]+',  ' + [firstname]) as customer_name FROM [customers]"
                    InsertCommand="INSERT INTO [incidents] 
                                        (incident_number, customer_id, datetime, status, description, method_of_contact, product_name)
                                    VALUES
                                        (@incident_number, @customer_id, @datetime, @status, @description, @method_of_contact, @product_name)">
                    <InsertParameters>
                        <asp:FormParameter Name="incident_number" FormField="txtIncidentNum" Type="Int32" />
                        <asp:FormParameter Name="customer_id" FormField="txtCustomerId" Type="Int32" />
                        <asp:FormParameter Name="datetime" Type="DateTime" />
                        <asp:FormParameter Name="status" FormField="ddlStatus" Type="String" />
                        <asp:FormParameter Name="description" FormField="txtDescription" Type="String" />
                        <asp:FormParameter Name="method_of_contact" FormField="rblContactMethod" Type="String" />
                        <asp:FormParameter Name="product_name" FormField="txtProductName" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource
                    ID="SqlDataSource2"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="select [incident_id] from incidents order by [incident_id] desc;"></asp:SqlDataSource>
                <asp:SqlDataSource
                    ID="SqlDataSource3"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT (COUNT(*)+1) as count FROM [incidents]"></asp:SqlDataSource>
            </div>
        </div>
    </form>
    <br />
    <br />
    <br />
    <div class="td">
        <hr class="myHr" />
        @2019 - COMP2139 - Techknow Pro
    </div>
    <br />
    <br />
</body>
</html>
