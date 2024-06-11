<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="FastTrackPCs.Shop"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="pagestyle.css" rel="stylesheet" />
    <script src="JavaScript.js"></script>

    <%--<style type="text/css">
        .auto-style11 {
            height: 57px;
        }
        .auto-style15 {
            width: 256px;
        }
        .auto-style16 {
            width: 255px;
        }
        .auto-style30 {
            height: 57px;
            width: 4064px;
        }
    </style>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    

    <!-- Single Page Header start -->
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6">Shop</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
            <li class="breadcrumb-item active text-white">Shop</li>
        </ol>
    </div>
    <!-- Single Page Header End -->


    <div class="shop-page">
        <div class="design">
            <div class="shop-design">

                <%--hf for product ID--%>
                <asp:HiddenField ID="hfProductID" runat="server" />

               <%--multiview--%>
                <asp:MultiView ID="mvShopPage" runat="server" ActiveViewIndex="0">


                    <%--shop view--%>
                    <asp:View ID="vShop" runat="server">

                        

                        <table style="width: 100%;">
                            <tr>

                                <td> 

                                    <%--txtbox for search--%> 
                                    <asp:TextBox ID="txtSearch" runat="server"  CssClass="w-100 form-control border-0 py-3 mb-4 " placeholder="enter product name or desc" ></asp:TextBox>
                                    <%--button to search--%>
                                    <asp:Button ID="btnSearch" runat="server" BackColor="#88C40C" Text="Search by Name" OnClick="btnSearch_Click" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" Width="500px" />


                                </td>
                                <td>
                                    <%--button to reset screen--%>
                                    <asp:Button ID="btnReset" runat="server" Text="Reset" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnReset_Click"  Width="300px" />

                                </td>
                                <td>
                                    <%--button to refresh screen--%>
                                    <asp:Button ID="btnRefresh" runat="server" Text="Search by Names and Filters" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnRefresh_Click" Width="500px" />

                                </td>

                            </tr>

                            <tr>

                                <td>
                                    <%--label for ram filter--%>
                                    <asp:Label ID="lblFilterRam" runat="server" Text="Filter By Ram:" CssClass="mb-4"></asp:Label>
                                    <%--ddl for ram filter--%>
                                    <asp:DropDownList ID="ddlFilterRam" runat="server" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnSelectedIndexChanged="ddlFilterRam_SelectedIndexChanged">
                                    </asp:DropDownList>

                                </td>
                                <td>

                                    <%--label for cpu filter--%>
                                    <asp:Label ID="lblFilterCpu" runat="server" Text="Filter By Cpu:" CssClass="mb-4"></asp:Label>
                                    <%--ddl for cpu filter--%>
                                    <asp:DropDownList ID="ddlFilterCpu" runat="server" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100">
                                    </asp:DropDownList>

                                </td>
                                <td>
                                    <%--lbl for price filter--%>
                                    <asp:Label ID="lblSortPrice" runat="server" Text="Sort By Price:" CssClass="mb-4"></asp:Label>
                                    <%--ddl for price sort--%>
                                    <asp:DropDownList ID="ddlSortPrice" runat="server" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100">
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
                                
                                <%--DATA LIST FOR PRODUCTS--%>

                                <asp:DataList ID="dlProducts" runat="server" DataKeyField="ProductID" CellPadding="60" RepeatDirection="Horizontal" RepeatColumns="3" ItemStyle-HorizontalAlign="Center" HorizontalAlign="Center" CellSpacing="700" BorderStyle="Double" BorderColor="#88C40C" BorderWidth="10px" CssClass="border rounded" OnItemCommand="dlProducts_ItemCommand"  >
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        
                                        <%--NAME OF PRODUCT--%>
                                        <asp:Label Text='<%# Eval("ComputerName") %>' runat="server" ID="ComputerNameLabel" Font-Bold="True" Font-Underline="True" Font-Size="X-Large" /><br />
                                        <%--IMAGE--%>
                                        <asp:Image ID="imgProducts" runat="server" CssClass="rounded float-left" Height="300px" ImageUrl='<%# Eval("ComputerImage", "img/{0}") %>' Width="300px" />
                                        <br />


                                    <%--PRICE--%>
                                    £<asp:Label Text='<%# Eval("ComputerPrice") %>' runat="server" ID="ComputerPriceLabel" Font-Bold="True" Font-Underline="True" Font-Size="Larger" /><br />
                                        <br />
                                        <%--IN STOCK--%>
                                        <asp:Label ID="lblInStock" runat="server"  Text="In Stock" ForeColor="#88C40C"></asp:Label>
                                        <br />
                                        <%--DESC--%>
                                        <asp:Label Text='<%# Eval("ComputerDesc") %>' runat="server" ID="ComputerDescLabel" />
                                        <br />

                                        <br />
                                        <%--VIEW DETIALS BUTTON--%>
                                        <asp:Button ID="btnViewDetails" runat="server" Text="View Details" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" CommandArgument='<%#Eval("ProductID")%>' CommandName="ProductID" OnClick="btnViewDetails_Click" CausesValidation="False" />

                                        <br />

                                        
                                    </ItemTemplate>

                                    <%--DATA SOURCE--%>
                                </asp:DataList><asp:SqlDataSource runat="server" ID="dsProducts" ConnectionString="<%$ ConnectionStrings:FastTrackdbConnectionString %>" SelectCommand="SELECT * FROM [products]"></asp:SqlDataSource>

                            </tr>

                        </table>




                    </asp:View> <%--END OF SHOP VIEW--%>








                    <%--VIEW DETAILS VIEW--%>
                    <asp:View ID="vProductDetails" runat="server">





                        <table style="width: 100%;">
                            <tr>
                                <td class="auto-style16">
                                    <%--CHOSEN PRODUCT NAME--%>
                                    <asp:Label ID="lblProductName" runat="server" CssClass="mb-4"></asp:Label>
                                    <%--CHOSEN PRODUCT DESC--%>
                                    <asp:Label ID="lblProductDesc" runat="server" Font-Italic="True" ForeColor="#88C40C" CssClass="mb-4"></asp:Label>
                                </td>
                                <td rowspan="4">
                                    <%--PRODUCT IMAGE--%>
                                    <asp:Image ID="imgDetails" runat="server" Height="400px" Width="400px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">
                                    <%--PRICE OF PRODUCT--%>
                                    <asp:Label ID="lblTextForUnitPrice" runat="server" CssClass="mb-4" Text="Price per Unit: £"></asp:Label>
                        <asp:Label ID="lblUnitPrice" runat="server"></asp:Label>
                                    <br />
                                    <%--NEW PRICE--%>
                                <asp:Label ID="lblForTotalAmount" runat="server" CssClass="mb-4" Text="Total Amount: £"></asp:Label>

                        <asp:Label ID="lblTotalAmount" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">
                                    <%--PRODUCT NEW PRICE--%>
                                <asp:Label ID="lblForQuantity" runat="server" CssClass="mb-4" Text="Quantity"></asp:Label>

                                    <asp:TextBox ID="txtQuantity" runat="server" Width="81px" CssClass="btn dropdown-toggle border border-dark rounded" BackColor="#F2F2F2" ></asp:TextBox>
                                    <%--CHECKS IF NUMBER--%>
                            <asp:CompareValidator ID="cvQuantity" runat="server" ErrorMessage="Quantity must be a number" ForeColor="Red" Type="Integer" ControlToValidate="txtQuantity" Operator="DataTypeCheck" Text="*"></asp:CompareValidator>

                                    <%--BUTTON TO CALCULATE NEW VALUE--%>
                                    <asp:Button ID="btnCalculate" runat="server" Text="Recalculate" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnCalculate_Click"  />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style16">
                                    <%--ADD TO BASKET AND CHECKOUT BUTTONS--%>
                                    <asp:Button ID="btnAddToBasket" runat="server" Text=" Add to basket" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnAddToBasket_Click"  />
                                    <asp:Button ID="btnCheckOut" runat="server" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" Text="Checkout" OnClick="btnCheckOut_Click" />
                                </td>
                            </tr>
                        </table>
                        <%--BACK TO SHOP BUTTON--%>
                        <asp:LinkButton ID="lbGoToCatalogue" runat="server"  OnClick="lbGoToCatalogue_Click" >Go back to Shop</asp:LinkButton>

                        <%--VS SUMMARY FOR PRODUCT PAGE--%>
                        <asp:ValidationSummary ID="vsProductDetails" runat="server" ForeColor="Red" />
                        <br />
                        <%--label for basket validation--%>
                        <asp:Label ID="lblBasketCheck" runat="server" CssClass="mb-4" Font-Bold="True" Font-Size="Larger" ForeColor="Red"> </asp:Label>

                    </asp:View> <%--END OF VIEW DETAILS VIEW--%>






                </asp:MultiView>




            </div>

        </div>
    </div>






</asp:Content>
