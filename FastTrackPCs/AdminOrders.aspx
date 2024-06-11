<%@ Page Title="" Language="C#" MasterPageFile="~/Backend.Master" AutoEventWireup="true" CodeBehind="AdminOrders.aspx.cs" Inherits="FastTrackPCs.AdminOrders" %>

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
                            <asp:DropDownList ID="ddlStaffID" runat="server" Width="400px" Height="20px" BackColor="#F2F2F2" DataTextField="OrderID" DataValueField="OrderID" DataSourceID="SqlOrderID"></asp:DropDownList>

                            <%--data soruce for staff ID--%>
                            <asp:SqlDataSource ID="SqlOrderID" runat="server" ConnectionString="<%$ ConnectionStrings:FastTrackdbConnectionString %>" SelectCommand="SELECT [OrderID] FROM [orderDetail]"></asp:SqlDataSource>


                        </td>
                        <td>

                            <%--button to reset page--%>
                            <asp:Button ID="btnReset" runat="server" Text="Reset" BackColor="#88C40C" CssClass="form button" Width="300px" OnClick="btnReset_Click" />

                        </td>
                        <td>
                            <%--button to refresh page--%>
                            <asp:Button ID="btnRefresh" runat="server" Text="Refresh" BackColor="#88C40C" CssClass="form button" Width="500px" OnClick="btnRefresh_Click" />

                        </td>
                    </tr>

                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>





                </table>



                <%--grid view for orders--%>
                <asp:GridView ID="gvOrder" runat="server" Width="100%" CssClass="table table-stripped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="OrderID,ProductID" DataSourceID="SqlOrders">

                    <Columns>
                        <%-- collumns for gridview --%>
                        <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" />
                        <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                        <asp:BoundField DataField="ProductType" HeaderText="ProductType" SortExpression="ProductType" />
                        <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />

                    </Columns>

                    <EmptyDataTemplate>
                        <%--if no record--%>
                        No Records Found <%--text for no record--%>
                    </EmptyDataTemplate>


                </asp:GridView>







                <%--data source for gridview--%>

                <asp:SqlDataSource ID="SqlOrders" runat="server" ConnectionString="<%$ ConnectionStrings:FastTrackdbConnectionString %>" SelectCommand="SELECT * FROM [orderDetail]"></asp:SqlDataSource>









            </div>
        </div>
    </div>





</asp:Content>
