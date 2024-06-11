<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="FastTrackPCs.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

                <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">About</h1> <%--HEader TExt--%>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li><%--Breadcrumb Text--%>
                <li class="breadcrumb-item active text-white">About</li><%--Breadcrumb Text--%>
            </ol>
        </div>
        <!-- Single Page Header End -->



        <!-- Contact Start -->
    <%--DIVS FOR PAGE SETUP--%>
        <div class="container-fluid contact py-5">
            <div class="container py-5">
                <div class="p-5 bg-light rounded">
                    <div class="row g-4">
                        <div class="col-12">
                            <div class="text-center mx-auto" style="max-width: 700px;">
                                <h1 class="text-primary">About Us</h1> <%--About Us Text--%>
                                <%--Dummy Text--%>
                                <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus porta augue id placerat tempus. Nam in ipsum dignissim neque luctus tempus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis congue tortor, eu suscipit eros. Pellentesque eu sapien tincidunt, fringilla ante ac, dapibus diam. Ut tempor, dolor id rutrum feugiat, augue nisi iaculis magna, id vulputate lacus mauris id mi. Phasellus sit amet aliquet mauris.</p>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <%--Youtube Video--%>
                            <center><div class="h-100 rounded; display: flex; justify-content: center;">                            
                                <iframe width="900" height="500" src="https://www.youtube.com/embed/p6-MsytRGTE?si=cpWFeke7zcGRkstA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                            </div></center>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact End -->


</asp:Content>
