<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Survey.aspx.cs" Inherits="TechKnowPro.Survey" %>

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
            width: 278px;
        }

        .auto-style3 {
            width: 278px;
            height: 23px;
        }

        .auto-style4 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="w-100">
            <tr>
                <td>
                    <asp:LinkButton ID="lkbhead" runat="server" Visible="True" ForeColor="#F0A15B" OnClick="lkbhead_Click" Font-Underline="False" CausesValidation="False"><h1 class="myH1">TechKnow Pro - Incident Report Management Software</h1></asp:LinkButton></td>
                <td>
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" class="btn btn-outline-warning" CausesValidation="False" /></td>
            </tr>
        </table>
        <br />
        <h2>Surveys- Collect feedback from customers</h2>
        <hr class="myHr" />
        <div class="homebg">
            <table class="auto-style1 " style="padding: 10px">
                <tr>
                    <br />
                    <td class="auto-style2">Customer Id:</td>
                    <td>
                        <asp:TextBox ID="txtCustId" runat="server" Enabled="false" CssClass="textbox2"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Incidents:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="true" Height="35px" Width="515px" DataSourceID="SqlDataSource1" DataTextField="quer" DataValueField="incident_number" CssClass="textbox2" AutoPostBack="True">
                            <asp:ListItem>Select an Incident</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT 'Incident for Product ' + [product_name] + ', ' + [status] + ', ' + CONVERT(varchar(20),[datetime],101) + ' - ' +  [description] as quer , [incident_id], [customer_id], [method_of_contact], [incident_number], [is_answered] FROM [incidents] WHERE (([customer_id] = @customer_id) AND ([is_answered] IS NULL)) AND ([status] = @status )">
                            <SelectParameters>
                                <asp:SessionParameter Name="customer_id" SessionField="customerId" Type="Int32" />
                                <asp:Parameter Name="status" Type="string" DefaultValue="CLOSED" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Please rate this incident by following categories</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Response Time:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                            <asp:ListItem>Not Satisfied</asp:ListItem>
                            <asp:ListItem>Somewhat Satisfied</asp:ListItem>
                            <asp:ListItem>Satisfied</asp:ListItem>
                            <asp:ListItem>Completely Satisfied</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="This Field is Required" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Technician Efficiency:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                            <asp:ListItem>Not Satisfied</asp:ListItem>
                            <asp:ListItem>Somewhat Satisfied</asp:ListItem>
                            <asp:ListItem>Satisfied</asp:ListItem>
                            <asp:ListItem>Completely Satisfied</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList2" ErrorMessage="This Field is Required" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Probelem Resolution:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList3" runat="server">
                            <asp:ListItem>Not Satisfied</asp:ListItem>
                            <asp:ListItem>Somewhat Satisfied</asp:ListItem>
                            <asp:ListItem>Satisfied</asp:ListItem>
                            <asp:ListItem>Completely Satisfied</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RadioButtonList3" ErrorMessage="This Field is Required" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Additional Comments:</td>
                    <td>
                        <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Height="123px" Width="572px" Style="resize: none" CssClass="textbox2"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:CheckBox ID="CheckBox1" runat="server" Text="Please contact me to discuss incident" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:RadioButtonList ID="RadioButtonList4" runat="server">
                            <asp:ListItem>Contact Via Email</asp:ListItem>
                            <asp:ListItem>Contact Via Phone</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RadioButtonList4" ErrorMessage="This Field is Required" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style4"></td>
                    <td class="auto-style4"></td>
                    <td class="auto-style4"></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" class="btn btn-outline-dark" />
                        <asp:Button ID="btnBack" runat="server" Text="Back" Width="71px" class="btn btn-outline-dark" OnClick="btnBack_Click" CausesValidation="False" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [surveys] WHERE [survey_id] = @survey_id" InsertCommand="INSERT INTO [surveys] ([response_time], [technician_efficiency], [problem_efficiency], [contact_to_discuss], [preferred_contact], [additional_comment], [datetime], [customer_id], [incident_number]) VALUES (@response_time, @technician_efficiency, @problem_efficiency, @contact_to_discuss, @preferred_contact, @additional_comment, @datetime, @customer_id, @incident_number)" SelectCommand="SELECT * FROM [surveys]" UpdateCommand="UPDATE [surveys] SET [incident_id] = @incident_id, [response_time] = @response_time, [technician_efficiency] = @technician_efficiency, [problem_efficiency] = @problem_efficiency, [contact_to_discuss] = @contact_to_discuss, [preferred_contact] = @preferred_contact, [additional_comment] = @additional_comment, [datetime] = @datetime WHERE [survey_id] = @survey_id">
            <DeleteParameters>
                <asp:Parameter Name="survey_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter Name="incident_number" Type="Int32" ControlID="DropDownList1" />
                <asp:ControlParameter Name="response_time" Type="String" ControlID="RadioButtonList1" />
                <asp:ControlParameter Name="technician_efficiency" Type="String" ControlID="RadioButtonList2" />
                <asp:ControlParameter Name="problem_efficiency" Type="String" ControlID="RadioButtonList3" />
                <asp:ControlParameter Name="contact_to_discuss" Type="Boolean" ControlID="CheckBox1" />
                <asp:ControlParameter Name="preferred_contact" Type="String" ControlID="RadioButtonList4" />
                <asp:ControlParameter Name="additional_comment" Type="String" ControlID="txtComments" />
                <asp:Parameter Name="datetime" Type="DateTime" />
                <asp:SessionParameter Name="customer_id" Type="Int32" SessionField="customerId" />

            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="incident_id" Type="Int32" />
                <asp:Parameter Name="response_time" Type="String" />
                <asp:Parameter Name="technician_efficiency" Type="String" />
                <asp:Parameter Name="problem_efficiency" Type="String" />
                <asp:Parameter Name="contact_to_discuss" Type="Boolean" />
                <asp:Parameter Name="preferred_contact" Type="String" />
                <asp:Parameter Name="additional_comment" Type="String" />
                <asp:Parameter Name="datetime" Type="DateTime" />
                <asp:Parameter Name="survey_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [incidents] WHERE [incident_id] = @incident_id" InsertCommand="INSERT INTO [incidents] ([customer_id], [datetime], [status], [description], [method_of_contact], [product_name], [incident_number], [is_answered]) VALUES (@customer_id, @datetime, @status, @description, @method_of_contact, @product_name, @incident_number, @is_answered)" SelectCommand="SELECT * FROM [incidents] WHERE ([incident_id] = @incident_id)" UpdateCommand="UPDATE [incidents] SET [is_answered] = @is_answered WHERE [incident_number] = @incident_number">
            <DeleteParameters>
                <asp:Parameter Name="incident_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="customer_id" Type="Int32" />
                <asp:Parameter Name="datetime" Type="DateTime" />
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="method_of_contact" Type="String" />
                <asp:Parameter Name="product_name" Type="String" />
                <asp:Parameter Name="incident_number" Type="Int32" />
                <asp:Parameter Name="is_answered" Type="Boolean" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="incident_id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="customer_id" Type="Int32" />
                <asp:Parameter Name="datetime" Type="DateTime" />
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="method_of_contact" Type="String" />
                <asp:Parameter Name="product_name" Type="String" />
                <asp:ControlParameter Name="incident_number" Type="Int32" ControlID="DropDownList1" />
                <asp:Parameter Name="is_answered" Type="Boolean" DefaultValue="True" />
                <asp:Parameter Name="incident_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
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
