<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewIncident.aspx.cs" Inherits="TechKnowPro.ViewIncident" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TechKnowPro</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="CSS_Ext/ViewIncident.css" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>

    <form id="form1" runat="server">
        <table class="w-100">
            <tr>
                <td>
                    <asp:LinkButton ID="lkbhead" runat="server" Visible="True" ForeColor="#F0A15B" OnClick="lkbhead_Click" Font-Underline="False" CausesValidation="False"><h1 class="myH1">TechKnow Pro - Incident Report Management Software</h1></asp:LinkButton></td>
                <td>
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" class="btn btn-outline-warning" Style="margin-top: 43px;" CausesValidation="False" /></td>
            </tr>
        </table>
        <br />
        <hr class="myHr" />
        <h2>View Incident</h2>
        <br />
        <div class="homebg">
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <div class="auto-style11">Select:</div>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCustomers" runat="server" Height="30px" Width="201px" AppendDataBoundItems="true"
                            DataSourceID="SqlDataSource1"
                            DataTextField="full_name"
                            AutoPostBack="True" DataValueField="customer_id" CssClass="textbox2">
                            <asp:ListItem>SELECT CUSTOMER</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                </tr>
            </table>


            <div class="homebg">
                <p>Incident List:</p>
                <asp:ListBox ID="lbIncidents" runat="server" Height="194px" Width="1100px" DataSourceID="SqlDataSource2" DataTextField="incident_list" DataValueField="incident_id" CssClass="textbox2"></asp:ListBox>
                <br />
                <asp:Button ID="btnRetrieve" runat="server" Text="Retrieve" OnClick="Button1_Click" class="btn btn-outline-dark" />
            </div>
            <br />

            <div class="auto-style12">
                <div class="auto-style13">
                    <p class="auto-style14">Details</p>
                    <table class="auto-style3" style="border: solid black 1px; padding: 10px;">
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label2" runat="server" Text="Customer ID:"></asp:Label>
                            </td>
                            <td class="auto-style6">
                                <asp:Label ID="lblCustomerId" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="Label3" runat="server" Text="Report Date & Time:"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                <asp:Label ID="lblDateTime" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="Label4" runat="server" Text="Incident #:"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                <asp:Label ID="lblIncidentNum" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="Label5" runat="server" Text="Status:"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                <asp:DropDownList ID="ddlStatus" runat="server">
                                    <asp:ListItem>NEW</asp:ListItem>
                                    <asp:ListItem>IN PROGRESS</asp:ListItem>
                                    <asp:ListItem>CLOSED</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>

                <div style="margin-left: 5%;" class="auto-style9">
                    <p class="auto-style15">Description</p>
                    <asp:TextBox ID="txtDescription" runat="server" Height="204px" TextMode="MultiLine" Width="600px" CssClass="textbox2"></asp:TextBox>
                </div>
                <asp:Button ID="btnHome" runat="server" Text="Home" class="btn btn-outline-dark" Style="margin-right: 50px;" OnClick="btnHome_Click1" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" class="btn btn-outline-dark" />
            </div>
            <footer class="homebg">
                <asp:SqlDataSource
                    ID="SqlDataSource1"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [customer_id], ([lastname] + ', ' + [firstname]) as full_name FROM [customers]"></asp:SqlDataSource>
                <asp:SqlDataSource
                    ID="SqlDataSource2"
                    runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [incident_id], [incident_number], [customer_id], [user_id], [status], [datetime], [description], [method_of_contact], ('Incident for product ' + [product_name] + ', ' + [status] + ', ' + CONVERT(varchar, [datetime]) + ', '  +[description]) as incident_list FROM [incidents] WHERE ([customer_id] = @customer_id)"
                    UpdateCommand="UPDATE incidents SET [status] = @status WHERE [incident_number] = @incident_number">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblCustomerId" Name="customer_id" PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="ddlStatus" Name="status" PropertyName="Text" Type="String" />
                        <asp:FormParameter FormField="hfIncidentNumber" Name="incident_number" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:HiddenField ID="hfStatus" runat="server" />
                <asp:HiddenField ID="hfIncidentNumber" runat="server" />
            </footer>
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
