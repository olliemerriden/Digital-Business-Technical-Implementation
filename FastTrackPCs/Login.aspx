<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FastTrackPCs.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="pagestyle.css" rel="stylesheet" />
    <script src="JavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--CREDIT: https://codepen.io/colorlib/pen/rxddKy--%>


<!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Account Login</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                <li class="breadcrumb-item active text-white">Account</li>
            </ol>
        </div>
        <!-- Single Page Header End -->

    <%--View for login--%>

<asp:PlaceHolder ID="phLogin" Visible="true" runat="server">
<div class="login-page">
  <div class="form">
    <div class="login-form">

        <%--IF SIGNUP IS SUCCESSFUL--%>

<div><asp:Label ID="lblSignupMessage" runat="server"></asp:Label></div>
        
        <%--Label for login email--%>
<asp:Label ID="lblLoginEmail" runat="server" Text="Email" CssClass="mb-4"></asp:Label>
        <%--rfv for login email--%>
        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtLoginEmail" ErrorMessage="Email is required" ForeColor="Red">*</asp:RequiredFieldValidator>
        <%--txtbox for login email--%>
        <asp:TextBox ID="txtLoginEmail" type="text" runat="server" placeholder="email" ToolTip='Must be an Email'  TextMode="Email" CssClass="w-100 form-control border-0 py-3 mb-4"></asp:TextBox>
        <%--Label for login password--%>
        <asp:Label ID="lblLoginPassword" runat="server" Text="Password" CssClass="mb-4"></asp:Label>
        <%--Label for login password--%>
        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtLoginPassword" ErrorMessage="Password is required" ForeColor="Red">*</asp:RequiredFieldValidator>
        <%--txtbox for login password--%>
        <asp:TextBox ID="txtLoginPassword" type="password" runat="server" placeholder="password" ToolTip='Password is protected for security purposes' TextMode="Password" CssClass="w-100 form-control border-0 py-3 mb-4"></asp:TextBox>
      <%--login button--%>
        <asp:Button ID="btnLogin" runat="server" Text="Login" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnLogin_Click" /> 
      <%--vs for login--%>
        <asp:ValidationSummary ID="vsLogin" runat="server" ForeColor="Red" />
        <%--go to signup view--%>
        <asp:LinkButton ID="lbSignup1" runat="server" CssClass="message" OnClick="lbSignup_Click" CausesValidation="False" ForeColor="#00CC00">Not registered? Create an account</asp:LinkButton>
        <p class="message">Are you staff? <a href="StaffLogin.aspx">Sign in</a></p>
     <%-- <p class="message">Not registered? <a href="SignUp.aspx">Create an account</a></p>--%>
        
              <%--Number of attempts--%>  
        <asp:Label ID="lblAttempts" runat="server" Text="Please enter names - 3 attempts"></asp:Label>               
        
        

</div>
  </div>
</div>

   </asp:PlaceHolder> <%--end of login view--%>

    <%--Signup View--%>
    <asp:PlaceHolder ID="phSignup" Visible="false" runat="server">

        <div class="custom-page">
        <div class="layout">

            <div class="custom-layout">




                <table style="width: 100%">
                    <tr>
                        <td <%--class="auto-style12"--%>>
                            <%--Label for firstname--%>
                            <asp:Label ID="lblRegisterFirstname" runat="server" Text="First Name" CssClass="mb-4"></asp:Label>
                            <%--rfv for firstname--%>
                            <asp:RequiredFieldValidator ID="rfvCustomerFirstname" runat="server" ErrorMessage="Firstname is required" ForeColor="Red" ControlToValidate="txtCustomerFirstname">*</asp:RequiredFieldValidator>

                            <%--textbox for firstname--%>
                            <asp:TextBox ID="txtCustomerFirstname" runat="server" placeholder="first name" CssClass="w-100 form-control border-0 py-3 mb-4"></asp:TextBox>



                        </td>
                        <td>
                            <%--Label for lastname--%>
                            <asp:Label ID="lblRegisterLastname" runat="server" Text="Last Name" CssClass="mb-4"></asp:Label>
                            <%--rfv for lastname--%>
                            <asp:RequiredFieldValidator ID="rfvCustomerLastname" runat="server" ErrorMessage="Lastname is required" ForeColor="Red" ControlToValidate="txtCustomerLastname">*</asp:RequiredFieldValidator>

                              <%--textbox for lastname--%>
                            <asp:TextBox ID="txtCustomerLastname" runat="server" placeholder="last name" CssClass="w-100 form-control border-0 py-3 mb-4"></asp:TextBox>

                        </td>


                    </tr>



                    

                    <tr>


                        <td class="width:100%">
                            <%--Label for email--%>
                            <asp:Label ID="lblRegisterEmail" runat="server" ToolTip='Must be an Email' Text="Email" CssClass="mb-4"></asp:Label>
                            <%--rfv for email--%>
                            <asp:RequiredFieldValidator ID="rfvCustomerEmail" runat="server" ControlToValidate="txtCustomerEmail" ErrorMessage="Email is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                              <%--textbox for email--%>
                            <asp:TextBox ID="txtCustomerEmail" runat="server" placeholder="email address" TextMode="Email" CssClass="w-100 form-control border-0 py-3 mb-4"></asp:TextBox>
                        </td>

                    

                    </tr>

                    <tr>
                        <td <%--class="auto-style12"--%>>

                            <%--Label for password--%>
                            <asp:Label ID="lblRegisterPassword" runat="server" Text="Password" CssClass="mb-4"></asp:Label>
                            <%--rfv for password--%>
                            <asp:RequiredFieldValidator ID="rfvCustomerPassword" runat="server" ControlToValidate="txtCustomerPassword" ErrorMessage="Password is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                              <%--textbox for password--%>
                            <asp:TextBox ID="txtCustomerPassword" runat="server" placeholder="password" ToolTip='Password is protected for security purposes' TextMode="Password" CssClass="w-100 form-control border-0 py-3 mb-4"></asp:TextBox>





                        </td>

                        <td>
                            <%--Label for confirm password--%>
                            <asp:Label ID="lblRegisterConfirmPassword" runat="server" Text="Confirm Password" CssClass="mb-4"></asp:Label>
                            <%--rfv for confirm password--%>
                            <asp:RequiredFieldValidator ID="rfvCustomerConfirmPassword" runat="server" ControlToValidate="txtCustomerConfirmPassword" ErrorMessage="Confirmed Password is required" ForeColor="Red">*</asp:RequiredFieldValidator>

                            

                              <%--textbox for confirm password--%>
                            <asp:TextBox ID="txtCustomerConfirmPassword" runat="server" ToolTip='Password is protected for security purposes' placeholder="password" TextMode="Password" CssClass="w-100 form-control border-0 py-3 mb-4"></asp:TextBox>

                        </td>

                   

                    </tr>

                    <%--checks if passwords match--%>

                    <asp:CompareValidator ID="cvPassword" runat="server" ErrorMessage="Passwords don't match" ControlToCompare="txtCustomerPassword" ControlToValidate="txtCustomerConfirmPassword"  ForeColor="Red"></asp:CompareValidator>


                </table>

                <%--register button--%>
                <asp:Button ID="btnRegister" runat="server" Text="Register" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnRegister_Click" />
                <%--vs for register page--%>
                <asp:ValidationSummary ID="vsRegister" runat="server" ForeColor="Red" />

                <%--back to login view--%>

<asp:LinkButton ID="lbLoginIn" runat="server" CssClass="message" OnClick="lbLoginIn_Click" ForeColor="#88C40C" CausesValidation="False">Already registered? Sign In</asp:LinkButton>

                <%--<p class="message">Already registered? <a href="Login.aspx">Sign In</a></p>--%>


                <p class="message">Are you staff? <a href="StaffLogin.aspx">Sign In</a></p>
            </div>
        </div>
    </div>

        </asp:PlaceHolder>
                    


        
</asp:Content>
