<%@ Page Title="Insert User" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="AdminCreateUserGroup.aspx.cs" Inherits="EPMain.AdminCreateUserGroup" %>

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
    <script>

        $(function () {
            $(".text_field3").focus(function () {
                $(".fa_text_fonts12").css({ "color": "#6f6486" });
                $(this).prev(".fa_text_fonts1").css({ "color": "rgb(9, 156, 156)" });
            })

            $(".user_save_button3").click(function () {
                var a = 5;
                $(".text_field3").each(function () {
                    if ($(this).val() == "")
                        a = a - 1;
                })
                if (a != 5)
                    $(".insert_error_alert").css({ "font-size": "15px" });
                else {
                    $(".insert_error_alert").css({ "font-size": "0px" });
                }
            }); //user_save_button3 click close

        })

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cp" runat="server">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <i class="fa fa-align-right"></i>
                </button>
                <a class="navbar-brand" href="#">My <span class="main-color pagename">New User</span></a>
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
    <br><br><br>
    <div class="admin_create_user">
        <div class="col-md-12">
            <div class="test-1">
                <br>
                <br>
                <div class="col-md-2"></div>
                <div class="col-md-4" style="text-align: center;">
                    <i class="fa fa-user fa_text_fonts1 fa_text_fonts12"></i>                    
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="text_field3" placeholder="User Name*"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="User Name Required*"
                            SetFocusOnError="true" ForeColor="Red" ValidationGroup="upd" ControlToValidate="txtUsername">
                    </asp:RequiredFieldValidator>
                    <br>
                    <br>

                    <i class="fa fa-phone fa_text_fonts1 fa_text_fonts12"></i>                    
                    <asp:TextBox ID="txtContact" runat="server" CssClass="text_field3" TextMode="Number" placeholder="User Contact*" 
                        onkeypress="if(this.value.length>=10) return false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="User Contact Required*"
                            SetFocusOnError="true" ForeColor="Red" ValidationGroup="upd" ControlToValidate="txtContact">
                    </asp:RequiredFieldValidator>
                    <br>
                    <br>
                </div>
                <div class="col-md-4" style="text-align: center;">

                    <i class="fa fa-envelope fa_text_fonts1 fa_text_fonts12"></i>                    
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="text_field3" placeholder="User E-Mail*"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="User E-Mail Required*"
                            SetFocusOnError="true" ForeColor="Red" ValidationGroup="upd" ControlToValidate="txtEmail">
                    </asp:RequiredFieldValidator>
                    <br>
                    <br>

                    <i class="fa fa-dashboard fa_text_fonts1 fa_text_fonts12"></i>                    
                    <asp:TextBox ID="txtMeter" runat="server" CssClass="text_field3" placeholder="User Meter Number*"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="User Meter Number Required*"
                            SetFocusOnError="true" ForeColor="Red" ValidationGroup="upd" ControlToValidate="txtMeter">
                    </asp:RequiredFieldValidator>
                    <br>
                    <br>
                </div>
                <div class="col-md-12"></div>
                <div class="col-md-2"></div>                
                <div class="col-md-8" style="text-align: center;">
                    <i class="fa fa-map-marker fa_text_fonts1 fa_text_fonts12"></i>                    
                    <asp:TextBox ID="txtPrevBillReading" runat="server" CssClass="text_field3" placeholder="Previous Bill Reading*"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Previous Bill Reading Required*"
                            SetFocusOnError="true" ForeColor="Red" ValidationGroup="upd" ControlToValidate="txtPrevBillReading">
                    </asp:RequiredFieldValidator>
                    <br>
                    <br>
                </div>
                <div class="col-md-12"></div>
                <div class="col-md-2"></div>                
                <div class="col-md-8" style="text-align: center;">
                    <i class="fa fa-map-marker fa_text_fonts1 fa_text_fonts12"></i>                    
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="text_field3" placeholder="User Address*"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="User Address Required*"
                            SetFocusOnError="true" ForeColor="Red" ValidationGroup="upd" ControlToValidate="txtAddress">
                    </asp:RequiredFieldValidator>
                    <br>
                    <br>
                </div>
                
                <div class="col-md-12" style="text-align: center;">
                    <br>
                    <p class="insert_error_alert">Please Insert All Necessary Details (*)</p>
                    <br>
                    <div class="user_buttons">                        
                        <asp:Button ID="btnUpdate" Text="Create New User" runat="server" ValidationGroup="upd" CssClass="user_edit_button2 user_save_button3" OnClick="btnUpdate_Click" />                        
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
