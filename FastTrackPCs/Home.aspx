<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FastTrackPCs.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


            <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <center><div><asp:Label ID="lblLoginMessage" runat="server"></asp:Label></div></center> <%--IF Login Text--%>
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                                                

                        <h1 class="mb-5 display-3 text-primary">Level Up Your Gaming: Power, Precision, Personalised</h1> <%--Slogan--%>
                        <h4 class="mb-3 text-secondary">Power Your Play</h4>
                        
                        <div class="position-relative mx-auto">
                            <%--Button to shop--%>
                            <asp:Button ID="btnShopAll" Text="Shop Now" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" runat="server" Style="top: 0; right: 25%;" OnClick="btnShopAll_Click" />
                        </div>
                    </div>
                    <%--IMAGES ON CAROUSEL--%>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="img/carosell2.jpeg" class="img-fluid w-100 h-100 bg-secondary rounded" alt="First slide">
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="img/carosell1.jpeg" class="img-fluid w-100 h-100 rounded" alt="Second slide">
                                </div>
                            </div>

                            <%--BUTTON TO CHANGE IMAGE--%>
                            <asp:LinkButton ID="lbCarousel1" data-bs-target="#carouselId" data-bs-slide="prev" runat="server" CssClass="carousel-control-prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </asp:LinkButton>


                            <%--BUTTON TO CHANGE IMAGE--%>

                            <asp:LinkButton ID="lbCarousel2" runat="server" data-bs-target="#carouselId" data-bs-slide="next" CssClass="carousel-control-next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </asp:LinkButton>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->



</asp:Content>
