<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="TechKnowPro.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TechKnowPro</title>
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
     <link rel="stylesheet" type="text/css" href="CSS_Ext/Registration.css" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    
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
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Width="717px" ForeColor="Red" ValidationGroup="vg" />
            <asp:Label ID="lblSuccOrErr" runat="server" ForeColor="#CC0000"></asp:Label>            
            </div>
        
        <table class="auto-style22 homebg">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" Text="Firstname: "></asp:Label>
                    <asp:TextBox ID="txtFN" runat="server" Width="143px" class="textbox"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="rvAlphabetOnly" ControlToValidate="txtFN" runat="server" ErrorMessage="Enter alphabets only <br /> and do not leave space after firstname" ValidationExpression="^[a-zA-Z]+(\s[a-zA-Z]+)?$" ForeColor="Red" ValidationGroup="vg">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFN" Display="Dynamic" ErrorMessage="First Name is required" ForeColor="Red" ValidationGroup="vg">*</asp:RequiredFieldValidator>

                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Lastname: "></asp:Label>
                    <asp:TextBox ID="txtLN" runat="server" Width="164px" class="textbox"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtLN" runat="server" ErrorMessage="Enter alphabets only <br /> and do not leave space after lastname" ValidationExpression="^[a-zA-Z]+(\s[a-zA-Z]+)?$" ForeColor="Red" ValidationGroup="vg">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLN" Display="Dynamic" ErrorMessage="Last Name is required" ForeColor="Red" ValidationGroup="vg">*</asp:RequiredFieldValidator>
                </td>
            </tr>
                </table>
                <table class="auto-style22">
                    <td class="auto-style26">
                        &nbsp;Address:</td>
                    <td>
                        <asp:TextBox ID="txtAddr" runat="server" Width="409px" style="margin-left: 10px" class="textbox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddr" Display="Dynamic" ErrorMessage="Address is required" ForeColor="Red" ValidationGroup="vg">*</asp:RequiredFieldValidator>
                    </td>
                </table>
          
            <table class="auto-style22">
                <tr>
                <td class="auto-style25">
                    <asp:Label ID="Label5" runat="server" Text="Email: "></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtEm" runat="server" Width="253px" CssClass="textbox" TextMode="Email" style="margin-left: 54" class="textbox" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEm" Display="Dynamic" ErrorMessage="Email is required" ForeColor="Red" ValidationGroup="vg">*</asp:RequiredFieldValidator>
                </td>
                    
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:Label ID="Label6" runat="server" Text="Password: "></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPass1" runat="server" Width="253px" MaxLength="12" TextMode="Password" class="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPass1" Display="Dynamic" ErrorMessage="Password required" ForeColor="Red" ValidationGroup="vg">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="User must enter the same password" ControlToCompare="txtPass1" ControlToValidate="txtPass2" ForeColor="Red" ValidationGroup="vg">*</asp:CompareValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPass1" ErrorMessage="Password length must be from 6 - 12 characters!" ForeColor="Red" ValidationExpression="^.{6,12}$" ValidationGroup="vg">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:Label ID="Label7" runat="server" Text="Confirm Password: "></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPass2" runat="server" Width="253px" MaxLength="12" TextMode="Password" class="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPass2" Display="Dynamic" ErrorMessage="Confirmation Password required" ForeColor="Red" ValidationGroup="vg">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:Label ID="Label4" runat="server" Text="Security Question: "></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="ddlQuestions" runat="server" DataSourceID="sdsQuestions" DataTextField="description" DataValueField="question_id" Width="253px" CssClass="textbox" Height="27px"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    <asp:Label ID="Label9" runat="server" Text="Security Answer: "></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtQuestionAnswer" runat="server" Width="253px" MaxLength="12" class="textbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtQuestionAnswer" ErrorMessage="Please enter a security answer!" ForeColor="Red" ValidationGroup="vg">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style25">
                    &nbsp;</td>
                <td class="auto-style2">
                   &nbsp;<asp:CheckBox ID="cbAgree" runat="server" BorderStyle="None" />&nbsp;<asp:Label ID="Label8" runat="server" Text="I agree to the"></asp:Label>&nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" BorderColor="#A9AEB1" OnClick="LinkButton1_Click" CausesValidation="False">terms of service</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;
                                    </td>
            </tr>
            <tr>
                <td class="auto-style23">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Button ID="btnRegis" runat="server" Text="Register" OnClick="btnRegis_Click" class="btn btn-outline-dark" ValidationGroup="vg" />&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="False" class="btn btn-outline-dark" />
                    <asp:ScriptManager runat="server"></asp:ScriptManager>
                </td>
            </tr>
        </table>
<%--Modal--%>
                <div class="modal fade" id="termsModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Terms & Conditions</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <div>
                            <p style="-webkit-tap-highlight-color: transparent; letter-spacing: 0.2px; line-height: 24px; padding-top: 20px; margin: 0px 0px 10px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">
                                <h1 class="auto-style1">Terms of Services</h1></p>
                            <p style="-webkit-tap-highlight-color: transparent; letter-spacing: 0.2px; line-height: 24px; padding-top: 20px; margin: 0px 0px 10px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">
                                <font style="-webkit-tap-highlight-color: transparent; vertical-align: inherit;">You must comply with the rules applicable to the Services you use.</font></p>
                            <p style="-webkit-tap-highlight-color: transparent; letter-spacing: 0.2px; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">
                                <font style="-webkit-tap-highlight-color: transparent; vertical-align: inherit;">Do not use our Services improperly.<span>&nbsp;</span>For example, do not attempt to interfere with or access our Services using any method other than the interface and instructions that we make available to you.<span>&nbsp;</span>You must only use our Services in compliance with applicable laws, including applicable laws and regulations regarding export control and re-exports.<span>&nbsp;</span>We may suspend or terminate the provision of our Services if you fail to comply with any applicable terms or regulations, or if we investigate a suspicion of misuse.</font></p>
                            <p style="-webkit-tap-highlight-color: transparent; letter-spacing: 0.2px; line-height: 24px; padding-top: 20px; margin: 10px 0px; color: rgba(0, 0, 0, 0.87); font-family: Roboto, arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">
                                <font style="-webkit-tap-highlight-color: transparent; vertical-align: inherit;">The use of our Services does not give you any intellectual property rights over our Services or the content you access.<span>&nbsp;</span>You may not use any content obtained through our Services without the permission of the owner of such content, unless permitted by law.<span>&nbsp;</span>These Terms of Use do not give you the right to use any brand or logo in our Services.<span>&nbsp;</span>You may not delete, obscure or modify the legal notices displayed in or with our Services.</font></p>
                        </div>
                      </div>
                      <div class="modal-footer">
                          <asp:Button ID="btnBack" runat="server" Text="Back" class="btn btn-primary" OnClick="btnBack_Click" CausesValidation="False"/>
                      </div>
                    </div>
                  </div>
                </div>
<%--End of Modal--%>
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
            <asp:SessionParameter Name="password" SessionField="password" Type="String" />
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
