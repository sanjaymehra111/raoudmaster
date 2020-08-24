<%@ Page Title="Download Report" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="DownloadReport.aspx.cs" Inherits="EPMain.DownloadReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style type="text/css">
        /* Add a black background color to the top navigation bar */
        .topnav {
            overflow: hidden;
            background-color: #e9e9e9;
        }

            /* Style the links inside the navigation bar */
            .topnav a {
                float: left;
                display: block;
                color: black;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }

                /* Change the color of links on hover */
                .topnav a:hover {
                    background-color: #ddd;
                    color: black;
                }

                /* Style the "active" element to highlight the current page */
                .topnav a.active {
                    background-color: #2196F3;
                    color: white;
                }

            /* Style the search box inside the navigation bar */
            .topnav input[type=text] {
                padding: 3px;
                margin-top: 8px;
                margin-left: 12px;
                margin-right: 16px;
                margin-bottom: 8px;
                font-size: 17px;
            }
        /* When the screen is less than 600px wide, stack the links and the search field vertically instead of horizontally */
        @media screen and (max-width: 600px) {
            .topnav a, .topnav input[type=text] {
                float: none;
                display: block;
                text-align: left;
                width: 100%;
                margin: 0;
                padding: 14px;
            }

            .topnav input[type=text] {
                border: 1px solid #ccc;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp" runat="server">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <i class="fa fa-align-right"></i>
                </button>
                <a class="navbar-brand" href="#">My <span class="main-color pagename">Report</span></a>
            </div>
            <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <i data-show="show-side-navigation1" style="color: white; font-size: 18px; margin-top: 15px; padding: 5px; cursor: pointer; float: right;" class="fa fa-bars show-side-btn"></i>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My Dashboard <span class="caret"></span></a>
                        <ul class="dropdown-menu">

                            <li><a href="logout.aspx"><i class="fa fa-sign-out"></i>Log out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <br>
    <br>
    <br>
    <div class="topnav">
        <asp:TextBox ID="txtFromDate" runat="server" placeholder="From Date.."></asp:TextBox>
        <asp:TextBox ID="txtToDate" runat="server" placeholder="To Date.."></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
    </div>
    <div class="col-md-12" style="overflow-x: auto; height: 500px">
        <asp:GridView ID="grvReport" runat="server"
            BackColor="White" BorderColor="#E7E7FF"
            BorderStyle="None" BorderWidth="1px" CellPadding="3"
            GridLines="Horizontal" Width="100%" OnRowDataBound="grvReport_RowDataBound">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>

    </div>
    <div class="col-md-12">
        <br />
        <asp:Button ID="btnDownload" runat="server" CssClass="btn btn-primary" Text="Download View User Report" OnClick="btnDownload_Click" />
        <br />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    </div>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script>
        $(function () {
            $("#cp_txtFromDate").datepicker();
            $("#cp_txtToDate").datepicker();
        });
    </script>
</asp:Content>
