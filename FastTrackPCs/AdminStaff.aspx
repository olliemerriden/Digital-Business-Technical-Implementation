<%@ Page Title="" Language="C#" MasterPageFile="~/Backend.Master" AutoEventWireup="true" CodeBehind="AdminStaff.aspx.cs" Inherits="FastTrackPCs.AdminStaff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <link href="pagestyle.css" rel="stylesheet" />
    <script src="JavaScript.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--PAGE DIVS--%>
    <div class="shop-page">
        <div class="design">
            <div class="shop-design">


                <table style="width: 100%;">




                    <tr>
                        <td>
                            <%--label for staff ID--%>
                            <asp:Label ID="lblAdminStaffID" runat="server" Text="ID" CssClass="mb-4"></asp:Label>
                            <%--rfv for staff ID--%>
                            <asp:RequiredFieldValidator ID="rfvAdminStaffID" runat="server" ErrorMessage="ID is required" ForeColor="Red" ControlToValidate="ddlStaffID">*</asp:RequiredFieldValidator>


                        </td>
                        <td>
                            <%--ddl for staff ID--%>

                            <asp:DropDownList ID="ddlStaffID" runat="server" Width="400px" Height="20px" BackColor="#F2F2F2" DataTextField="StaffLoginID" DataValueField="StaffLoginID" DataSourceID="SqlStaffID"></asp:DropDownList>

                            <%--data soruce for staff ID--%>
                            <asp:SqlDataSource ID="SqlStaffID" runat="server" ConnectionString="<%$ ConnectionStrings:FastTrackdbConnectionString %>" SelectCommand="SELECT [StaffLoginID] FROM [stafflogin]"></asp:SqlDataSource>


                        </td>
                        <td>&nbsp;

                        </td>
                    </tr>





                    <tr>
                        <td>
                            <%--label for staff username--%>
                            <asp:Label ID="lblAdminStaffUsername" runat="server" Text="Username" CssClass="mb-4"></asp:Label>
                            <%--<asp:RequiredFieldValidator ID="rfvAdminCustomerFirstname" runat="server" ErrorMessage="Firstname is required" ForeColor="Red" ControlToValidate="txtAdminCustomerFirstname">*</asp:RequiredFieldValidator>--%>


                        </td>
                        <td>

                            <%--txtbox for staff username--%>
                            <asp:TextBox ID="txtAdminStaffUsername" runat="server" placeholder="Username"></asp:TextBox>



                        </td>
                        <td>
                            <%--button to add staff--%>
                            <asp:Button ID="btnAddStaff" runat="server" Text="Add Staff" BackColor="#88C40C" CssClass="form button" OnClick="btnAddStaff_Click" />


                        </td>
                    </tr>



                    <tr>
                        <td>
                            <%--label for staff password--%>
                            <asp:Label ID="lblAdminStaffPassword" runat="server" Text="Password" CssClass="mb-4"></asp:Label>
                            <%--<asp:RequiredFieldValidator ID="rfvAdminCustomerPassword" runat="server" ErrorMessage="Password is required" ForeColor="Red" ControlToValidate="txtAdminCustomerPassword">*</asp:RequiredFieldValidator>--%>


                        </td>
                        <td>

                            <%--txtbox for staff password--%>
                            <asp:TextBox ID="txtAdminStaffPassword" runat="server" placeholder="password"></asp:TextBox>



                        </td>

                        <td>
                            <%--button to retrieve staff--%>
                            <asp:Button ID="btnRetrieveStaff" runat="server" Text="Retrieve Staff" BackColor="#88C40C" CssClass="form button" OnClick="btnRetrieveStaff_Click" />


                        </td>


                        <tr>
                            <td>
                                <%--label for if staff is active--%>
                                <asp:Label ID="lblIsActive" runat="server" Text="IsActive" CssClass="mb-4"></asp:Label>
                            </td>
                            <td>
                                <%--checkbox for if staff is acitve--%>
                                <asp:CheckBox ID="cbStaffIsActive" runat="server" />
                            </td>
                            <td>
                                <%--button to update staff--%>
                                <asp:Button ID="btnUpdateStaff" runat="server" Text="Update Staff" BackColor="#88C40C" CssClass="form button" OnClick="btnUpdateStaff_Click" />


                            </td>
                        </tr>


                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>

                        <td>
                            <%--button to dete staff--%>
                            <asp:Button ID="btnDeleteStaff" runat="server" Text="Delete Staff" BackColor="#88C40C" CssClass="form button" OnClick="btnDeleteStaff_Click" />


                        </td>
                    </tr>


                </table>


                <%--end of table--%>







            </div>
        </div>
    </div>



</asp:Content>
