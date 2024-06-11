<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="FastTrackPCs.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="pagestyle.css" rel="stylesheet" />
    <script src="JavaScript.js"></script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Single Page Header start -->
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6">Checkout</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
            <li class="breadcrumb-item active text-white">Checkout</li>
        </ol>
    </div>
    <!-- Single Page Header End -->



    <div class="custom-page">
        <div class="layout">

            <div class="custom-layout">


                <asp:MultiView ID="mvCheckout" runat="server">

                    <asp:View ID="vCard" runat="server">

                        <!-- Checkout Page Start -->
                        <div class="container-fluid py-5">
                            <div class="container py-5">
                                <h1 class="mb-4">Billing details</h1>
                                <div>


                                    <div class="form-item">


                                            <asp:Label ID="lblCardInfoLabel" runat="server" Text="Card Information" CssClass="mb-4"></asp:Label>

                                            <asp:Label ID="lblCardInfo" runat="server" Text=" " CssClass="mb-4"></asp:Label>


                                        </div>

                                    <div class="row">
                                        <%--<div class="col-md-12 col-lg-6">--%>
                                        <div class="form-item">

                                            <asp:Label ID="lblCardType" runat="server" Text="Card Type" CssClass="mb-4"></asp:Label>
                                            <asp:RequiredFieldValidator ID="rfvCardType" runat="server" ErrorMessage="Card Type is required" ForeColor="Red" ControlToValidate="ddlCardType" ValidationGroup="CreditCard">*</asp:RequiredFieldValidator>
                                            <asp:DropDownList ID="ddlCardType" runat="server" placeholder="card type" CssClass="form-control" ValidationGroup="CreditCard">
                                                <asp:ListItem>American Express</asp:ListItem>
                                                <asp:ListItem>Discover</asp:ListItem>
                                                <asp:ListItem>Master Card</asp:ListItem>
                                                <asp:ListItem>Visa</asp:ListItem>
                                            </asp:DropDownList>



                                        </div>
                                        <%--</div>--%>

                                        <div class="form-item">


                                            <asp:Label ID="lblCardNumber" runat="server" Text="Card Number" CssClass="mb-4"></asp:Label>
                                            <asp:RequiredFieldValidator ID="rfvCardNumber" runat="server" ErrorMessage="Card Number is required" ForeColor="Red" ControlToValidate="txtCardNumber" ValidationGroup="CreditCard">*</asp:RequiredFieldValidator>

                                            <asp:CustomValidator ID="cvCardNumber" runat="server" ErrorMessage="Card number is not valid" ForeColor="Red" ValidationGroup="CreditCard" OnServerValidate="cvCardNumber_ServerValidate">*</asp:CustomValidator>
                                            <asp:TextBox ID="txtCardNumber" type="text" runat="server" MaxLength="20" placeholder="card number" CssClass="form-control" ValidationGroup="CreditCard"></asp:TextBox>


                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-md-12 col-lg-6">
                                            <div class="form-item w-100">


                                                <asp:Label ID="lblExpiryDate" runat="server" Text="Expiry Month" CssClass="mb-4"></asp:Label>
                                                <asp:CustomValidator ID="cvExpiryDate" runat="server" ErrorMessage="Expiry date is not valid" ForeColor="Red" ValidationGroup="CreditCard" OnServerValidate="cvExpiryDate_ServerValidate">*</asp:CustomValidator>
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

                                                <asp:Label ID="lblExpiryYear" runat="server" Text="Expiry Year" CssClass="mb-4"></asp:Label>

                                                <asp:DropDownList ID="ddlExpiryYear" runat="server" placeholder="year" CssClass="form-control" ValidationGroup="CreditCard">
                                                </asp:DropDownList>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-item">



                                        <asp:Label ID="lblCVV" runat="server" Text="CVV" CssClass="mb-4"></asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvCVV" runat="server" ErrorMessage="CVV is required" ForeColor="Red" ControlToValidate="txtCVV" ValidationGroup="CreditCard">*</asp:RequiredFieldValidator>

                                        <asp:CustomValidator ID="cvCVV" runat="server" ErrorMessage="CVV is invalid" ForeColor="Red" ValidationGroup="CreditCard" OnServerValidate="cvCVV_ServerValidate">*</asp:CustomValidator>

                                        <asp:TextBox ID="txtCVV" type="text" runat="server" placeholder="cvv" MaxLength="3" CssClass="form-control" TextMode="Number" ValidationGroup="CreditCard"></asp:TextBox>


                                    </div>



                                    
                                    <asp:Button ID="btnCardCancel" runat="server" CausesValidation="False" Width="168px" Text="Cancel" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnCardCancel_Click" />
                                    <asp:Button ID="btnCardSubmit" runat="server" Text="Submit"  BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" ValidationGroup="CreditCard" OnClick="btnCardSubmit_Click" />
                                </div>




                                <asp:ValidationSummary ID="vsCheckoutCard" runat="server" ForeColor="Red" ValidationGroup="CreditCard" />



                            </div>
                        </div>

                        <!-- Checkout Page End -->




                    </asp:View>


                    <asp:View ID="vBilling" runat="server">

                        <!-- Checkout Page Start -->
                        <div class="container-fluid py-5">
                            <div class="container py-5">
                                <h1 class="mb-4">Billing details</h1>
                                <div>




                                    <div class="row">
                                        <div class="col-md-12 col-lg-6">
                                            <div class="form-item w-100">

                                                <asp:Label ID="lblOrderFirstname" runat="server" Text="First Name" CssClass="mb-4"></asp:Label>
                                                <asp:RequiredFieldValidator ID="rfvOrderFirstname" runat="server" ErrorMessage="Firstname is required" ForeColor="Red" ControlToValidate="txtOrderFirstname" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtOrderFirstname" type="text" runat="server" placeholder="first name" CssClass="form-control" ValidationGroup="BillingInfo"></asp:TextBox>




                                            </div>
                                        </div>
                                        <div class="col-md-12 col-lg-6">
                                            <div class="form-item w-100">


                                                <asp:Label ID="lblOrderLastname" runat="server" Text="Last Name" CssClass="mb-4"></asp:Label>
                                                <asp:RequiredFieldValidator ID="rfvOrderLastname" runat="server" ErrorMessage="Lastname is required" ForeColor="Red" ControlToValidate="txtOrderLastname" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtOrderLastname" type="text" runat="server" placeholder="last name" CssClass="form-control" ValidationGroup="BillingInfo"></asp:TextBox>


                                            </div>
                                        </div>
                                    </div>


                                    <div class="form-item">


                                        <asp:Label ID="lblOrderAddress" runat="server" Text="Address" CssClass="mb-4"></asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvOrderAddress" runat="server" ErrorMessage="Address is required" ForeColor="Red" ControlToValidate="txtOrderAddress" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtOrderAddress" type="text" runat="server" placeholder="address" CssClass="form-control" ValidationGroup="BillingInfo"></asp:TextBox>


                                    </div>

                                    <div class="form-item">



                                        <asp:Label ID="lblOrderPostcode" runat="server" Text="Postcode" CssClass="mb-4"></asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvOrderPostcode" runat="server" ErrorMessage="Postcode is required" ForeColor="Red" ControlToValidate="txtOrderPostcode" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtOrderPostcode" type="text" runat="server" placeholder="postcode" CssClass="form-control" ValidationGroup="BillingInfo"></asp:TextBox>


                                    </div>

                                    <div class="form-item">



                                        <asp:Label ID="lblOrderCity" runat="server" Text="City" CssClass="mb-4"></asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvOrderCity" runat="server" ErrorMessage="City is required" ForeColor="Red" ControlToValidate="txtOrderCity" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtOrderCity" type="text" runat="server" placeholder="city" CssClass="form-control" ValidationGroup="BillingInfo"></asp:TextBox>


                                    </div>

                                    <div class="form-item">



                                        <asp:Label ID="lblOrderCountry" runat="server" Text="Country" CssClass="mb-4"></asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvOrderCountry" runat="server" ErrorMessage="City is required" ForeColor="Red" ControlToValidate="ddlOrderCountry" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                        <asp:DropDownList ID="ddlOrderCountry" runat="server" placeholder="country" CssClass="form-control" DataSourceID="dsCountry" DataTextField="CountryName" DataValueField="CountryID" ValidationGroup="BillingInfo">
                                        </asp:DropDownList>


                                        <asp:SqlDataSource ID="dsCountry" runat="server" ConnectionString="<%$ ConnectionStrings:FastTrackdbConnectionString %>" SelectCommand="SELECT [CountryID], [CountryName] FROM [countryList]"></asp:SqlDataSource>


                                    </div>


                                    <div class="form-item">


                                        <asp:Label ID="lblOrderEmail" runat="server" Text="Email" CssClass="mb-4"></asp:Label>
                                        <asp:RequiredFieldValidator ID="rfvOrderEmail" runat="server" ErrorMessage="Email is required" ForeColor="Red" ControlToValidate="txtOrderEmail" ValidationGroup="BillingInfo">*</asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtOrderEmail" type="text" runat="server" placeholder="email" CssClass="form-control" TextMode="Email" ValidationGroup="BillingInfo"></asp:TextBox>



                                    </div>

                                    <hr>

                                    <div class="form-item">

                                        <asp:TextBox ID="txtbOrderMessage" placeholder="Order Notes (Optional)" runat="server" CssClass="w-100 form-control border-1 mb-4" Height="100" Width="100" Wrap="True" TextMode="MultiLine" BorderWidth="10px" BorderColor="#CED4DA"></asp:TextBox>


                                    </div>

                                    <asp:Button ID="btnorderCancelBilling" runat="server" Width="168px" CausesValidation="False" Text="Cancel Order" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" />
                                    <asp:Button ID="btnOrderComplete" runat="server" Text="Complete Order"  BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnOrderComplete_Click" ValidationGroup="BillingInfo" />

                                <asp:ValidationSummary ID="vsBilling" runat="server" ForeColor="Red" ValidationGroup="BillingInfo" />

                                </div>








                            </div>
                        </div>

                        <!-- Checkout Page End -->




                    </asp:View>

                    <asp:View ID="vConfirmation" runat="server">
                        <div class="auto-style20" style="color: #00CC00">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            <strong>
                                <br />
                                <br />
                            </strong>
                            <asp:Button ID="btnBackToShop" runat="server" Text="Back to Shop" />
                        </div>
                    </asp:View>





                </asp:MultiView>



            </div>
        </div>
    </div>


</asp:Content>
