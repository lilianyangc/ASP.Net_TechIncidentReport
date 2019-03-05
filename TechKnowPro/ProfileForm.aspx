<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfileForm.aspx.cs" Inherits="TechKnowPro.ProfileForm" %>

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
        .auto-style3 {
            width: 194px;
        }
        .auto-style4 {
            width: 194px;
            height: 6px;
        }
        .auto-style5 {
            height: 6px;
        }
        .auto-style6 {
            width: 194px;
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table class="w-100">
                <tr>
                    <td> <h1 class="myH1">
            TechKnow Pro - Incident Report Management Software</h1></td>
                    <td>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" class="btn btn-outline-warning" />
                    </td>
                </tr>
            </table>
    <br />
            <hr class="myHr">
        <table class="auto-style1 homebg">
            <tr>
                <td class="auto-style3">
                   
                    &nbsp;</td>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3"> <h3><strong><asp:Label ID="Label2" runat="server" Text=" My Account Profile"></asp:Label></strong></h3></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
                <td class="auto-style7"></td>
            </tr>
            <tr>
                <td class="auto-style3">
                   <h4> <asp:Label ID="Label3" runat="server" Text="User Information"></asp:Label></h4>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label4" runat="server" Text="*Username:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUser" runat="server" Width="230px" TextMode="Email" CssClass="textbox2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUser" Display="Dynamic" ErrorMessage="Email is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label5" runat="server" Text="*Password:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" Width="230px" CssClass="textbox2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPass" Display="Dynamic" ErrorMessage="Email is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3"> <h3><asp:Label ID="Label6" runat="server" Text="Contact Information"></asp:Label></h3></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3"> <asp:Label ID="Label7" runat="server" Text="*First Name:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtFirstN" runat="server" Width="230px" CssClass="textbox2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtFirstN" Display="Dynamic" ErrorMessage="First Name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"> <asp:Label ID="Label8" runat="server" Text="*Last Name:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtLastN" runat="server" Width="230px" CssClass="textbox2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtLastN" Display="Dynamic" ErrorMessage="Last Name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4"> <asp:Label ID="Label9" runat="server" Text="Position / Title:"></asp:Label></td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtPos" runat="server" Width="230px" CssClass="textbox2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"> <asp:Label ID="Label10" runat="server" Text="*Secret Question"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="ddlQuest" runat="server" Height="30px" Width="230px" DataSourceID="sdsQuestion" DataTextField="description" DataValueField="question_id" CssClass="textbox2">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlQuest" Display="Dynamic" ErrorMessage="Select a value" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"> <asp:Label ID="Label12" runat="server" Text="*Secret Answer:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtAnswer" runat="server" Width="230px" CssClass="textbox2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtAnswer" Display="Dynamic" ErrorMessage="Secret Answer is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"> <asp:Label ID="Label13" runat="server" Text="*Email:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="230px" TextMode="Email" CssClass="textbox2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Email and Username should be the same" ControlToCompare="txtEmail" ControlToValidate="txtUser" ForeColor="Red">*</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"> <asp:Label ID="Label14" runat="server" Text="Address:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" Width="230px" CssClass="textbox2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"> <asp:Label ID="Label15" runat="server" Text="Phone:"></asp:Label></td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server" Width="230px" CssClass="textbox2"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="btnLogin" runat="server" Text="Update Profile" Width="128px" OnClick="btnLogin_Click" class="btn btn-outline-dark" style="margin-top:10px;" />
                </td>
                <td>
                    <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back"  class="btn btn-outline-dark" Width="128px"  style="margin-top:10px;"  />
                    <asp:Label ID="lblSucc" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </form>
        <asp:SqlDataSource ID="sdsCustomer" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" UpdateCommand="UPDATE [customers] SET [firstname] = @firstname, [lastname] = @lastname, [address] = @address, [position_title] = @position_title, [email] = @email, [phone] = @phone, [question_id] = @question_id, [question_answer] = @question_answer WHERE [user_id] = @user_id">                  
            <UpdateParameters>
                <asp:ControlParameter ControlID="txtFirstN" Name="firstname" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtLastN" Name="lastname" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtAddress" Name="address" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtPos" Name="position_title" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" Type="String" />
                <asp:ControlParameter Name="phone" Type="String" ControlID="txtPhone" PropertyName="Text" />
                <asp:SessionParameter Name="question_id" SessionField="QId" Type="Int32" />
                <asp:ControlParameter ControlID="txtAnswer" Name="question_answer" PropertyName="Text" Type="String" />
                <asp:SessionParameter Name="user_id" SessionField="UsId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsUser" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"  UpdateCommand="UPDATE [users] SET [username] = @username, [password] = @password WHERE [user_id] = @user_id">       
            <UpdateParameters>
                <asp:ControlParameter ControlID="txtUser" Name="username" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="txtPass" Name="password" PropertyName="Text" Type="String" />
                <asp:SessionParameter Name="user_id" SessionField="UsId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsQuestion" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [questions] WHERE ([description] IS NOT NULL) ORDER BY [question_id]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsRetPassw" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [users] WHERE ([user_id] = @user_id)">
            <SelectParameters>
                <asp:SessionParameter Name="user_id" SessionField="UsId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsCustomerInformation" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [customer_id], [user_id], CONCAT([firstname],' ',[lastname]) AS fullname, [firstname], [lastname], [address], [email], [phone], [position_title], [question_id], [question_answer] FROM [customers] ORDER BY [customer_id]">
        </asp:SqlDataSource>
</body>
     <br />
    <div class="td">
    <hr class="myHr">
    @2019 - COMP2139 - Techknow Pro

    </div>
</html>
