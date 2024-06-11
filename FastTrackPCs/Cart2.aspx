<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="Cart2.aspx.cs" Inherits="FastTrackPCs.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="pagestyle.css" rel="stylesheet" />
    <script src="JavaScript.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Basket</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                <li class="breadcrumb-item active text-white">Basket</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Cart Page Start -->

   

        



<%--    <div class="shop-page">
        <div class="design">
            <div class="shop-design">--%>


<div class="container-fluid py-5">
            <div class="container py-5">





                <div class="table-responsive">
                    <table class="table">
                        <thead>
                          <tr>
                            <th scope="col">Products</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total</th>
                            <th scope="col">Handle</th>
                          </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">
                                    <div class="d-flex align-items-center">
                                        <img src="img/vegetable-item-3.png" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
                                    </div>
                                </th>
                                <td>
                                    <p class="mb-0 mt-4">Big Banana</p>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4">2.99 $</p>
                                </td>
                                <td>
                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                            <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input type="text" class="form-control form-control-sm text-center border-0" value="1">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4">2.99 $</p>
                                </td>
                                <td>
                                    <button class="btn btn-md rounded-circle bg-light border mt-4" >
                                        <i class="fa fa-times text-danger"></i>
                                    </button>
                                </td>
                            
                            </tr>
                            <tr>
                                <th scope="row">
                                    <div class="d-flex align-items-center">
                                        <img src="img/vegetable-item-5.jpg" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="" alt="">
                                    </div>
                                </th>
                                <td>
                                    <p class="mb-0 mt-4">Potatoes</p>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4">2.99 $</p>
                                </td>
                                <td>
                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                            <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input type="text" class="form-control form-control-sm text-center border-0" value="1">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4">2.99 $</p>
                                </td>
                                <td>
                                    <button class="btn btn-md rounded-circle bg-light border mt-4" >
                                        <i class="fa fa-times text-danger"></i>
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">
                                    <div class="d-flex align-items-center">
                                        <img src="img/vegetable-item-2.jpg" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="" alt="">
                                    </div>
                                </th>
                                <td>
                                    <p class="mb-0 mt-4">Awesome Brocoli</p>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4">2.99 $</p>
                                </td>
                                <td>
                                    <div class="input-group quantity mt-4" style="width: 100px;">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-minus rounded-circle bg-light border" >
                                            <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input type="text" class="form-control form-control-sm text-center border-0" value="1">
                                        <div class="input-group-btn">
                                            <button class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <p class="mb-0 mt-4">2.99 $</p>
                                </td>
                                <td>
                                    <button class="btn btn-md rounded-circle bg-light border mt-4" >
                                        <i class="fa fa-times text-danger"></i>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

               <%-- End of cart items--%>






                <div class="mt-5">
                    <asp:TextBox ID="txtDiscount" type="text" runat="server" placeholder="Discount Code"></asp:TextBox>

                    <asp:Button ID="btnApplyDiscount" runat="server" type="button" Text="Apply Discount" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" />
                </div>
                <div class="row g-4 justify-content-end">
                    <div class="col-8"></div>



                    <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                        <div class="bg-light rounded">
                            <div class="p-4">
                                <h1 class="display-6 mb-4">Basket <span class="fw-normal">Total</span></h1>
                                <div class="d-flex justify-content-between mb-4">
                                    
                                    <asp:Label ID="lblCartSubtotal" runat="server" Text="Subtotal:" CssClass="mb-4" Font-Size="Larger" Font-Bold="True"></asp:Label>

                                    <asp:Label ID="lblCartSubtotalValue" runat="server" Text="£96.00" CssClass="mb-4"></asp:Label>
                                </div>
                                <div class="d-flex justify-content-between">

                                <asp:Label ID="lblCartShipping" runat="server" Text="Shipping:" CssClass="mb-4" Font-Size="Larger" Font-Bold="True"></asp:Label>

                                    <div class="">

                                       <asp:Label ID="lblShippingValue" runat="server" Text="£3.00" CssClass="mb-4"></asp:Label>

                                    </div>
                                </div>
                                
                            <div class="d-flex justify-content-between mb-4">
                            

                                <asp:Label ID="lblCartTotal" runat="server" Text="Total:" CssClass="mb-4" Font-Size="X-Large" Font-Bold="True" Font-Underline="True"></asp:Label>
                                
                                

                                <asp:Label ID="lblCartTotalValue" runat="server" Text="£99.00" CssClass="mb-4" Font-Bold="True" Font-Size="Medium"></asp:Label>


</div>

                            </div>
                            

                            <asp:Button ID="btnProceedToCheckout" runat="server" Text="Proceed to Checkout" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnProceedToCheckout_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart Page End -->


</div>
        </div>
    
    
            </div>


</asp:Content>
