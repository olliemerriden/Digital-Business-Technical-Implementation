<%@ Page Title="" Language="C#" MasterPageFile="~/Backend.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="FastTrackPCs.AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



        <link href="pagestyle.css" rel="stylesheet" />
    <script src="JavaScript.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    <%--PAGE DIVS--%>
    <div class="custom-page">
        <div class="layout">

            <div class="custom-layout">

                <table style="width: 100%;">
                    <tr>
                        <td>
                            <%--button to go to orders page--%>
                            <asp:Button ID="btnAdminOrders" runat="server" Text="Orders" BackColor="#88C40C" CssClass="form button" Height="150px" Width="200px" OnClick="btnAdminOrders_Click" />

                        </td>
                        <td>
                              <%--button to go to products page--%>
                            <asp:Button ID="btnAdminProducts" runat="server" Text="Products" BackColor="#88C40C" CssClass="form button" Height="150px" Width="200px" OnClick="btnAdminProducts_Click" />

                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                              <%--button to go to customers page--%>
                            <asp:Button ID="btnAdminCsustomers" runat="server" Text="Customers" BackColor="#88C40C" CssClass="form button" Height="150px" Width="200px" OnClick="btnAdminCsustomers_Click" />


                        </td>
                        <td>
                              <%--button to go to staff page--%>
                <asp:Button ID="btnAdminStaff" runat="server" Text="Staff" BackColor="#88C40C" CssClass="form button" Height="150px" Width="200px" OnClick="btnAdminStaff_Click"/>

                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    
                </table>
                <%--end of table--%>


            </div>
        </div>
    </div>


</asp:Content>
