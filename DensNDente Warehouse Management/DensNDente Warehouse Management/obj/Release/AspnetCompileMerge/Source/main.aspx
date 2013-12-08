<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="DensNDente_Warehouse_Management.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $(".meter > span").each(function () {
                $(this)
                    .data("origWidth", $(this).width())
                    .width(0)
                    .animate({
                        width: $(this).data("origWidth")
                    }, 1700);
            });
        });
    </script>
    <style type="text/css">
        .meter {
            height: 20px; /* Can be anything */
            position: relative;
            background: #555;
            -moz-border-radius: 25px;
            -webkit-border-radius: 25px;
            border-radius: 25px;
            padding: 6px;
            -webkit-box-shadow: inset 0 -1px 1px rgba(255,255,255,0.3);
            -moz-box-shadow: inset 0 -1px 1px rgba(255,255,255,0.3);
            box-shadow: inset 0 -1px 1px rgba(255,255,255,0.3);
        }

            .meter > span {
                display: block;
                height: 100%;
                -webkit-border-top-right-radius: 8px;
                -webkit-border-bottom-right-radius: 8px;
                -moz-border-radius-topright: 8px;
                -moz-border-radius-bottomright: 8px;
                border-top-right-radius: 8px;
                border-bottom-right-radius: 8px;
                -webkit-border-top-left-radius: 20px;
                -webkit-border-bottom-left-radius: 20px;
                -moz-border-radius-topleft: 20px;
                -moz-border-radius-bottomleft: 20px;
                border-top-left-radius: 20px;
                border-bottom-left-radius: 20px;
                background-color: rgb(43,194,83);
                background-image: -webkit-gradient( linear, left bottom, left top, color-stop(0, rgb(43,194,83)), color-stop(1, rgb(84,240,84)) );
                background-image: -moz-linear-gradient( center bottom, rgb(43,194,83) 37%, rgb(84,240,84) 69% );
                -webkit-box-shadow: inset 0 2px 9px rgba(255,255,255,0.3), inset 0 -2px 6px rgba(0,0,0,0.4);
                -moz-box-shadow: inset 0 2px 9px rgba(255,255,255,0.3), inset 0 -2px 6px rgba(0,0,0,0.4);
                box-shadow: inset 0 2px 9px rgba(255,255,255,0.3), inset 0 -2px 6px rgba(0,0,0,0.4);
                position: relative;
                overflow: hidden;
            }

                .meter > span:after, .animate > span > span {
                    content: "";
                    position: absolute;
                    top: 0;
                    left: 0;
                    bottom: 0;
                    right: 0;
                    background-image: -webkit-gradient(linear, 0 0, 100% 100%, color-stop(.25, rgba(255, 255, 255, .2)), color-stop(.25, transparent), color-stop(.5, transparent), color-stop(.5, rgba(255, 255, 255, .2)), color-stop(.75, rgba(255, 255, 255, .2)), color-stop(.75, transparent), to(transparent) );
                    background-image: -moz-linear-gradient( -45deg, rgba(255, 255, 255, .2) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, .2) 50%, rgba(255, 255, 255, .2) 75%, transparent 75%, transparent );
                    z-index: 1;
                    -webkit-background-size: 50px 50px;
                    -moz-background-size: 50px 50px;
                    -webkit-animation: move 2s linear infinite;
                    -webkit-border-top-right-radius: 8px;
                    -webkit-border-bottom-right-radius: 8px;
                    -moz-border-radius-topright: 8px;
                    -moz-border-radius-bottomright: 8px;
                    border-top-right-radius: 8px;
                    border-bottom-right-radius: 8px;
                    -webkit-border-top-left-radius: 20px;
                    -webkit-border-bottom-left-radius: 20px;
                    -moz-border-radius-topleft: 20px;
                    -moz-border-radius-bottomleft: 20px;
                    border-top-left-radius: 20px;
                    border-bottom-left-radius: 20px;
                    overflow: hidden;
                }

        .animate > span:after {
            display: none;
        }

        @-webkit-keyframes move {
            0% {
                background-position: 0 0;
            }

            100% {
                background-position: 50px 50px;
            }
        }

        .orange > span {
            background-color: #f1a165;
            background-image: -moz-linear-gradient(top, #f1a165, #f36d0a);
            background-image: -webkit-gradient(linear,left top,left bottom,color-stop(0, #f1a165),color-stop(1, #f36d0a));
            background-image: -webkit-linear-gradient(#f1a165, #f36d0a);
        }

        .red > span {
            background-color: #f0a3a3;
            background-image: -moz-linear-gradient(top, #f0a3a3, #f42323);
            background-image: -webkit-gradient(linear,left top,left bottom,color-stop(0, #f0a3a3),color-stop(1, #f42323));
            background-image: -webkit-linear-gradient(#f0a3a3, #f42323);
        }

        .nostripes > span > span, .nostripes > span:after {
            -webkit-animation: none;
            background-image: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding: 10px;">
        <div id="lbltarget" runat="server" style="float: left; margin-bottom: 5px; width: 100%; color: darkred; font-size: 25px; font-weight: bold; text-align: center;">
        </div>
        <div style="width: 100%; float: left;">
            <div style="float: left" id="divRate" runat="server">
            </div>
        </div>
        <div style="width: 100%; float: left; margin-top: 25px; margin-bottom: 5px">
            <div id="lblSaleMonth" runat="server" style="float: left; width: 48%; color: green; margin-left: 10px; font-size: 25px; font-weight: bold; text-align: center;">
            </div>
            <div id="lblPurchaseMonth" runat="server" style="float: left; width: 48%; color: orange; margin-left: 10px; font-size: 25px; font-weight: bold; text-align: center;">
            </div>
        </div>
        <div style="width: 100%; float: left;">
            <div id="lblTotalSale" runat="server" style="float: left; text-shadow:1px 1px 4px white; margin-left: 10px; width: 48%; vertical-align: central; background-color: green; color: white; font-size: 50px; font-weight: bold; text-align: center; line-height: 100px">
            </div>
            <div id="lblTotalPurchase" runat="server" style="float: left; text-shadow:1px 1px 4px white; margin-left: 10px; width: 48%; background-color: orange; color: white; font-size: 50px; font-weight: bold; text-align: center; line-height: 100px; vertical-align: middle;">
            </div>
        </div>
        <div style="float: left; margin-top: 25px; margin-bottom: 5px; width: 100%; color: darkred; font-size: 25px; font-weight: bold; text-align: center;">
            Number of Products need to purchase
        </div>
        <div id="lblSafteyStock" runat="server" style="float: left;text-shadow:1px 1px 4px white; width: 100%; background-color: darkred; color: white; font-size: 50px; font-weight: bold; text-align: center; line-height: 100px; vertical-align: middle;"></div>

    </div>
</asp:Content>
