<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="FastTrackPCs.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Contact</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                <li class="breadcrumb-item active text-white">Contact</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Contact Start -->
        <div class="container-fluid contact py-5">
            <div class="container py-5">
                <div class="p-5 bg-light rounded">
                    <div class="row g-4">
                        <div class="col-12">
                            <div class="text-center mx-auto" style="max-width: 700px;">
                                <h1 class="text-primary">Get in touch</h1>  <%--Get in touch text--%>
                                <%--Dummy Text--%>
                                <p class="mb-4">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus porta augue id placerat tempus. Nam in ipsum dignissim neque luctus tempus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis congue tortor, eu suscipit eros. Pellentesque eu sapien tincidunt, fringilla ante ac, dapibus diam. Ut tempor, dolor id rutrum feugiat, augue nisi iaculis magna, id vulputate lacus mauris id mi. Phasellus sit amet aliquet mauris.</p>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="h-100 rounded">         
                                <%--Map--%>
                                <center><iframe class="rounded w-100;" 
                                style="height: 400px; width: 900px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9499.577338051218!2d-2.2392999!3d53.4703485!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x487bb1eca118180b%3A0x739a45aa865ef5a1!2sManchester%20Metropolitan%20University!5e0!3m2!1sen!2suk!4v1708808564931!5m2!1sen!2suk" 
                                loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></center>
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div action="" class="">
                                <%--rfv for contact name--%>
                                <asp:RequiredFieldValidator ID="rfvContactName" runat="server" ErrorMessage="Name is required" ForeColor="Red" ControlToValidate="txtContactName">*</asp:RequiredFieldValidator>
                                <%--txtbx for contact name--%>
                                <asp:TextBox ID="txtContactName" placeholder="Your Name" runat="server" Width="650" CssClass="w-100 form-control border-0 py-3 mb-4"></asp:TextBox>
                                <%--rfv for contact email--%>
                                <asp:RequiredFieldValidator ID="rfvContactEmail" runat="server" ErrorMessage="Email is required" ForeColor="Red" ControlToValidate="txtContactEmail">*</asp:RequiredFieldValidator>
                                <%--txtbx for contact email--%>
                                <asp:TextBox ID="txtContactEmail" placeholder="Enter Your Email"  runat="server" Width="650" CssClass="w-100 form-control border-0 py-3 mb-4" TextMode="Email"></asp:TextBox>
                                <%--rfv for contact name--%>
                                <asp:RequiredFieldValidator ID="rfvContactMessage" runat="server" ErrorMessage="Message is required" ForeColor="Red" ControlToValidate="txtbContactMessage">*</asp:RequiredFieldValidator>
                                <%--txtbx for contact name--%>
                                <asp:TextBox ID="txtbContactMessage" placeholder="Your Message" runat="server" CssClass="w-100 form-control border-0 mb-4" Height="100" Width="650" Wrap="True" TextMode="MultiLine"></asp:TextBox>
                                <%--button for submitting--%>
                                <asp:Button ID="btnContact" runat="server" Text="Submit" Width="650" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnContact_Click" />
                               <%--vs for contact page--%>
                                <asp:ValidationSummary ID="vsContact" runat="server" ForeColor="Red" />
                                <br />
                                <%--rfv for contact message--%>
                                <asp:Label ID="lblContactMessage" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>
                            </div>
                        </div>

                        <%--CONTACT INFO--%>
                        <div class="col-lg-5">
                            <div class="d-flex p-4 rounded mb-4 bg-white">
                                <i class="fas fa-map-marker-alt fa-2x text-primary me-4"></i>
                                <div>
                                    <h4>Address</h4>
                                    <p class="mb-2">Oxford Road, Manchester. England</p>
                                </div>
                            </div>
                            <div class="d-flex p-4 rounded mb-4 bg-white">
                                <i class="fas fa-envelope fa-2x text-primary me-4"></i>
                                <div>
                                    <h4>Mail Us</h4>
                                    <p class="mb-2">info@fasttrackpc.com</p>
                                </div>
                            </div>
                            <div class="d-flex p-4 rounded bg-white">
                                <i class="fa fa-phone-alt fa-2x text-primary me-4"></i>
                                <div>
                                    <h4>Telephone</h4>
                                    <p class="mb-2">07766998877</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Contact End -->



</asp:Content>
