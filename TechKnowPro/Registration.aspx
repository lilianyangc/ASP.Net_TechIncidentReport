<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="TechKnowPro.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
     <link rel="stylesheet" type="text/css" href="CSS_Ext/Registration.css" />

    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <style type="text/css">
        
        .auto-style1 {
            width: 248px;

        }
        .auto-style2 {
            width: 362px;
        }
        
    </style>
</head>
<body>

     <div class="outer">
  <div class="middle">
    <div class="inner homebg">
      <h1>TechKnow Pro</h1>
      <p>&nbsp; Incident Management System</p>
           <h1 class="auto-style6"> <asp:Label ID="Label1" runat="server" Text="Registration Page"></asp:Label>
        
            </h1>
        <div class="container">
    <form id="form1" runat="server">
            <div class="auto-style7">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Width="717px" ForeColor="Red" />
            </div>
        
        <table class="auto-style22 homebg">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" Text="Firstname: "></asp:Label>
                    <asp:TextBox ID="txtFN" runat="server" Width="143px" class="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFN" Display="Dynamic" ErrorMessage="First Name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Lastname: "></asp:Label>
                    <asp:TextBox ID="txtLN" runat="server" Width="164px" class="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLN" Display="Dynamic" ErrorMessage="Last Name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            </asp:Table>
            <table class="auto-style22">
                <td class="auto-style26">
                    &nbsp;Address:</td>
                <td>
                    <asp:TextBox ID="txtAddr" runat="server" Width="409px" style="margin-left: 10px" class="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddr" Display="Dynamic" ErrorMessage="Address is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
            </tr></asp:Table>
            <table class="auto-style22">
                <tr>
                <td class="auto-style25">
                    <asp:Label ID="Label5" runat="server" Text="Email: "></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtEm" runat="server" Width="134px" CssClass="textbox" TextMode="Email" style="margin-left: 54" class="textbox" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEm" Display="Dynamic" ErrorMessage="Email is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
                    
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:Label ID="Label6" runat="server" Text="Password: "></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPass1" runat="server" Width="132px" MaxLength="12" TextMode="Password" class="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPass1" Display="Dynamic" ErrorMessage="Password required" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="User must enter the same password" ControlToCompare="txtPass1" ControlToValidate="txtPass2" ForeColor="Red">*</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:Label ID="Label7" runat="server" Text="Confirm Password: "></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPass2" runat="server" Width="131px" MaxLength="12" TextMode="Password" class="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPass2" Display="Dynamic" ErrorMessage="Confirmation Password required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:Label ID="Label4" runat="server" Text="Security Question: "></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlQuestions" runat="server" DataSourceID="sdsQuestions" DataTextField="description" DataValueField="question_id" Width="253px"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:Label ID="Label9" runat="server" Text="Security Answer: "></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtQuestionAnswer" runat="server" Width="131px" MaxLength="12" class="textbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    &nbsp;</td>
                <td class="auto-style2">
                   &nbsp;<asp:CheckBox ID="cbAgree" runat="server" BorderStyle="None" />&nbsp;<asp:Label ID="Label8" runat="server" Text="I agree to the"></asp:Label>&nbsp;
                    <asp:HyperLink href="#" ID="HyperLink1" runat="server" BorderColor="#A9AEB1" >terms of service</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;
                    <asp:Label ID="lblSuccOrErr" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="btnRegis" runat="server" Text="Register" OnClick="btnRegis_Click" class="btn btn-outline-dark" />&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="False" class="btn btn-outline-dark" />
                </td>
            </tr>
        </table>
    </form>

     </div>
    </div>
  </div>
</div>

    <asp:SqlDataSource ID="sdsUserCheck" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [users] WHERE ([username] = @username)" >
            <SelectParameters>
            <asp:ControlParameter ControlID="txtEm" Name="username" PropertyName="Text" Type="String" />
        </SelectParameters>
                        
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="sdsUser" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [users] WHERE ([username] = @username)" InsertCommand="INSERT INTO [users] ([username], [password]) VALUES (@username, @password)" >
                         
        <SelectParameters>
            <asp:ControlParameter ControlID="txtEm" Name="username" PropertyName="Text" Type="String" />
        </SelectParameters>
        <InsertParameters>
            <asp:ControlParameter Name="username" Type="String" ControlId="txtEm"/>
            <asp:ControlParameter Name="password" Type="String" ControlId="txtPass1"/>
        </InsertParameters>
                       
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsRole" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"  InsertCommand="INSERT INTO [user_roles] ([user_id], [role_id]) VALUES (@user_id, @role_id)">
                       
        <InsertParameters>
            <asp:SessionParameter Name="user_id" SessionField="user_id" Type="Int32" />
            <asp:SessionParameter Name="role_id" SessionField="rol_id" Type="Int32" />
        </InsertParameters>
                       
    </asp:SqlDataSource>
                    
    <asp:SqlDataSource ID="sdsCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"  InsertCommand="INSERT INTO [customers] ([user_id], [firstname], [lastname], [address], [position_title], [email], [phone], [question_id], [question_answer]) VALUES (@user_id, @firstname, @lastname, @address, @position_title, @email, @phone, @question_id, @question_answer)" >
                       
        <InsertParameters>
            <asp:SessionParameter Name="user_id" SessionField="user_id" Type="Int32" />
            <asp:SessionParameter Name="firstname" SessionField="firstN" Type="String" />
            <asp:SessionParameter DefaultValue="" Name="lastname" SessionField="lastN" Type="String" />
            <asp:SessionParameter DefaultValue="" Name="address" SessionField="address" Type="String" />
            <asp:Parameter Name="position_title" Type="String" DefaultValue="" />
            <asp:SessionParameter DefaultValue="" Name="email" Type="String" SessionField="email" />
            <asp:Parameter Name="phone" Type="String" DefaultValue="" />
            <asp:ControlParameter ControlID="ddlQuestions" Name="question_id" ConvertEmptyStringToNull="true" PropertyName="SelectedValue" Type="Int32"/>
            <asp:SessionParameter Name="question_answer" SessionField="questionAnswer" Type="String"/>
        </InsertParameters>          
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsQuestions" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [questions]"></asp:SqlDataSource>

</body>

</html>
