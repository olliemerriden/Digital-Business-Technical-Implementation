<%@ Page Title="" Language="C#" MasterPageFile="~/Frontend.Master" AutoEventWireup="true" CodeBehind="Customisation.aspx.cs" Inherits="FastTrackPCs.Customisation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="pagestyle.css" rel="stylesheet" />
    <script src="JavaScript.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Customise your PC</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                <li class="breadcrumb-item active text-white">Customise</li>
            </ol>
        </div>
        <!-- Single Page Header End -->

    <%--PAGE LAYOUT DIVS--%>
<div class="custom-page">
  <div class="layout">
    <div class="custom-layout">
        <%--HF to store Customuisation ID--%>
        <asp:HiddenField ID="hfCustomisationID" runat="server" />
        
        <table style="width: 100%">
            <tr>
                <td class="auto-style12">
                    <%--label for CPU--%>
                    <asp:Label ID="lblCpu" runat="server" Text="Choose CPU: " CssClass="mb-4"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style15">
                    <div class="dropdown">
                        <%--Ddl for CPU--%>
                        <asp:DropDownList ID="ddlCpu" runat="server" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100">

           
                        </asp:DropDownList>
                        
                        

                    </div>
                </td>
            </tr>


            <tr>
                <td class="auto-style12">
                    <%--label for RAM--%>
                    <asp:Label ID="lblRam" runat="server" Text="Choose RAM: " CssClass="mb-4"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style15">
                    <div class="dropdown">
                        <%--Ddl for RAM--%>
                        <asp:DropDownList ID="ddlRam" runat="server" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100">


                        </asp:DropDownList>
                    </div>
                </td>
            </tr>


            <tr>
                <td class="auto-style12">
                    <%--label for GRAHPICS--%>
                    <asp:Label ID="lblGraphics" runat="server" Text="Choose Graphics Card: " CssClass="mb-4"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style15">
                    <div class="dropdown">
                        <%--Ddl for GRAPHICS--%>
                        <asp:DropDownList ID="ddlGraphics" runat="server" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100">
                            
                        </asp:DropDownList>
                    </div>
                </td>
            </tr>

            <tr>
                <td class="auto-style12">
                    <%--label for STORAGE--%>
                    <asp:Label ID="lblStorage" runat="server" Text="Choose Storage: " CssClass="mb-4"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style15">
                    <div class="dropdown">
                        <%--Ddl for STORAGE--%>
                        <asp:DropDownList ID="ddlStorage" runat="server" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100">
                            
                        </asp:DropDownList>
                    </div>
                </td>
            </tr>

            <tr>
                <td class="auto-style12">
                    <%--label for CASE--%>
                    <asp:Label ID="lblCase" runat="server" Text="Choose Case: " CssClass="mb-4"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style15">
                    <div class="dropdown">
                        <%--Ddl for CASE--%>
                        <asp:DropDownList ID="ddlCase" runat="server" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100">
                            
                        </asp:DropDownList>
                    </div>
                </td>
            </tr>

 

            <tr>
                <td>
                    &nbsp;
                </td>
                <td class="auto-style15">
                    <%--Button to get total--%>
                    <asp:Button ID="btnCustomTotal" runat="server" Text="Get Total" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnCustomTotal_Click1" />
                    <%--&nbsp;--%>
                    <%--Button to add to basket--%>
                    <asp:Button ID="btnAddToBasket" runat="server" Text="Add to Basket" BackColor="#88C40C" CssClass="btn btn-primary border-2 border-secondary py-3 px-4 position-left rounded-pill text-white h-100" OnClick="btnAddToBasket_Click" Visible="False" />
                </td>
                <td>
                    &nbsp;
                </td>
                    </tr>

           
<tr>
                <td> &nbsp; </td>
                <td>
                    <%--VALUE TEXT AND AMMOUNT--%>
                    <asp:Label ID="lblYourTotalText" runat="server" Font-Bold="True" Font-Size="Larger" Text="Your Total Is: £"></asp:Label>
                    <u><asp:Label ID="lblTotalAmount" runat="server" Font-Bold="True" Font-Size="Larger"></asp:Label></u>
                </td>
                <td> &nbsp;</td>


            </tr>
                
            

        </table>
        
        
        
        

      
      
    </div>
  </div>
</div>



</asp:Content>
