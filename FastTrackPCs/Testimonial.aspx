<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="Testimonial.aspx.cs" Inherits="FastTrackPCs.Testimonial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Single Page Header start -->
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6">Testimonial</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
            <li class="breadcrumb-item active text-white">Testimonial</li>
        </ol>
    </div>
    <!-- Single Page Header End -->


    <!-- Tastimonial Start -->
    

    <%--PAGE DIVS--%>
    <div class="container-fluid contact py-5">
        <div class="container py-5">
            <div class="p-5 bg-light rounded">
                <div class="row g-4">
                    <div class="col-12">
                        <div class="text-center mx-auto" style="max-width: 700px;">
                            <%--HEADER--%>
                            <h1 class="display-5 mb-5 text-dark">What Our Clients Are Saying!</h1>

                        </div>
                    </div>
                    <div class="col-lg-12">


                        <center>

                        
                        <table>
                            <tr>
                                <td>
                                    <%--DDL FOR FILTERING TESTS--%>
<asp:DropDownList ID="ddlFilterTest" runat="server" CssClass="form-control" Width="100px">
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>

                            </asp:DropDownList>
                                </td>
                                <td>
                                    <%--BUTTON TO FILTER--%>
                            <asp:Button ID="btnFilterTest" runat="server" Text="Filter by Rating" OnClick="btnFilterTest_Click" CausesValidation="False" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" Width="300px" />

                                </td>


                            </tr>
                        </table>
</center>

                        <div class="text-center">

                            <%--DATA SORUCE FOR TEST FILTER--%>
                            <asp:SqlDataSource ID="dsTestFilter" runat="server" ConnectionString="<%$ ConnectionStrings:FastTrackdbConnectionString %>" SelectCommand="SELECT DISTINCT [Rating] FROM [Testimonials]"></asp:SqlDataSource>


                            <strong>
                                <%--DATA LIST FOR TESTIMONIALS--%> 
                                <asp:DataList ID="dlTestimonials" runat="server" DataKeyField="TestID" DataSourceID="dsTestimonials" OnSelectedIndexChanged="dlTestimonials_SelectedIndexChanged" RepeatDirection="Horizontal"  CellSpacing="40" CellPadding="20" HorizontalAlign="Center" RepeatColumns="3" RepeatLayout="Table">
                                    <ItemTemplate>
                                        <%--TESTIMONIAL TEXT--%>
                                        "<asp:Label ID="TestDescLabel" runat="server" Text='<%# Eval("TestDesc") %>' CssClass="auto-style1" Font-Italic="True" />"
                        
                        -
                       <%--AUTHOR LABEL--%>
                        <asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' CssClass="auto-style1" Font-Bold="True" Font-Size="X-Large" />
                                        <br />
                                        <%--STAR IMAGES--%>
                                        <asp:Image ID="imgStar1" runat="server" Height="35px" Width="35px" ImageUrl='<%# Eval("Rating","img/star.png") %>' />
                                        <asp:Image ID="imgStar2" runat="server" Height="35px" Width="35px" ImageUrl='<%# Eval("Rating","img/star.png") %>' Visible='<%# Convert.ToInt32(Eval("Rating"))>1 %>' />
                                        <asp:Image ID="imgStar3" runat="server" Height="35px" Width="35px" ImageUrl='<%# Eval("Rating","img/star.png") %>' Visible='<%# Convert.ToInt32(Eval("Rating"))>2 %>' />
                                        <asp:Image ID="imgStar4" runat="server" Height="35px" Width="35px" ImageUrl='<%# Eval("Rating","img/star.png") %>' Visible='<%# Convert.ToInt32(Eval("Rating"))>3 %>' />
                                        <asp:Image ID="imgStar5" runat="server" Height="35px" Width="35px" ImageUrl='<%# Eval("Rating","img/star.png") %>' Visible='<%# Convert.ToInt32(Eval("Rating"))>4 %>' />


                                        <br />
                                    </ItemTemplate>
                                </asp:DataList>

                            </strong>

                        </div>

                        

                    </div>
                       <center>
                           <%--SUMBIT A TEST--%>
                           <h8 class="display-5 mb-5 text-dark">Submit a Testimonial</h8>
                        <div class="col-lg-7">
                            <div action="" class="">

                                <%--rfv for test name--%>
                                <asp:RequiredFieldValidator ID="rfvTestName" runat="server" ErrorMessage="Name is required" ForeColor="Red" ControlToValidate="txtTestName">*</asp:RequiredFieldValidator>
                                <%--txtbox for test name--%>
                                <asp:TextBox ID="txtTestName" placeholder="Your Name" runat="server" Width="650" CssClass="w-100 form-control border-0 py-3 mb-4"></asp:TextBox>

                                <%--rfv for test message--%>
                                <asp:RequiredFieldValidator ID="rfvTestMessage" runat="server" ErrorMessage="Message is required" ForeColor="Red" ControlToValidate="txtTestMessage">*</asp:RequiredFieldValidator>
                                <%--txtbox for test mesage--%>
                                <asp:TextBox ID="txtTestMessage" placeholder="Your Message" runat="server" CssClass="w-100 form-control border-0 mb-4" Height="100" Width="650" Wrap="True" TextMode="MultiLine"></asp:TextBox>
                                
                                <%--ddl for test rating--%>
                              
                                <asp:DropDownList ID="ddlTestRating" runat="server" Width="350" CssClass="form-control">
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                                <%--button to submit a test--%>
                                <asp:Button ID="btnContact" runat="server" Text="Submit" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" Width="500px" OnClick="btnContact_Click"  />
                               <%--vs for testpage--%>
                                <asp:ValidationSummary ID="vsContact" runat="server" ForeColor="Red" />

                                <br />
                                <%--label for success messsage--%>
                                <asp:Label ID="lblTestMessage" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label>
                            </div>
                        </div>

                            </center>




                   
                </div>
            </div>
        </div>
    </div>
    


    <%--data soruce for test datalist--%>
    <asp:SqlDataSource ID="dsTestimonials" runat="server" ConnectionString="<%$ ConnectionStrings:FastTrackdbConnectionString %>" SelectCommand="SELECT * FROM [Testimonials] WHERE ([IsApproved] = @IsApproved)">
        <SelectParameters>
            <asp:Parameter DefaultValue="True" Name="IsApproved" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>

   
    <!-- Tastimonial End -->


</asp:Content>
