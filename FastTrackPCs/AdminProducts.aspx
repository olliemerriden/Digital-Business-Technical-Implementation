<%@ Page Title="" Language="C#" MasterPageFile="~/Backend.Master" AutoEventWireup="true" CodeBehind="AdminProducts.aspx.cs" Inherits="FastTrackPCs.AdminProducts" %>

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

                        <td class="auto-style12">
                            
                            
                        </td>
                        <td class="auto-style15">
                            <%--BUTTON to reset page--%>
                            <asp:Button ID="btnAdminReset" runat="server" Text="Reset" BackColor="#88C40C" CssClass="form button" OnClick="btnAdminReset_Click" />

                        </td>
                        <td class="auto-style15">
                            <%--button to refresh products--%>
                            <asp:Button ID="btnAdminRefresh" runat="server" Text="Refresh" BackColor="#88C40C" CssClass="form button" OnClick="btnAdminRefresh_Click" />

                        </td>

                    </tr>
                    <tr> <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>

                    </tr>
                    <tr>

                        <td class="auto-style12">
                            <%--label for filter based on RAM--%>
                            <asp:Label ID="lblFilterRam" runat="server" Text="Filter By Ram:" CssClass="mb-4"></asp:Label>
                            <%--ddl for filter based on RAM--%>
                            <asp:DropDownList ID="ddlFilterRam" runat="server" CssClass="dropbtn">
                            </asp:DropDownList>

                        </td>
                        <td class="auto-style15">

                            <%--label for filter based on CPU--%>
                            <asp:Label ID="lblFilterCpu" runat="server" Text="Filter By Cpu:" CssClass="mb-4"></asp:Label>
                            <%--ddl for filter based on CPU--%>
                            <asp:DropDownList ID="ddlFilterCpu" runat="server" CssClass="dropbtn">
                            </asp:DropDownList>

                        </td>
                        <td class="auto-style15">
                            <%--label for filter based on Price--%>
                            <asp:Label ID="lblSortPrice" runat="server" Text="Sort By Price:" CssClass="mb-4"></asp:Label>
                            <%--ddl for filter based on Price--%>
                            <asp:DropDownList ID="ddlSortPrice" runat="server" CssClass="dropbtn">
                                <asp:ListItem>Ascending</asp:ListItem>
                                <asp:ListItem>Descending</asp:ListItem>
                            </asp:DropDownList>

                        </td>

                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>

                        <%--Gridview for products--%> 
                        <asp:GridView ID="gvProducts" runat="server" Width="100%" CssClass="table table-stripped table-bordered table-hover">

                            <EmptyDataTemplate>
                                <%--if no record--%>
                        No Records Found <%--text for no record--%>
                            </EmptyDataTemplate>


                        </asp:GridView>



                    </tr>





                </table>




                <br />






                <table style="width: 100%;">




                    <tr>
                        <td>
                            <%--label for product ID--%>
                            <asp:Label ID="lblAdminProductID" runat="server" Text="ID" CssClass="mb-4"></asp:Label>


                        </td>
                        <td>
                            <%--ddl for product ID--%>

                            <asp:DropDownList ID="ddlAdminProductID" runat="server" Height="20" Width="400"  BackColor="#F2F2F2"></asp:DropDownList>


                        </td>
                        <td>&nbsp;

                        </td>
                    </tr>





                    <tr>
                        <td>
                            <%--label for product name--%>

                            <asp:Label ID="lblAdminProductName" runat="server" Text="Product Name" CssClass="mb-4"></asp:Label>


                        </td>
                        <td>

                            <%--txtbox for product name--%>
                            <asp:TextBox ID="txtAdminProductName" runat="server" placeholder="name"></asp:TextBox>



                        </td>
                        <td>
                            <%--button to add product--%>
                            <asp:Button ID="btnAddProduct" runat="server" Text="Add Product" BackColor="#88C40C" CssClass="form button" OnClick="btnAddProduct_Click" />


                        </td>
                    </tr>



                    <tr>
                        <td>
                            <%--label for product desc--%>
                            <asp:Label ID="lblAdminProductDesc" runat="server" Text="Description" CssClass="mb-4"></asp:Label>


                        </td>
                        <td>

                            <%--txtbox for product desc--%>
                            <asp:TextBox ID="txtAdminProductDesc" runat="server" BackColor="#f2f2f2" placeholder="description"  TextMode="MultiLine" Width="190px" BorderStyle="None" Font-Size="14px" Font-Names='"Roboto", sans-serif;' CssClass="multiline"></asp:TextBox>



                        </td>
                        <td>
                            <%--button to retrieve prodiucts--%>
                            <asp:Button ID="btnRetrieveProduct" runat="server" Text="Retrieve Product" BackColor="#88C40C" CssClass="form button" OnClick="btnRetrieveProduct_Click" />


                        </td>
                    </tr>



                    <tr>
                        <td>
<%--                            <asp:CompareValidator ID="cvAdminProductPrice" runat="server" ErrorMessage="Price must be a number" ForeColor="Red" Type="Integer" ControlToValidate="txtAdminProductPrice" Operator="DataTypeCheck" Text="*"></asp:CompareValidator>--%>
                            <%--label for product price--%>
                            <asp:Label ID="lblAdminProductPrice" runat="server" Text="Price" CssClass="mb-4"></asp:Label>

                        </td>
                        <td>

                            <%--txtbox for product price--%>
                            <asp:TextBox ID="txtAdminProductPrice" runat="server" placeholder="price" TextMode="Number" ToolTip='Price must be a Number'></asp:TextBox>



                        </td>
                        <td>
                            <%--button top update product--%>
                            <asp:Button ID="btnUpdateProduct" runat="server" Text="Update Product" BackColor="#88C40C" CssClass="form button" OnClick="btnUpdateProduct_Click" />


                        </td>
                    </tr>



                    <tr>
                        <td>
                            <%--label for product cpu--%>
                            <asp:Label ID="lblAdminProductCpu" runat="server" Text="Cpu" CssClass="mb-4"></asp:Label>


                        </td>
                        <td>

                            <%--txtbox for product cpu--%>
                            <asp:TextBox ID="txtAdminProductCpu" runat="server" placeholder="cpu"></asp:TextBox>



                        </td>
                        <td>
                            <%--button to delete products--%>
                            <asp:Button ID="btnDeleteProduct" runat="server" Text="Delete Product" BackColor="#88C40C" CssClass="form button" OnClick="btnDeleteProduct_Click" />


                        </td>
                    </tr>


                    <tr>
                        <td>
                            <%--label for product ram--%>
                            <asp:Label ID="lblAdminProductRam" runat="server" Text="Ram" CssClass="mb-4"></asp:Label>


                        </td>
                        <td>

                            <%--txtbox for product ram--%>
                            <asp:TextBox ID="txtAdminProductRam" runat="server" placeholder="ram"></asp:TextBox>



                        </td>
                        <td>&nbsp;

                        </td>
                    </tr>


                    <tr>
                        <td>
                            <%--label for product graphics--%>
                            <asp:Label ID="lblAdminProductGraphics" runat="server" Text="Graphics" CssClass="mb-4"></asp:Label>


                        </td>
                        <td>

                            <%--txtbox for product grahpics--%>
                            <asp:TextBox ID="txtAdminProductGraphics" runat="server" placeholder="graphics"></asp:TextBox>



                        </td>
                        <td>&nbsp;

                        </td>
                    </tr>


                    <tr>
                        <td>
                            <%--label for product storage--%>
                            <asp:Label ID="lblAdminProductStorage" runat="server" Text="Storage" CssClass="mb-4"></asp:Label>


                        </td>
                        <td>
                            <%--txtbox for product storage--%>

                            <asp:TextBox ID="txtAdminProductStorage" runat="server" placeholder="storage"></asp:TextBox>



                        </td>
                        <td>&nbsp;

                        </td>
                    </tr>


                    <tr>
                        <td>
                            <%--label for product case--%>
                            <asp:Label ID="lblAdminProductCase" runat="server" Text="Case" CssClass="mb-4"></asp:Label>


                        </td>
                        <td>

                            <%--txtbox for product case--%>
                            <asp:TextBox ID="txtAdminProductCase" runat="server" placeholder="case"></asp:TextBox>



                        </td>
                        <td>&nbsp;

                        </td>
                    </tr>

                    <tr>
                        <td>
                            <%--label for product image--%>
                            <asp:Label ID="lblAdminProductImage" runat="server" Text="Image" CssClass="mb-4"></asp:Label>


                        </td>
                        <td>

                            <%--txtbox for product image--%>
                            <asp:TextBox ID="txtAdminProductImage" runat="server" placeholder="image"></asp:TextBox>



                        </td>
                        <td>

                        </td>
                    </tr>
                    


                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <%--vs for admin products--%>
                            <asp:ValidationSummary ID="vsAdminProducts" runat="server" ForeColor="Red" />

                        </td>
                        <td>&nbsp;</td>
                    </tr>



                
                </table>
                <%--end of table--%>


            </div>
        </div>
    </div>






</asp:Content>
