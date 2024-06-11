<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="FastTrackPCs.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="pagestyle.css" rel="stylesheet" />
    <script src="JavaScript.js"></script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- Single Page Header start -->
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6">Basket</h1>
        <%--HEader TExt--%>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
            <%--Breadcrumb Text--%>
            <li class="breadcrumb-item active text-white">Basket</li>
            <%--Breadcrumb Text--%>
        </ol>
    </div>
    <!-- Single Page Header End -->


    <!-- Cart Page Start -->





    <%--DIVS FOR PAGE SETUP--%>

    <div class="shop-page">
        <div class="design">
            <div class="shop-design">
                <%--Multiview--%>
                <asp:MultiView ID="mvCart" runat="server">
                    <%--View for BAsket Sumary--%>
                    <asp:View ID="vSummary" runat="server">


                        <%--If user has logged in display this message--%>
                        <div>
                            <asp:Label ID="lblLoginMessage" runat="server"></asp:Label>
                        </div>

                        <table style="width: 100%">
                            <tr>



                                <td>
                                    <%--GV for products in basket--%>
                                    <asp:GridView ID="gvSummary" runat="server" Width="21%" Height="16px" CssClass="table table-stripped table-bordered table-hover" AutoGenerateColumns="False" OnRowCommand="gvSummary_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="ProductID" HeaderText="Product ID" />
                                            <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                                            <asp:BoundField DataField="ProductPrice" HeaderText="Unit Price" />
                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                            <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                            <asp:ButtonField CommandName="UpdateProduct" HeaderText="Update" Text="Update" />
                                            <asp:ButtonField CommandName="RemoveProduct" HeaderText="Remove" Text="Remove" />
                                        </Columns>
                                    </asp:GridView>

                                </td>

                                <td>

                                    <%--Basket Summary--%>



                                    <div class="bg-light rounded">
                                        <div class="p-4">
                                            <h1 class="display-6 mb-4">Basket <span class="fw-normal">Total</span></h1>
                                            <%--Basket Total Text--%>
                                            <div class="d-flex justify-content-between mb-4">

                                                <asp:Label ID="lblProductSummaryCountText" runat="server" Text="Types of Products:" CssClass="mb-4" Font-Size="Larger" Font-Bold="True"></asp:Label>
                                                <%--Product Count Text--%>

                                                <asp:Label ID="lblProductSummaryCount" runat="server" Text="" CssClass="mb-4"></asp:Label>
                                                <%--Product Count--%>


                                                <asp:Label ID="lblSummaryAmountText" runat="server" Text="Subtotal (£):" CssClass="mb-4" Font-Size="Larger" Font-Bold="True"></asp:Label>
                                                <%--Product Amount Text--%>

                                                <asp:Label ID="lblSummaryAmount" runat="server" Text="" CssClass="mb-4"></asp:Label>
                                                <%--Product Ammount--%>
                                            </div>
                                            <div class="d-flex justify-content-between">

                                                <asp:Label ID="lblCartShipping" runat="server" Text="Shipping (£):" CssClass="mb-4" Font-Size="Larger" Font-Bold="True"></asp:Label>
                                                <%--Product Shippung Text--%>

                                                <div class="">

                                                    <asp:Label ID="lblShippingValue" runat="server" Text="FREE" CssClass="mb-4"></asp:Label>
                                                    <%--Product Shipping Value--%>
                                                </div>
                                            </div>




                                            <div class="d-flex justify-content-between mb-4">


                                                <asp:Label ID="lblCartTotal" runat="server" Text="Total (£):" CssClass="mb-4" Font-Size="X-Large" Font-Bold="True" Font-Underline="True"></asp:Label>
                                                <%--Cart Total Text--%>



                                                <asp:Label ID="lblCartTotalValue" runat="server" Text="£99.00" CssClass="mb-4" Font-Bold="True" Font-Size="Medium"></asp:Label>
                                                <%--Cart total ammmount--%>
                                            </div>

                                        </div>


                                        <%--Checkout button--%>
                                        <asp:Button ID="btnProceedToCheckout" runat="server" Text="Proceed to Checkout" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnProceedToCheckout_Click" />



                                    </div>



                                    <%--</div>--%>

                                    <%--Login first label--%>
                                    <asp:Label ID="lblLoggedInCheck" runat="server" CssClass="mb-4" Font-Bold="True" Font-Size="Larger" ForeColor="Red"> </asp:Label>






                                </td>

                            </tr>


                            <tr>



                                <%--Gridview for customisation--%>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" DataSourceID="sqlCustomisation"></asp:GridView>
                                    <asp:SqlDataSource ID="sqlCustomisation" runat="server"></asp:SqlDataSource>
                                </td>
















                            </tr>

                        </table>






                    </asp:View>

                    <%--View for updating products--%>
                    <asp:View ID="vUpdate" runat="server">
                        <%--Stores row based on ID--%>
                        <asp:HiddenField ID="hfRowIndex" runat="server" />

                        <table style="width: 100%;">
                            <tr>
                                <td>Product ID</td>
                                <td>
                                    <asp:Label ID="lblUpdateProductID" runat="server" Text=""></asp:Label>
                                    <%--Labels for selcted product ID--%>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Product Name</td>
                                <td>
                                    <asp:Label ID="lblUpdateProductName" runat="server" Text=""></asp:Label>
                                    <%--Labels for selcted product name--%>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Unit Price</td>
                                <td>
                                    <asp:Label ID="lblUpdateUnitPrice" runat="server" Text=""></asp:Label>
                                    <%--Labels for selcted product price--%>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>Quantity</td>
                                <td>
                                    <%--Change product quantity--%>
                                    <asp:TextBox ID="txtbUpdateQuantity" runat="server" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" TextMode="Number" Width="10%"></asp:TextBox>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>New Price (£)</td>


                                <td>
                                    <asp:Label ID="lblNewAmount" runat="server" Font-Bold="True" Font-Underline="True"></asp:Label>
                                    <%--Labels for selcted product new price--%>
                                </td>


                            </tr>
                            <tr>
                                <td>
                                    <%--Recaulate button--%>
                                    <asp:Button ID="btnSummaryRecalcuate" runat="server" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" Text="Recalculate" OnClick="btnSummaryRecalcuate_Click" />
                                </td>
                                <td>
                                    <%--Update Basket--%>
                                    <asp:Button ID="btnSummaryUpdateBasket" runat="server" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" Text="Update Basket" OnClick="btnSummaryUpdateBasket_Click" />
                                </td>


                            </tr>
                        </table>


                    </asp:View>
                    <%--View for Card info--%>
                    <asp:View ID="vCard" runat="server">

                        <!-- Checkout Page Start -->
                        <div class="container-fluid py-5">
                            <div class="container py-5">
                                <h1 class="mb-4">Card details</h1>
                                <%--Card Details Text--%>
                                <div>






                                    <div class="row">
                                        <%--<div class="col-md-12 col-lg-6">--%>
                                        <div class="form-item">

                                            <asp:Label ID="lblCardType" runat="server" Text="Card Type" CssClass="mb-4"></asp:Label>
                                            <%--Label for card type--%>
                                            <asp:RequiredFieldValidator ID="rfvCardType" runat="server" ErrorMessage="Card Type is required" ForeColor="Red" ControlToValidate="ddlCardType" ValidationGroup="CreditCard">*</asp:RequiredFieldValidator>
                                            <%--rfv for card type--%>
                                            <asp:DropDownList ID="ddlCardType" runat="server" placeholder="card type" CssClass="form-control" ValidationGroup="CreditCard">
                                                <%--ddl for card type--%>
                                                <asp:ListItem>American Express</asp:ListItem>
                                                <%--list items for card type--%>
                                                <asp:ListItem>Discover</asp:ListItem>
                                                <asp:ListItem>Master Card</asp:ListItem>
                                                <asp:ListItem>Visa</asp:ListItem>
                                            </asp:DropDownList>



                                        </div>
                                        <%--</div>--%>
                                        <div class="form-item">


                                            <asp:Label ID="lblCardNumber" runat="server" Text="Card Number" CssClass="mb-4"></asp:Label>
                                            <%--Label for card number--%>
                                            <%--                                            <asp:RequiredFieldValidator ID="rfvCardNumber" runat="server" ErrorMessage="Card Number is required" ForeColor="Red" ControlToValidate="txtCardNumber" ValidationGroup="CreditCard">*</asp:RequiredFieldValidator>--%>

                                            <%--                                            <asp:CustomValidator ID="cvCardNumber1" runat="server" ErrorMessage="Card number is not valid" ForeColor="Red" ValidationGroup="CreditCard" OnServerValidate="cvCardNumber_ServerValidate" >*</asp:CustomValidator>--%>
                                            <%--CV for card number--%>
                                            <asp:CustomValidator ID="cvCardNumber" runat="server" ErrorMessage="Card number is not valid" ForeColor="Red" ControlToValidate="txtCardNumber"  OnServerValidate="cvCardNumber_ServerValidate" ValidationGroup="CreditCard">*</asp:CustomValidator>
                                            <%--txtbox for card number--%>
                                            <asp:TextBox ID="txtCardNumber" type="number"  runat="server" placeholder="card number" CssClass="form-control" ValidationGroup="CreditCard"  TextMode="Number" ToolTip="Must be a 16 digit number"></asp:TextBox>


                                        </div>


                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 col-lg-6">
                                            <div class="form-item w-100">

                                                <%--Label for card month--%>
                                                <asp:Label ID="lblExpiryDate" runat="server" Text="Expiry Month" CssClass="mb-4"></asp:Label>
                                                <%--cv for card month--%>
                                                <asp:CustomValidator ID="cvExpiryDate" runat="server" ErrorMessage="Expiry date is not valid" ForeColor="Red" ValidationGroup="CreditCard" OnServerValidate="cvExpiryDate_ServerValidate">*</asp:CustomValidator>
                                                <%--ddl for card month--%>
                                                <asp:DropDownList ID="ddlExpiryMonth" placeholder="month" CssClass="form-control" runat="server" ValidationGroup="CreditCard">
                                                    <asp:ListItem>01</asp:ListItem>
                                                    <asp:ListItem>02</asp:ListItem>
                                                    <asp:ListItem>03</asp:ListItem>
                                                    <asp:ListItem>04</asp:ListItem>
                                                    <asp:ListItem>05</asp:ListItem>
                                                    <asp:ListItem>06</asp:ListItem>
                                                    <asp:ListItem>07</asp:ListItem>
                                                    <asp:ListItem>08</asp:ListItem>
                                                    <asp:ListItem>09</asp:ListItem>
                                                    <asp:ListItem>10</asp:ListItem>
                                                    <asp:ListItem>11</asp:ListItem>
                                                    <asp:ListItem>12</asp:ListItem>
                                                </asp:DropDownList>


                                            </div>
                                        </div>

                                        <div class="col-md-12 col-lg-6">
                                            <div class="form-item w-100">
                                                <%--Label for card year--%>
                                                <asp:Label ID="lblExpiryYear" runat="server" Text="Expiry Year" CssClass="mb-4"></asp:Label>
                                                <%--ddl for card year--%>
                                                <asp:DropDownList ID="ddlExpiryYear" runat="server" placeholder="year" CssClass="form-control" ValidationGroup="CreditCard">
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-item">


                                        <%--Label for card cvv--%>
                                        <asp:Label ID="lblCVV" runat="server" Text="CVV" CssClass="mb-4"></asp:Label>
                                        <%--rfv for card cvv--%>
                                        <asp:RequiredFieldValidator ID="rfvCVV" runat="server" ErrorMessage="CVV is required" ForeColor="Red" ControlToValidate="txtCVV" ValidationGroup="CreditCard">*</asp:RequiredFieldValidator>

                                        <%--                                        <asp:CustomValidator ID="cvCVV1" runat="server" ErrorMessage="CVV is invalid" ForeColor="Red" ValidationGroup="CreditCard" OnServerValidate="cvCVV_ServerValidate" >*</asp:CustomValidator>--%>
                                        <%--cv for card cvv--%>
                                        <asp:CustomValidator ID="cvCVV" runat="server" ErrorMessage="CVV is invalid"  ForeColor="Red" ControlToValidate="txtCVV" OnServerValidate="cvCVV_ServerValidate" ValidationGroup="CreditCard">*</asp:CustomValidator>
                                        <%--txtbox for card cvv--%>
                                        <asp:TextBox ID="txtCVV" type="text" runat="server" placeholder="cvv" TextMode="Number" ValidationGroup="CreditCard" CssClass="form-control" MaxLength="3" ToolTip="Must be a 3 digit number"></asp:TextBox>


                                    </div>

                                    <%--button to sumbit card info--%>
                                    <asp:Button ID="btnCardSubmit" runat="server" Text="Submit" Width="300px" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" ValidationGroup="CreditCard" OnClick="btnCardSubmit_Click" />
                                    <br />
                                    <%--button to cancel card info--%>

                                    <asp:Button ID="btnCardCancel" runat="server" CausesValidation="False" Width="168px" Text="Cancel" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnCardCancel_Click" />
                                </div>



                                <%--validation summary card info--%>

                                <asp:ValidationSummary ID="vsCreditCard" runat="server" ForeColor="Red" HeaderText="Please update the following fields" ValidationGroup="CreditCard" />

                                <%--label to dipsply error card info--%>

                                <asp:Label ID="lblCardMessage" runat="server" ForeColor="Red"></asp:Label>


                            </div>
                        </div>

                        <!-- Checkout Page End -->




                    </asp:View>

                    <%--view for billing info--%>

                    <asp:View ID="vBilling" runat="server">

                        <!-- Checkout Page Start -->
                        <div class="container-fluid py-5">
                            <div class="container py-5">
                                <h1 class="mb-4">Billing details</h1>
                                <%--billing info text--%>

                                <div>

                                    <div class="form-item">

                                        <%--displaying last 4 digits of card number--%>
                                        <asp:Label ID="lblCardInfoLabel" runat="server" Text="Card Information" CssClass="mb-4"></asp:Label>

                                        <asp:Label ID="lblCardInfo" runat="server" Text=" " CssClass="mb-4"></asp:Label>


                                    </div>

                                    <%--  --%>
                                    <div class="row">
                                        <div class="col-md-12 col-lg-6">

                                            <div class="form-item w-100">
                                                <%--label for first name--%>
                                                <asp:Label ID="lblOrderFirstname" runat="server" Text="First Name" CssClass="mb-4"></asp:Label>
                                                <%--rfv for first name--%>
                                                <asp:RequiredFieldValidator ID="rfvOrderFirstname" runat="server" ErrorMessage="Firstname is required" ForeColor="Red" ControlToValidate="txtOrderFirstname" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                                <%--txtbox for first name--%>
                                                <asp:TextBox ID="txtOrderFirstname" type="text" runat="server" placeholder="first name" CssClass="form-control" ValidationGroup="BillingInfo"></asp:TextBox>




                                            </div>
                                        </div>
                                        <div class="col-md-12 col-lg-6">
                                            <div class="form-item w-100">

                                                <%--label for last name--%>
                                                <asp:Label ID="lblOrderLastname" runat="server" Text="Last Name" CssClass="mb-4"></asp:Label>
                                                <%--rfv for last name--%>
                                                <asp:RequiredFieldValidator ID="rfvOrderLastname" runat="server" ErrorMessage="Lastname is required" ForeColor="Red" ControlToValidate="txtOrderLastname" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                                <%--txtbox for last name--%>
                                                <asp:TextBox ID="txtOrderLastname" type="text" runat="server" placeholder="last name" CssClass="form-control" ValidationGroup="BillingInfo"></asp:TextBox>


                                            </div>
                                        </div>
                                    </div>


                                    <div class="form-item">

                                        <%--label for address--%>
                                        <asp:Label ID="lblOrderAddress" runat="server" Text="Address" CssClass="mb-4"></asp:Label>
                                        <%--rfv for address--%>
                                        <asp:RequiredFieldValidator ID="rfvOrderAddress" runat="server" ErrorMessage="Address is required" ForeColor="Red" ControlToValidate="txtOrderAddress" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                        <%--txtbox for address--%>
                                        <asp:TextBox ID="txtOrderAddress" type="text" runat="server" placeholder="address" CssClass="form-control" ValidationGroup="BillingInfo"></asp:TextBox>


                                    </div>

                                    <div class="form-item">


                                        <%--label for postcode--%>
                                        <asp:Label ID="lblOrderPostcode" runat="server" Text="Postcode" CssClass="mb-4"></asp:Label>
                                        <%--rfv for postcode--%>
                                        <asp:RequiredFieldValidator ID="rfvOrderPostcode" runat="server" ErrorMessage="Postcode is required" ForeColor="Red" ControlToValidate="txtOrderPostcode" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                        <%--txtbox for postcode--%>
                                        <asp:TextBox ID="txtOrderPostcode" type="text" runat="server" placeholder="postcode" CssClass="form-control" ValidationGroup="BillingInfo"></asp:TextBox>


                                    </div>

                                    <div class="form-item">


                                        <%--label for city--%>
                                        <asp:Label ID="lblOrderCity" runat="server" Text="City" CssClass="mb-4"></asp:Label>
                                        <%--rfv for city--%>
                                        <asp:RequiredFieldValidator ID="rfvOrderCity" runat="server" ErrorMessage="City is required" ForeColor="Red" ControlToValidate="txtOrderCity" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                        <%--txtbox for city--%>
                                        <asp:TextBox ID="txtOrderCity" type="text" runat="server" placeholder="city" CssClass="form-control" ValidationGroup="BillingInfo"></asp:TextBox>


                                    </div>

                                    <div class="form-item">
                                        <%--label for country--%>
                                        <asp:Label ID="lblOrderCountry" runat="server" Text="Country" CssClass="mb-4"></asp:Label>
                                        <%--rfv for country--%>
                                        <asp:RequiredFieldValidator ID="rfvOrderCountry" runat="server" ErrorMessage="City is required" ForeColor="Red" ControlToValidate="ddlOrderCountry" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                        <%--ddl for country from database--%>
                                        <asp:DropDownList ID="ddlOrderCountry" runat="server" placeholder="country" CssClass="form-control" DataSourceID="dsCountry" DataTextField="CountryName" DataValueField="CountryID" ValidationGroup="BillingInfo">
                                        </asp:DropDownList>


                                        <asp:SqlDataSource ID="dsCountry" runat="server" ConnectionString="<%$ ConnectionStrings:FastTrackdbConnectionString %>" SelectCommand="SELECT [CountryID], [CountryName] FROM [countryList]"></asp:SqlDataSource>


                                    </div>




                                    <hr>


                                    <%--button for complete order--%>
                                    <asp:Button ID="btnOrderComplete" runat="server" Text="Complete Order" Width="300px" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnOrderComplete_Click" ValidationGroup="BillingInfo" />

                                    <br />
                                    <%--button for cancleing order--%>
                                    <asp:Button ID="btnorderCancelBilling" runat="server" Width="168px" CausesValidation="False" Text="Cancel Order" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" />
                                    <%--vs for billing--%>
                                    <asp:ValidationSummary ID="vsBilling" runat="server" ForeColor="Red" ValidationGroup="BillingInfo" />
                                    <%--error message--%>
                                    <asp:Label ID="lblPaymentMessage" runat="server" ForeColor="Red"></asp:Label>

                                </div>








                            </div>
                        </div>

                        <!-- Checkout Page End -->




                    </asp:View>
                    <%--view for confirmoation--%>
                    <asp:View ID="vConfirmation" runat="server">

                        <div class="container-fluid py-5">
                            <div class="container py-5">
                                <%--success message--%>
                                <asp:Label ID="lblMessage" runat="server" Text="o" CssClass="mb-4" ForeColor="#88C40C"></asp:Label>
                                <br />
                                <%--back to shop button--%>
                                <asp:Button ID="btnBackToShop" runat="server" Width="168px" CausesValidation="False" Text="Back to Shop" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnBackToShop_Click" />
                            </div>
                        </div>

                    </asp:View>


                </asp:MultiView> <%--end of multiview--%>






            </div>
        </div>
    </div>
    <!-- Cart Page End -->






</asp:Content>
