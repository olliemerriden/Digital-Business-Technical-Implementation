<%@ Page Title="" Language="C#" MasterPageFile="~/Backend.Master" AutoEventWireup="true" CodeBehind="AdminCustomers.aspx.cs" Inherits="FastTrackPCs.AdminCustomers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <link href="pagestyle.css" rel="stylesheet" />
    <script src="JavaScript.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <%--DIV FOR PAGES--%>

    <div class="shop-page">
        <div class="design">
            <div class="shop-design">


                <table style="width: 100%;">
                   
                    


                   <tr>
                        <td>
                            <%--label for customer ID--%>
                            <asp:Label ID="lblAdminCustomerID" runat="server" Text="ID" CssClass="mb-4"></asp:Label>
                            <%--rfv for customer ID--%>
                            <asp:RequiredFieldValidator ID="rfvAdminCustomerID" runat="server" ErrorMessage="ID is required" ForeColor="Red" ControlToValidate="ddlAdminCustomerID">*</asp:RequiredFieldValidator>


                        </td>
                        <td>

                            <%--ddl for customer ID--%>
                            <asp:DropDownList ID="ddlAdminCustomerID" runat="server" Width="400px" Height="20px" BackColor="#F2F2F2"  DataTextField="CustomerID" DataValueField="CustomerID" DataSourceID="SqlCustID" ></asp:DropDownList>

                            <%--data soruce for customer ID--%>
                            <asp:SqlDataSource ID="SqlCustID" runat="server" ConnectionString="<%$ ConnectionStrings:FastTrackdbConnectionString %>" SelectCommand="SELECT * FROM [customer]"></asp:SqlDataSource>


                        </td>
                        <td>
                            &nbsp;

                        </td>
                    </tr>





                    <tr>
                        <td>
                            <%--label for customer first name--%>
                            <asp:Label ID="lblAdminCustomerFirstname" runat="server" Text="First Name" CssClass="mb-4"></asp:Label>
                            <%--<asp:RequiredFieldValidator ID="rfvAdminCustomerFirstname" runat="server" ErrorMessage="Firstname is required" ForeColor="Red" ControlToValidate="txtAdminCustomerFirstname">*</asp:RequiredFieldValidator>--%>


                        </td>
                        <td>

                            <%--txtbox for customer first name--%>
                            <asp:TextBox ID="txtAdminCustomerFirstname" runat="server" placeholder="first name"></asp:TextBox>



                        </td>
                        <td>
                            <%--button to add customer--%>
                            <asp:Button ID="btnAddCustomer" runat="server" Text="Add Customer" BackColor="#88C40C" CssClass="form button" OnClick="btnAddCustomer_Click" />


                        </td>
                    </tr>
                    


                      <tr>
                        <td>
                            <%--label for customer last name--%>
                            <asp:Label ID="lblAdminCustomerLastname" runat="server" Text="Last Name" CssClass="mb-4"></asp:Label>
                            <%--<asp:RequiredFieldValidator ID="rfvAdminCustomerLastname" runat="server" ErrorMessage="Lastname is required" ForeColor="Red" ControlToValidate="txtAdminCustomerLastname">*</asp:RequiredFieldValidator>--%>


                        </td>
                        <td>

                            <%--txtbox for customer last name--%>
                            <asp:TextBox ID="txtAdminCustomerLastname" runat="server" placeholder="last name"></asp:TextBox>



                        </td>
                        <td>
                            <%--button to retrieve customer--%>
                            <asp:Button ID="btnRetrieveCustomer" runat="server" Text="Retrieve Customer" BackColor="#88C40C" CssClass="form button" OnClick="btnRetrieveCustomer_Click"  />


                        </td>
                    

                   <tr>
                        <td>
                            <%--label for customer email--%>
                            <asp:Label ID="lblAdminCustomerEmail" runat="server" Text="Email" CssClass="mb-4"></asp:Label>
                            <%--<asp:RequiredFieldValidator ID="rfvAdminCustomerEmail" runat="server" ErrorMessage="Email is required" ForeColor="Red" ControlToValidate="txtAdminCustomerEmail">*</asp:RequiredFieldValidator>--%>


                        </td>
                        <td>

                            <%--txtbox for customer email--%>
                            <asp:TextBox ID="txtAdminCustomerEmail" runat="server" placeholder="email" TextMode="Email"></asp:TextBox>



                        </td>
                        <td>
                            <%--button to update a customer--%>
                                                        <asp:Button ID="btnUpdateCustomer" runat="server" Text="Update Customer" BackColor="#88C40C" CssClass="form button" OnClick="btnUpdateCustomer_Click" />


                        </td>
                    </tr>


                    <tr>
                        <td>
                            <%--label for customer password--%>
                            <asp:Label ID="lblAdminCustomerPassword" runat="server" Text="Password" CssClass="mb-4"></asp:Label>

                            <%--<asp:RequiredFieldValidator ID="rfvAdminCustomerPassword" runat="server" ErrorMessage="Password is required" ForeColor="Red" ControlToValidate="txtAdminCustomerPassword">*</asp:RequiredFieldValidator>--%>


                        </td>
                        <td>

                            <%--txtbox for customer password--%>
                            <asp:TextBox ID="txtAdminCustomerPassword" runat="server" placeholder="password" TextMode="Password" ToolTip='Password is protected for security purposes'></asp:TextBox>
                                                        



                        </td>
                        
                        <td>
                            <%--button to delete customer--%>
                                                        <asp:Button ID="btnDeleteCustomer" runat="server" Text="Delete Customer" BackColor="#88C40C" CssClass="form button" OnClick="btnDeleteCustomer_Click" />


                        </td>
                    </tr>
                    

                </table>
                <%--end of table--%>









            </div>
        </div>
    </div>





</asp:Content>
