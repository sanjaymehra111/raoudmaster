<%@ Page Title="Create Shop Details" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="CreateShopDetails.aspx.cs" Inherits="EPMain.CreateShopDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .test-1 {
            background-color: rgba(255, 255, 255, 0.932);
            box-shadow: 5px 5px 20px rgba(0, 0, 0, 0.308);
            transition: 0.3s;
            color: #2a2b3d;
            border-radius: 5px;
        }

        .text_field3 {
            border: none;
            outline: none;
            border-bottom: solid 1px #2a2b3d;
            background: transparent;
            width: 100%;
            padding: 10px;
            font-size: 15px;
            text-align: center;
            padding-left: 30px;
            cursor: default;
            transition: 0.3s;
        }

        .fa_text_fonts12 {
            font-size: 20px;
            position: absolute;
            margin-top: 10px;
            margin-left: 5px;
            color: #6f6486;
            transition: 0.3s;
        }

        .text_field3:focus {
            border-bottom: solid 1px rgb(9, 156, 156);
        }

        .user_edit_button2 {
            width: 300px;
            padding: 10px;
            border: none;
            outline: none;
            background: transparent;
            text-transform: uppercase;
            color: white;
            font-size: 17px;
            background: #6f6486;
            transition: 0.5s;
            border-top-left-radius: 30px;
            border-bottom-right-radius: 30px;
            border-top-right-radius: 0px;
            border-bottom-left-radius: 0px;
        }

            .user_edit_button2:hover, .user_cancel_button3:hover, .user_save_button3:hover {
                background: #2a2b3d;
                box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.596);
            }

            .user_edit_button2:active, .user_cancel_button3:active, .user_save_button3:active {
                transition: 0.2s;
                transform: scale(0.98);
                box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.178);
            }

        .user_buttons {
            transition: 0.5s;
        }

        .insert_error_alert {
            font-size: 0px;
            color: red;
            text-transform: uppercase;
            font-weight: bold;
            transition: 0.3s;
        }

        @media(max-width:975px) {
            .user_edit_button2 {
                width: 100%;
            }

            .fa_text_fonts1 {
                margin-top: 4px;
                font-size: 20px;
            }

            .text_field3 {
                text-align: left;
                padding: 5px;
                font-size: 15px;
                width: 100%;
                padding-left: 35px;
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
                <a class="navbar-brand" href="#">Create<span class="main-color pagename"> Shop Details</span></a>
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
    <div class="admin_create_user">
        <div class="col-md-12">
            <div class="test-1">
                <br>
                <br>
                <div class="col-md-2"></div>
                <div class="col-md-4" style="text-align: center;">
                    <i class="fa fa-user fa_text_fonts1 fa_text_fonts12"></i>
                    <asp:TextBox ID="txtShopName" runat="server" CssClass="text_field3" placeholder="Shop Name*" TabIndex="1"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvShopName" runat="server" ErrorMessage="Shop Name Required*"
                        SetFocusOnError="true" ForeColor="Red" ValidationGroup="upd" ControlToValidate="txtShopName">
                    </asp:RequiredFieldValidator>
                    <br>
                    <br>
                    Contact Number
                    
                    <asp:TextBox ID="txtContactNumber" runat="server" CssClass="text_field3"  TabIndex="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Contact Number Required*"
                        SetFocusOnError="true" ForeColor="Red" ValidationGroup="upd" ControlToValidate="txtContactNumber">
                    </asp:RequiredFieldValidator>
                    <br>
                    <br>
                </div>
                <div class="col-md-4" style="text-align: center;">

                    <i class="fa fa-envelope fa_text_fonts1 fa_text_fonts12"></i>
                    <asp:TextBox ID="txtShopOwnerName" runat="server" CssClass="text_field3" placeholder="Shop Owner Name*"  TabIndex="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Shop Owner Name Required*"
                        SetFocusOnError="true" ForeColor="Red" ValidationGroup="upd" ControlToValidate="txtShopOwnerName">
                    </asp:RequiredFieldValidator>
                    <br>
                    <br>                    
                    Bill DateFrom 
                    <asp:TextBox ID="txtBillDateFrom" runat="server" TextMode="Date" CssClass="text_field3" placeholder="Bill Date From*"  TabIndex="4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Bill Date From Required*"
                        SetFocusOnError="true" ForeColor="Red" ValidationGroup="upd" ControlToValidate="txtBillDateFrom">
                    </asp:RequiredFieldValidator>
                    <br>
                    <br>
                </div>
                <br>
                <br>
                <div class="col-md-12"></div>
                <div class="col-md-2"></div>
                <div class="col-md-4" style="text-align: center;">
                    Bill DateTo 
                    <asp:TextBox ID="txtBillDateTo" runat="server" TextMode="Date" CssClass="text_field3" placeholder="Bill Date To*" TabIndex="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Bill Date To Required*"
                        SetFocusOnError="true" ForeColor="Red" ValidationGroup="upd" ControlToValidate="txtBillDateTo">
                    </asp:RequiredFieldValidator>
                    <br>
                    <br>
                </div>
                <div class="col-md-4" style="text-align: center;">
                </div>
                <div class="col-md-12"></div>
                <div class="col-md-2"></div>
                <div class="col-md-8" style="text-align: center;">
                    <i class="fa fa-map-marker fa_text_fonts1 fa_text_fonts12"></i>
                    <asp:TextBox ID="txtShopAddress" runat="server" CssClass="text_field3" placeholder="Shop Address*"  TabIndex="6"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Shop Address Required*"
                        SetFocusOnError="true" ForeColor="Red" ValidationGroup="upd" ControlToValidate="txtShopAddress">
                    </asp:RequiredFieldValidator>
                    <br>
                    <br>
                </div>
                <div class="col-md-12"></div>
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    Bill Photo Upload
                    <asp:FileUpload ID="imgBill" runat="server"  TabIndex="7" />
                    <br>
                    <br>
                </div>
                <div class="col-md-12" style="text-align: center;">
                    <br>
                    <p class="insert_error_alert">Please Insert All Necessary Details (*)</p>
                    <br>
                    <div class="user_buttons">
                        <asp:Button ID="btnSubmit" Text="Submit" runat="server"  TabIndex="8" ValidationGroup="upd" CssClass="user_edit_button2 user_save_button3" OnClick="btnSubmit_Click" />
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                </div>
                <div class="container-fluid"></div>
                <br>
                <br>
            </div>
        </div>
    </div>
</asp:Content>
