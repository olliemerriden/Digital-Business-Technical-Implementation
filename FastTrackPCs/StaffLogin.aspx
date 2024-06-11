<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="StaffLogin.aspx.cs" Inherits="FastTrackPCs.StaffLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="pagestyle.css" rel="stylesheet" />
    <script src="JavaScript.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    
    <%--CREDIT: https://codepen.io/colorlib/pen/rxddKy--%>


<!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Staff Account Login</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                <li class="breadcrumb-item active text-white">Account</li>
            </ol>
        </div>
        <!-- Single Page Header End -->

    <%--PAGE DIVS--%>
<div class="login-page">
  <div class="form">
    <div class="login-form">
        <%--label for staff username--%>
        <asp:Label ID="lblStaffUsername" runat="server" Text="Username" CssClass="mb-4"></asp:Label>
        <%--rfv for staff username--%>
        <asp:RequiredFieldValidator ID="rfvStaffEmail" runat="server" ControlToValidate="txtStaffUsername" ErrorMessage="Username is required" ForeColor="Red">*</asp:RequiredFieldValidator>
      <%--txtbox for staff username--%>
        <asp:TextBox ID="txtStaffUsername" type="text" runat="server" placeholder="username" ></asp:TextBox>

        <%--label for staff password--%>
        <asp:Label ID="lblStaffPassword" runat="server" Text="Password" CssClass="mb-4"></asp:Label>
        <%--rfv for staff password--%>
        <asp:RequiredFieldValidator ID="rfvStaffPassword" runat="server" ControlToValidate="txtStaffPassword" ErrorMessage="Password is required" ForeColor="Red">*</asp:RequiredFieldValidator>
        <%--txtbox for staff password--%>
        <asp:TextBox ID="txtStaffPassword" type="password" runat="server" ToolTip='Password is protected for security purposes' placeholder="password" TextMode="Password"></asp:TextBox>
        <%--button for staff login--%>
        <asp:Button ID="btnStaffLogin" runat="server" Text="Login" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnLogin_Click" /> 
        <%--vs for staff login page--%>
        <asp:ValidationSummary ID="vsLogin" runat="server" ForeColor="Red" />
        <%--option to go to login page--%>
        <p class="message">Are you a customer? <a href="Login.aspx">Sign In</a></p>

      
        <%--attepmpst label--%>

        <asp:Label ID="lblAttempts" runat="server" Text="Please enter names - 3 attempts"></asp:Label>

    </div>
  </div>
</div>







</asp:Content>
