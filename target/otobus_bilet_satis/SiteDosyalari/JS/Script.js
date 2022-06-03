var counter = 0;
var totalImages = 0;
var contentRegionCollection;
var allOptions = false;
var isBusy = false;
var meSelectBox;
var meID;
var language;
var DepartureValue;
var ArrivalValue;
var DateValue;

function ResetStyle() {
    $("#NumberControl_Layout #Button").css("margin-left", "0");
    $("#NumberControl_Layout #Button").css("margin-top", "2px");
}
function makeReser() {
    $("#IsCepMoneyCode").remove();
    $("#IsCepMoneyPanel").remove();
}

var Value = "";
function IsLetterOnly(event) {
    var keyCode = event.charCode ? event.charCode : event.keyCode;
    Value = String.fromCharCode(keyCode);
    var ctrlKey = event.ctrlKey;
    if (event.keyCode == 37 || event.keyCode == 39)
    { return true; }
    if ((ctrlKey && keyCode == 118) || event.charCode == 46)
    { return false; }
    if (Ignored(keyCode) || !(keyCode > 47 && keyCode < 58) && SpecialCharacter(Value)) {
        return true;
    }
    return false;
}
function SpecialCharacter(val) {
    var control_regex = /^[a-zA-ZşŞıİçÇöÖüÜĞğ\s]*$/;
    return control_regex.test(val)
}
function IsNumericOnly(event) {
    var keyCode = event.charCode ? event.charCode : event.keyCode;
    if (keyCode != 32 && event.charCode != 46) {
        if (!event.shiftKey) {
            if ((Ignored(keyCode) && keyCode != 32) || (keyCode > 47 && keyCode < 58)) {
                return true;
            }
        }
    }
    return false;
}
function Ignored(keyCode) {
    if (keyCode == 8 || (Value != "%" && keyCode == 37) || keyCode == 16 || keyCode == 17 || (Value != "'" && keyCode == 39) || keyCode == 46 || keyCode == 9 || keyCode == 32) {
        return true;
    }
    return false;
}
function ChangeDate(index) {
    if ($("#TextVoyageDate").val() != '') {
        dateValue = $.datepicker.parseDate('dd.mm.yy', $("#TextVoyageDate").val());
        dateValue.setDate(dateValue.getDate() + (index));
        $("#TextVoyageDate").val($.datepicker.formatDate('dd.mm.yy', dateValue));
        $("#HeaderAllDate").html($.datepicker.formatDate('dd MM yy - DD', dateValue));
    }
}
function changeColor(object) {
    var OnlineSupportColor = "#C6C6C6";
    var ActiveLanguageColor = "#C6C6C6";
    var PasiveLanguageColor = "#555658";
    if (object.length > 0) {
        var colorcodes = $('input', object).val();
        var arrayColor = colorcodes.split(',');
        if (arrayColor[0].length > 0)
            OnlineSupportColor = arrayColor[0];
        if (arrayColor[1].length > 0)
            ActiveLanguageColor = arrayColor[1];
        if (arrayColor[2].length > 0)
            PasiveLanguageColor = arrayColor[2];
    }
    $("#OnlineSupportLink").css("color", OnlineSupportColor);
    Cufon.refresh('#OnlineSupportLink');
    if (language != "en") {
        $("#Turkish").css("color", ActiveLanguageColor);
        $("#English").css("color", PasiveLanguageColor);
        Cufon.refresh('#Language a');
    }
    else {
        $("#English").css("color", ActiveLanguageColor);
        $("#Turkish").css("color", PasiveLanguageColor);
        Cufon.refresh('#Language a');
    }

}
var ChangeTicketValue = false;
function ChangeTicketNotMember() {
    $("#CreditCardPanel").remove();
    $("#IsCepMoneyPanel").remove();
    $("#CreditCardTab").remove();
    $("#IsCepMoneyCode").remove();
    $("#ContactInfoPanel").css("left", "24px");
    $("#ContactInfoPanel").css("top", "90px");
    ChangeTicketValue = true;
}

function SetPassiveSelectBox() {
    $('.styled-select').each(function() {
        if ($(this).find('select').attr('disabled') == 'disabled') {
            $(this).addClass('disabled');
        } else {
            $(this).removeClass('disabled');
        }
    });
}
$(document).ready(function () {
    if (($.browser.msie && $.browser.version < 8.0)) {
        $("#SecurePageTitlePanel").css("width", "700px");
        $("#RememberYolKart_Header").css("position", "");
        $("#RememberYolKart_Header").css("margin-top", "");
        $("#RememberYolKart_Header").css("margin-left", "-176px");
        $("#TicketsGridContainer").css("display", "");
        $("#TicketsGridContainer").css("width", "650px");
        $("#TicketInfoTitle").css("margin-left", "-380px");
        $("#CB_TicketsGrid").css("margin-left", "0px");

    }
    if ($("#ContainerSMSSearch"))
    { $("#CustomPageLeftPanel").css("height", "265px") }

    if (($.browser.msie && $.browser.version <= 8.0)) {
        $("#RememberPassword_Header").css("margin-bottom", "20px");
        $("#RememberYolKart_Header").css("margin-bottom", "20px");
    }
    if ($("#CB_ConvertToReservationsGrid").length > 0) {
        $("#CreditCardContainer").css("display", "block");
        $("#CreditCardResultContainer").css("display", "block");
    }
    $("#PassengersContainer").css("display", $("#TicketInformation").css("display"));
    $("#PassengersHeader").css("display", $("#TicketInformation").css("display"));
    $(".styled-select select").change(function () {
        $(".styled-select select").each(function () {
            var text = $(this).find('option:selected').html();
            if (text != null || text != undefined) {
                if ($(this).parent().find("div").length < 1) {
                    $(this).parent().append($('<div>' + $(this).find('option:selected').html() + '</div>'));
                } else {
                    $(this).parent().find("div").html($(this).find('option:selected').html());
                }
            }
        });
    });
    $(".styled-select2 select").change(function () {
        $(".styled-select2 select").each(function () {
            var text = $(this).find('option:selected').html();
            if (text != null || text != undefined) {
                if ($(this).parent().find("div").length < 1) {
                    $(this).parent().append($('<div>' + $(this).find('option:selected').html() + '</div>'));
                } else {
                    $(this).parent().find("div").html($(this).find('option:selected').html());
                }
            }
        });
    });

    $(".styled-select select").each(function () {
        var text = $(this).find('option:selected').html();
        if (text != null || text != undefined) {
            if ($(this).parent().find("div").length < 1) {
                $(this).parent().append($('<div>' + $(this).find('option:selected').html() + '</div>'));
            } else {
                $(this).parent().find("div").html($(this).find('option:selected').html());
            }
        }
    });
    $(".styled-select2 select").each(function () {
        var text = $(this).find('option:selected').html();
        if (text != null || text != undefined) {
            if ($(this).parent().find("div").length < 1) {
                $(this).parent().append($('<div>' + $(this).find('option:selected').html() + '</div>'));
            } else {
                $(this).parent().find("div").html($(this).find('option:selected').html());
            }
        }
    });

    $(".styled-select select").keyup(function () {
        if ($(this).parent().find("div").length < 1) {
            $(this).parent().append($('<div>' + $(this).find('option:selected').html() + '</div>'))
        } else {
            $(this).parent().find("div").html($(this).find('option:selected').html())
        }
    });

    $(".styled-select2 select").keyup(function () {
        if ($(this).parent().find("div").length < 1) {
            $(this).parent().append($('<div>' + $(this).find('option:selected').html() + '</div>'))
        } else {
            $(this).parent().find("div").html($(this).find('option:selected').html())
        }
    });

    $(".MainBackground").css("background-position", "center top");
    $(".Banners").css("background-position", "center center");

    var HomePagePanelControl = $(".Banners").length;
    if (HomePagePanelControl > 0) {
        $(".VoyageTextBox").css("width", "121px");
        $("#TextVoyageDate").css("width", "118px");
    }
    contentRegionCollection = $("#ContentRegion div");

    var linkCollection = $("#CustomPageLeftPanel a");
    var UserNameInfo = $("#UserNameInfo")
    if (UserNameInfo.length > 0) {
        $("#SingOnTextContent").append("<div id='ClickDiv' onclick='OpenUserInfo()' style='width:" + (UserNameInfo[0].innerHTML.length * 8) + "px" + "' ></div>");
    }
    if (linkCollection.length > 0 && $("#HiddenValue").val() != '') {
        for (var i = 0; i < linkCollection.length; i++) {
            if (linkCollection[i].id == 'Type_' + $("#HiddenValue").val()) {
                $("#" + linkCollection[i].id).css("font-weight", "bold");
            }
        }
    }

    var WebposPageValue = $("#WebPosHiddenValue").val();
    if (WebposPageValue > 0) {
        $("#SelectBoxClick_0").css("left", "225px");
        $("#SelectBoxClick_1").css("left", "472px");
        $("#TextVoyageDate").css("left", "515px");
        $("#SelectVoyageArrival").css("left", "268px");
        $("#SelectVoyageDeparture").css("left", "21px");
        $("#TextVoyageArrival").css("left", "268px");
        $("#VoyageArrivalTitle").css("left", "268px");
        $("#VoyageDateTitle").css("left", "515px");
    }
    language = $("#LanguageCode").attr("class");
    changeColor($("#ContentRegion div:eq(0)"));
    totalImages = contentRegionCollection.length;
    if (totalImages <= 1) {
        $("#Next").css("display", "none");
        $("#Previous").css("display", "none");
    }
    contentRegionCollection.hide();
    $("#ContentRegion div:eq(" + counter + ")").fadeIn("slow");
    $("#Page_0").addClass("SelectedPoint");
    $(document).keyup(function (e) {
        KeyCode = e.charCode ? e.charCode : e.keyCode ? e.keyCode : e.which;
        if (KeyCode == 27) {
            var lightBoxWarning = $('#PaymentLBPanel div');
            var lightBox = $('#LBLayoutInfo div');
            if (lightBox.length > 0 || lightBoxWarning.length > 0) {
                ClosePaymentLB();
            }
            var lightBoxImages = $('#LightBoxCenterPanel img');
            if (lightBoxImages.length > 0) {
                CloseLightBox();
            }
        }
    });
    $("#CVC").focus(function () {
        $("#WhatisCvv").css("display", "block");
        CaseForCloseKeyPad(2);
    });
    $("#CreditCardNumber").focus(function () {
        CaseForCloseKeyPad(1);
    });
    $("#CVC").blur(function () {
        $("#WhatisCvv").css("display", "none");
    });
    $("#OpenUpMenu").click(function () {
        $("#ProfileInfo").animate({ height: "0" }, 300, function () {
            $("#ProfileInfo div").css("display", "none");
        });
    });
    $("#SelectVoyageFlights").change(function () {
        //$("#TextVoyageFlights").val($("#SelectVoyageFlights option:selected").html());
        //$("#SelectVoyageFlights").css("display", "none");
        //$("#SelectVoyageFlights").attr("size", "0");
        //$("#SelectBoxClick_2").css("background", "url('/Files/Images/Template.png') no-repeat scroll -317px -108px White");
        InitializePosition($("#SelectVoyageFlights option:selected").val());
    });
    var BannerID = "";
    $(".Banners").hover(function () {
        BannerID = $(this).attr("id").replace("Banner", "");
        $("#FooterPanelLayout").animate({ zIndex: 0 }, -1000);
        $(this).stop().animate({ height: "210px", bottom: "140px" }, 300, function () {
            $("#ContentRegion").animate({ opacity: 0.6 }, 300);
            $("#ContentRegion").css("filter", "alpha(opacity = 60)");
        });
        $("#BannerContentOpacity" + BannerID.toString()).stop().animate({ opacity: 0.35, height: 210 }, 300);
        $("#BannerContentOpacity" + BannerID.toString()).css("filter", "alpha(opacity = 35)");
        $("#BannerCampaignText" + BannerID.toString()).css("display", "block");
    }, function () {
        $(this).stop().animate({ height: "70px", bottom: "0" }, 300, function () {
            $("#ContentRegion").animate({ opacity: 1 }, 300);
            $("#ContentRegion").css("filter", "alpha(opacity = 100)");
        });
        $("#BannerContentOpacity" + BannerID.toString()).stop().animate({ opacity: 0.85, height: 70 }, 300);
        $("#BannerContentOpacity" + BannerID.toString()).css("filter", "alpha(opacity = 75)");
        $("#BannerCampaignText" + BannerID.toString()).css("display", "none");
        $("#FooterPanelLayout").animate({ zIndex: 5 }, 310);
    });
    $("#TextVoyageDate").keyup(function (e) {
        KeyCode = e.charCode ? e.charCode : e.keyCode;
        if (KeyCode == 13) {
            GetVoyageList();
        }
    });
    $("#TextVoyageDate").change(function () {
        GetVoyageList();
    });
    $(".cCB_PassengersForm_Column_IdentityNumber input").live('keypress', function (event) {
        $('.cCB_PassengersForm_Column_IdentityNumber input').attr('maxlength', '11');
        return IsNumericOnly(event);
    });
    $("#PhoneTextBox").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#OldPassword").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#NewPassword").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#NewPasswordConfirmation").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#PhoneNumber").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#CreditCardOwner").live('keypress', function (event) {
        return IsLetterOnly(event);
    });
    $("#CreditCardNumber").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#ContactPhone").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#CampaignPhoneNo").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#Identity").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#PhoneNumberRegister").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#RePasswordRegister").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#PasswordRegister").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#MemberPhoneNumber").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#YolKartNumber").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#HomePhone").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#MobilePhone").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#CellPhone1").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#CellPhone2").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#HomePhone2").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#HomePhone3").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
    $("#CVC").live('keypress', function (event) {
        return IsNumericOnly(event);
    });
});
function OpenUserInfo() {
    var UserNameInfo = $("#UserNameInfo")
    if (UserNameInfo.length > 0) {
        if ($("#ProfileInfo div").css("display") != "inline-block") {
            $("#ProfileInfo div").css("display", "inline-block");
            $("#ProfileInfo").animate({ height: 480 }, 300);
        }
        else {
            $("#ProfileInfo").animate({ height: "0" }, 300, function() {
                $("#ProfileInfo div").css("display", "none");
            });
        }
    }
}
function GoToUrl(url, target) {
    if (target != NaN && target != null && target != '')
        window.open(url, target);
    else
        window.location = url;
}
function GoToTicketUrl(url) {
    if (url == '' || url == undefined || url == NaN) {
        return false;
    }
    DepartureValue = $("#SelectVoyageDeparture option:selected").val();
    ArrivalValue = $("#SelectVoyageArrival option:selected").val();
    DateValue = $("#TextVoyageDate").val();
    if (ValidationGetVoyages(DepartureValue, ArrivalValue, DateValue))
        window.location = url + "?d=" + DepartureValue + "&a=" + ArrivalValue + "&da=" + DateValue;
}

function GetParams(parameters) {
    var sURLVariables = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < sURLVariables.length; i++) {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == parameters) {
            return sParameterName[1];
        }
    }
}
function validateEmail($email) {
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    if (!emailReg.test($email)) {
        return false;
    } else {
        return true;
    }
}
function ValidationRegisterPage() {
    $(".clean").remove();
    var Result = true;
    if ($("#Identity").val().length < 11) {
        $("#RegisterForm_Layout_Cell_0_0FieldsStructure_Cell_0_1").append("<div class='clean' style='color:red;float:right;padding-top: 10px;'>*</div>");
        Result = false;
    }
    if ($("#CaptchaCodeAnswer").val() == "") {
        $("#CaptchaContainer").append("<div class='clean' style=' color: red;margin-left: 204px;margin-top: -19px;position: absolute;'>*</div>");
        Result = false;
    }

    if ($("#PasswordRegister").val() == "" || $("#PasswordRegister").val().length < 4 || $("#PasswordRegister").val() != $("#RePasswordRegister").val()) {
        $("#RegisterForm_Layout_Cell_0_0FieldsStructure_Cell_2_1").append("<div class='clean' style='color:red;float:right;padding-top: 10px;'>*</div>");
        Result = false;
    }
    if ($("#RePasswordRegister").val() == "" || $("#RePasswordRegister").val().length < 4 || $("#PasswordRegister").val() != $("#RePasswordRegister").val()) {
        $("#RegisterForm_Layout_Cell_0_0FieldsStructure_Cell_3_1").append("<div class='clean' style='color:red;float:right;padding-top: 10px;'>*</div>");
        Result = false;
    }

    if ($("#PhoneNumberRegister").val().length < 10) {
        $("#RegisterForm_Layout_Cell_0_0FieldsStructure_Cell_4_1").append("<div class='clean' style='color:red;float:right;padding-top: 10px;'>*</div>");
        Result = false;
    }
    if (!$('#MembershipAgreementCheck').attr('checked')) {
        $("#MembershipAgreementLabel").append("<div class='clean' style='color:red;float:right;margin-left:10px;'>*</div>");
        Result = false;
    }
    return Result;

}

function HiddenHeader(type) {
    if (type == 1) {
        $("#GridHeaderContainer").css("display", "none");
        $("#gridcolumn").css("display", "none");
        $("#VoyagesContainer").css("display", "none");
    }
    else {
        $("#GridHeaderContainer").css("display", "block");
        $("#gridcolumn").css("display", "block");
        $("#VoyagesContainer").css("display", "block");
    }
}
function AlertRegisterPage(value) {
    $("#PasswordRegister").val("");
    $("#RePasswordRegister").val("");
    alert(value);
}

function ChangeTab(type) {
    if (type == 1) {
        if ($("#CreditCardPanel").css("display") == "block") { return; }
        AjaxAction("",
               'sequencenoClear',
                null,
                function (response) {
                    if (response.toString() == 'false') {
                        alert("Sistemde bir sorun oluştu.");
                    }
                    else {
                        $("#ContactPhone").attr("disabled", false);
                        $("#ContactEmail").attr("disabled", false);
                        $("#BarCode img").remove();
                        $("#Purchase").css("display", "block");
                        //$("#IsCepContract").css("display", "none");
                        $("#SalesCont").css("display", "block");
                        $("#SendBarCode").css("display", "none");
                        $("#SendBKM").css("display", "none");
                        $("#KoruncukInformation").css("display", "block");
                        $("#CreditCardTab").css("background", "url('/Files/Images/Template.png') no-repeat scroll -500px -607px transparent");
                        $("#IsCepMoneyCode").css("background", "url('/Files/Images/Template.png') no-repeat scroll -621px -607px transparent");
                        $("#BKMExpress").css("background", "url('/Files/Images/Template.png') no-repeat scroll -621px -607px transparent");

                        if ($("#IsCepMoneyPanel").css("display") == "block") {
                            $("#IsCepMoneyPanel").stop().animate({ height: 0 }, 500, function () {
                                $("#IsCepMoneyPanel").css("display", "none");
                                $("#BKMExpressPanel").css("display", "none");
                                $("#CreditCardPanel").css("display", "block");
//                                if ($("#HiddenMember").val() == "1") {
//                                    $("#ContactInfoPanel").animate({ height: 0 }, 500);
//                                    $("#ContactInfoPanel").css("display", "none");
//                                }
//                                else {
//                                    $("#ContactInfoPanel").animate({ height: 225 }, 500);
                                //}
                                $("#CreditCardPanel").animate({ height: 225 }, 500);
                            });
                        } else if ($("#BKMExpressPanel").css("display") == "block") {

                            $("#BKMExpressPanel").stop().animate({ height: 0 }, 500, function () {
                                $("#IsCepMoneyPanel").css("display", "none");
                                $("#BKMExpressPanel").css("display", "none");
                                $("#CreditCardPanel").css("display", "block");
//                                if ($("#HiddenMember").val() == "1") {
//                                    $("#ContactInfoPanel").animate({ height: 0 }, 500);
//                                    $("#ContactInfoPanel").css("display", "none");
//                                }
//                                else {
//                                    $("#ContactInfoPanel").animate({ height: 225 }, 500);
//                                }
                                $("#CreditCardPanel").animate({ height: 225 }, 500);
                            });
                        }
                    }

                },
                document.location);
    }
    else if (type == 2) {
        var Contract = 0;
        if ($("#SalesContract").attr("checked"))
            Contract = 1;
        var params = '&Contract=' + Contract + '&PhoneNumber=' + $("#ContactPhone").val() + '&Email=' + $("#ContactEmail").val();
        AjaxAction(params,
               'sequenceno',
                null,
                function (response) {
                    var array = response.toString().split('$');
                    if (array[0] == 'false') {
                        alert(array[1]);
                    }
                    else if (array[0] == 'true') {
                        $("#BarCode img").remove();
                        $("#BarCode").append("<img src='" + array[1] + "' style='-webkit-user-select: none'>");
                        $("#SendBarCode").css("display", "none");
                        $("#Purchase").css("display", "block");
                        $("#ContactPhone").attr("disabled", true);
                        $("#ContactEmail").attr("disabled", true);
                    }
                },
                document.location);
    }
    else if (type == 4) {
        var Contract = 0;
        if ($("#SalesContract").attr("checked"))
            Contract = 1;
        var params = '&Contract=' + Contract + '&PhoneNumber=' + $("#ContactPhone").val() + '&Email=' + $("#ContactEmail").val();
        AjaxAction(params,
        'refreshsequenceno',
        null,
        function (response) {
            var array = response.toString().split('$');
            if (array[0] == 'false') {
                alert(array[1]);
            }
            else if (array[0] == 'true' && $("#IsCepMoneyPanel").css("display") == "block") {
                $("#BarCode img").remove();
                // $("#BarCode").append("<img src='" + array[1] + "' style='-webkit-user-select: none'>");
                $("#SendBarCode").css("display", "block");
                $("#Purchase").css("display", "none");
                //$("#ContactPhone").attr("disabled", true);
                //$("#ContactEmail").attr("disabled", true);
            }
        },
        document.location);
    }
    else if (type == 3) {
        if ($("#IsCepMoneyPanel").css("display") == "block") { return; }
        $("#Purchase").css("display", "none");
        $("#CreditCardTab").css("background", "url('/Files/Images/Template.png') no-repeat scroll -621px -607px transparent");
        $("#BKMExpress").css("background", "url('/Files/Images/Template.png') no-repeat scroll -621px -607px transparent");
        $("#IsCepMoneyCode").css("background", "url('/Files/Images/Template.png') no-repeat scroll -500px -607px transparent");
//        if ($("#HiddenMember").val() == "1") {
//            $("#ContactInfoPanel").css("height", "0px");
//        }
        //$("#IsCepContract").css("display", "block");
        $("#SalesCont").css("display", "block");
        $("#SendBarCode").css("display", "block");
        $("#SendBKM").css("display", "none");
        $("#KoruncukInformation").css("display", "none");
        if ($("#CreditCardPanel").css("display") == "block") {
            $("#CreditCardPanel").stop().animate({ height: 0 }, 500, function () {
                $("#CreditCardPanel").css("display", "none");
                $("#IsCepMoneyPanel").css("display", "block");
                $("#IsCepMoneyPanel").stop().animate({ height: 215 }, 500);
                $("#ContactInfoPanel").css("display", "block");
                $("#ContactInfoPanel").stop().animate({ height: 255 }, 500);
            });
        } else if ($("#BKMExpressPanel").css("display") == "block") {
            $("#BKMExpressPanel").stop().animate({ height: 0 }, 500, function () {
                $("#CreditCardPanel").css("display", "none");
                $("#BKMExpressPanel").css("display", "none");
                $("#IsCepMoneyPanel").css("display", "block");
                $("#ContactInfoPanel").css("display", "block");
                //$("#ContactInfoPanel").stop().animate({ height: 255 }, 500);
                $("#IsCepMoneyPanel").stop().animate({ height: 215 }, 500);
            });

        }
    }
    else if (type == 5) {
        if ($("#BKMExpressPanel").css("display") == "block") { return; }
        $("#ContactPhone").attr("disabled", false);
        $("#ContactEmail").attr("disabled", false);
        $("#BarCode img").remove();
        $("#Purchase").css("display", "none");
        $("#BKMExpress").css("background", "url('/Files/Images/Template.png') no-repeat scroll -500px -607px transparent");
        $("#IsCepMoneyCode").css("background", "url('/Files/Images/Template.png') no-repeat scroll -621px -607px transparent");
        $("#CreditCardTab").css("background", "url('/Files/Images/Template.png') no-repeat scroll -621px -607px transparent");

        //$("#IsCepContract").css("display", "block");
        $("#SalesCont").css("display", "block");
        $("#SendBarCode").css("display", "none");
        $("#SendBKM").css("display", "block");
        $("#BKM").css("display", "block");
        $("#KoruncukInformation").css("display", "none");
        if ($("#CreditCardPanel").css("display") == "block") {
            $("#CreditCardPanel").stop().animate({ height: 0 }, 500, function () {
                $("#CreditCardPanel").css("display", "none");
                $("#IsCepMoneyPanel").css("display", "none");
                $("#BKMExpressPanel").css("display", "block");
                $("#ContactInfoPanel").css("display", "block");
                //$("#ContactInfoPanel").stop().animate({ height: 255 }, 500);
//                if ($("#HiddenMember").val() == "1") {
//                    $("#ContactInfoPanel").animate({ height: 0 }, 500);
//                    $("#ContactInfoPanel").css("display", "none");
//                }
//                else {
//                    $("#ContactInfoPanel").animate({ height: 225 }, 500);
//                }
                $("#BKMExpressPanel").animate({ height: 225 }, 500);
            });
        } else if ($("#IsCepMoneyPanel").css("display") == "block") {
            $("#IsCepMoneyPanel").stop().animate({ height: 0 }, 500, function () {
                $("#CreditCardPanel").css("display", "none");
                $("#IsCepMoneyPanel").css("display", "none");
                $("#BKMExpressPanel").css("display", "block");
                $("#ContactInfoPanel").css("display", "block");
                //$("#ContactInfoPanel").stop().animate({ height: 255 }, 500);
//                if ($("#HiddenMember").val() == "1") {
//                    $("#ContactInfoPanel").animate({ height: 0 }, 500);
//                    $("#ContactInfoPanel").css("display", "none");
//                }
//                else {
//                    $("#ContactInfoPanel").animate({ height: 225 }, 500);
//                }
                $("#BKMExpressPanel").animate({ height: 225 }, 500);
            });
        }
    } else if (type == 6) {
        var Contract = 0;
        var KoruncukContract = 0;
        if ($("#SalesContract").attr("checked"))
            Contract = 1;

        if ($("#KoruncukCheck").attr("checked"))
            KoruncukContract = 1;

        var params = '&Contract=' + Contract + '&PhoneNumber=' + $("#ContactPhone").val() + '&Email=' + $("#ContactEmail").val() + '&KoruncukContract=' + KoruncukContract + '&KoruncukEmail=' + $("#KoruncukEmail").val();
    AjaxAction(params,
               'BKMSend',
                null,
                function (response) {
                    var array = response.toString().split('$');
                    if (array[0] == 'false') {
                        alert(array[1]);

                    }
                    else if (array[0] == 'timeout') {
                        alert(array[1]);
                        window.location = array[2];
                    }
                    else {
                        if (response.indexOf('ERROR') > -1) {
                            alert(response);
                        }
                        else {
                            $("body").append(response);
                        } 
                    }
                },
                document.location);
    
    }
    else {
        return;
    }
}
function GetVoyageList() {
    if (Lock) {
        return;
    }
    isLoading(true);
    if (DepartureValue != $("#SelectVoyageDeparture option:selected").val() || ArrivalValue != $("#SelectVoyageArrival option:selected").val() || DateValue != $("#TextVoyageDate").val()) {
        DepartureValue = $("#SelectVoyageDeparture option:selected").val();
        ArrivalValue = $("#SelectVoyageArrival option:selected").val();
        DateValue = $("#TextVoyageDate").val();

        var ControlResult = DateControl(DateValue, null);
        if (!ControlResult) {
            isLoading(false);
            return;
        }
       
        ChangeDate(0);
        if (DepartureValue == undefined || ArrivalValue == undefined) {
            DepartureValue = GetParams("d");
            ArrivalValue = GetParams("a");
            DateValue = GetParams("da");
        }

        if (ValidationGetVoyages(DepartureValue, ArrivalValue, DateValue)) {
            getVoyagesForVoyage(DepartureValue, ArrivalValue, DateValue);
            $("#PassengerDepartureTitle").html($("#SelectVoyageDeparture option:selected").text());
            $("#PassengerArrivalTitle").html($("#SelectVoyageArrival option:selected").text());
            HiddenHeader(0);
            BusPanelCloseAndOpen(0);
        }
        else {
            getVoyagesForVoyage(1048, 1094, '01.01.2020');
            HiddenHeader(0);
            BusPanelCloseAndOpen(0);
            isLoading(false);
            return;
        }
    }
    isLoading(false);
    $("body,html").animate({ scrollTop: 230 }, 100);
}

var lastNo = 0;
function ChangeImage(no) {
    if (lastNo != no) {
        if (totalImages < no) { no = 0; }
        $("#Page_" + lastNo).removeClass("SelectedPoint");
        $("#Page_" + no).addClass("SelectedPoint");
        $("#ContentRegion div:eq(" + lastNo + ")").fadeOut("slow");
        $("#ContentRegion div:eq(" + no + ")").fadeIn("slow");
        lastNo = no;
    }
}

//function ChangeImage(type) {
//    counter = counter + type;
//    if (counter >= 0) {
//        if (counter < totalImages) {
//            GetImage(type);
//        }
//        else {
//            counter = 0;
//            GetImage(type);
//        }
//    }
//    else {
//        GetImage(type);
//    }
//    function GetImage(type) {
//        if (type == 1) {
//            $("#ContentRegion div:eq(" + counter + ")").fadeIn("slow");
//            if (counter == 0) {
//                $("#ContentRegion div:eq(" + (totalImages - 1) + ")").fadeOut("slow");
//            }
//            else {
//                $("#ContentRegion div:eq(" + (counter - 1) + ")").fadeOut("slow");
//            }
//            changeColor($("#ContentRegion div:eq(" + counter + ")"));
//        }
//        else {
//            if (counter < 0) {
//                counter = totalImages - 1;
//                $("#ContentRegion div:eq(" + counter + ")").fadeIn("slow");
//                $("#ContentRegion div:eq(0)").fadeOut("slow");
//            }
//            else {
//                $("#ContentRegion div:eq(" + counter + ")").fadeIn("slow");
//                $("#ContentRegion div:eq(" + (counter + 1) + ")").fadeOut("slow");
//            }
//            changeColor($("#ContentRegion div:eq(" + counter + ")"));
//        }
//    }
//}

function dummy_url_decode(url) {
    var o = url;
    var binVal, t, b;
    var r = /(%[^%]{2}|\+)/;
    while ((m = r.exec(o)) != null && m.length > 1 && m[1] != '') {
        if (m[1] == '+') {
            t = ' ';
        } else {
            b = parseInt(m[1].substr(1), 16);
            t = String.fromCharCode(b);
        }
        o = o.replace(m[1], t);
    }
    return o;
}
function SocialMediaShared(type) {
    var meUrl = document.URL;
    var OrientationUrl = "";
    if (type == null) {
        if (meUrl.indexOf("-") > -1) {
            meUrl = meUrl.substring(0, meUrl.indexOf("-"));
        }
        OrientationUrl = "http://www.facebook.com/sharer/sharer.php?u=" + meUrl + "-" + $("#LightBoxCenterPanel img:eq(" + counter + ")").attr("src");
        window.open(OrientationUrl, '_blank');
    } else if (type == 1) {
        var text = "";
        if ($.browser.msie) {
            text = "Kamil Koc sitesinden bir album paylasti.";
        }
        else {
            text = "Kamil Koç sitesinden bir albüm paylaştı.";
        }
        OrientationUrl = dummy_url_decode("https://twitter.com/share?url=" + meUrl + "&text=" + text);
        window.open(OrientationUrl, '_blank');
    }
}
function CloseLightBox() {
    $("#LightBoxBackgroundPanel").animate({ opacity: 0 }, 700);
    $("#LightBoxBackgroundLayout").animate({ opacity: 0 }, 700, function() {
        var lightBoxImages = $('#LightBoxCenterPanel img');
        var lightBoxDiv = $('#LightBoxCenterPanel div');
        $('#LightBoxBackgroundLayout').remove();
        $('#LightBoxBackgroundPanel').remove();
        lightBoxImages.css("display", "none");
        thisAlbum.append(lightBoxImages);
        thisAlbum.append(lightBoxDiv);
        thisAlbumInImage = null;
        totalAlbumImages = 0;
        counter = 0;
    });
    $("#LightBoxBackgroundPanel").css("filter", "alpha(opacity = 0)");
    $("#LightBoxBackgroundLayout").css("filter", "alpha(opacity = 0)");
}
var thisAlbum;
var totalAlbumImages = 0;
function ClosePaymentLB() {
    $("#PaymentLBLayout").animate({ opacity: 0 }, 300);
    $("#LBLayoutInfo").animate({ opacity: 0 }, 300);
    $("#PaymentLBArea").animate({ opacity: 0 }, 300, function() {
        $('#PaymentLBArea').remove();
        $('#PaymentLBLayout').remove();
        $('#LBLayoutInfo').remove();
    });
}
function LightBoxClose() {
    $("#LightBoxBackgroundPanel").animate({ opacity: 0 }, 700);
    $("#LightBoxBackgroundLayout").animate({ opacity: 0 }, 700, function() {
        var lightBoxImages = $('#LightBoxCenterPanel img');
        var lightBoxDiv = $('#LightBoxCenterPanel div');
        $('#LightBoxBackgroundLayout').remove();
        $('#LightBoxBackgroundPanel').remove();
        lightBoxImages.css("display", "none");
    });
    $("#LightBoxBackgroundPanel").css("filter", "alpha(opacity = 0)");
    $("#LightBoxBackgroundLayout").css("filter", "alpha(opacity = 0)");
}
function ShowLightBox(Object, selected, url) {
    if (selected != null || selected == 0) {
        counter = selected;
        var ImageCollection = $("img", Object);
        thisAlbum = Object;
        if (ImageCollection.length > 0) {
            $("body").append("<div id='LightBoxBackgroundPanel' onclick='CloseLightBox()'></div>");
            $("body").append("<div id='LightBoxBackgroundLayout'><div id='LightBoxCenterPanel'><a id='LightBoxClose' href='javascript:CloseLightBox();'></a><a id='ShareFacebook' title=\"Facebook'ta Paylaş\" href='javascript:SocialMediaShared();'></a><a id='ShareTwitter' title=\"Twitter'da Paylaş\" href='javascript:SocialMediaShared(1);'></a><a id='NextLink' href='javascript:LightBoxForImageChange(1);'></a><a id='PreviousLink'href='javascript:LightBoxForImageChange(-1);'></a> </div></div>");

            $("#LightBoxBackgroundPanel").animate({ opacity: 0.75 }, 700);
            $("#LightBoxBackgroundLayout").animate({ opacity: 1 }, 700);
            $("#LightBoxBackgroundPanel").css("filter", "alpha(opacity = 75)");
            $("#LightBoxBackgroundLayout").css("filter", "alpha(opacity = 100)");
            if (ImageCollection.length < 2) {
                $("#NextLink").css("display", "none");
                $("#PreviousLink").css("display", "none");
            }
            ImageCollection.css("display", "block");
            for (var i = 0; i < ImageCollection.length; i++) {
                ImageCollection.eq(i).css("position", "relative");
                ImageCollection.eq(i).css("border", "solid");
                ImageCollection.eq(i).css("z-index", "101");
                $("#LightBoxCenterPanel").append(ImageCollection.eq(i));
            }
            totalAlbumImages = $("#LightBoxCenterPanel img").length;
            $("#LightBoxCenterPanel img").hide();
            $("#LightBoxCenterPanel img:eq(" + counter + ")").fadeIn("slow");
            PositionImage($("#LightBoxCenterPanel img:eq(" + counter + ")"), 0);
        }
    }
    else {
        window.location = url;
    }
}
function PositionImage(Object, type) {
    var height = Object.height();
    var width = Object.width();
    $('#LightBoxBackgroundLayout').css("margin-left", (-1 * (width / 2)) + "px");
    $('#LightBoxBackgroundLayout').css("margin-top", (-1 * (height / 2)) + "px");
    $("#PreviousLink").css("top", (height / 2));
    $("#NextLink").css("top", (height / 2));
    $("#NextLink").css("left", (width - 30));
    $("#ShareFacebook").css("left", (width - 50));
    $("#ShareTwitter").css("left", (width - 30));
}
function LightBoxForImageChange(type) {
    counter = counter + type;
    if (counter >= 0) {
        if (counter < totalAlbumImages) {
            GetImageForLightBox(type);
        }
        else {
            counter = 0;
            GetImageForLightBox(type);
        }
    }
    else {
        GetImageForLightBox(type);
    }
    function GetImageForLightBox(type) {
        if (type == 1) {
            if (counter == 0) {
                $("#ShareFacebook").fadeOut("fast");
                $("#ShareTwitter").fadeOut("fast");
                $("#LightBoxClose").fadeOut("fast");
                $("#LightBoxCenterPanel img:eq(" + (totalAlbumImages - 1) + ")").fadeOut("fast", function() {
                    $("#LightBoxCenterPanel img:eq(" + counter + ")").fadeIn("fast");
                    $("#ShareFacebook").fadeIn("fast");
                    $("#ShareTwitter").fadeIn("fast");
                    $("#LightBoxClose").fadeIn("fast");
                    PositionImage($("#LightBoxCenterPanel img:eq(" + counter + ")"));
                });
            }
            else {
                $("#ShareFacebook").fadeOut("fast");
                $("#ShareTwitter").fadeOut("fast");
                $("#LightBoxClose").fadeOut("fast");
                $("#LightBoxCenterPanel img:eq(" + (counter - 1) + ")").fadeOut("fast", function() {
                    $("#LightBoxCenterPanel img:eq(" + counter + ")").fadeIn("fast");
                    $("#ShareFacebook").fadeIn("fast");
                    $("#ShareTwitter").fadeIn("fast");
                    $("#LightBoxClose").fadeIn("fast");
                    PositionImage($("#LightBoxCenterPanel img:eq(" + counter + ")"));
                });
            }
        }
        else {
            if (counter < 0) {
                counter = totalAlbumImages - 1;
                $("#ShareFacebook").fadeOut("fast");
                $("#ShareTwitter").fadeOut("fast");
                $("#LightBoxClose").fadeOut("fast");
                $("#LightBoxCenterPanel img:eq(0)").fadeOut("fast", function() {
                    $("#LightBoxCenterPanel img:eq(" + counter + ")").fadeIn("fast");
                    $("#ShareFacebook").fadeIn("fast");
                    $("#ShareTwitter").fadeIn("fast");
                    $("#LightBoxClose").fadeIn("fast");
                    PositionImage($("#LightBoxCenterPanel img:eq(" + counter + ")"));
                });
            }
            else {
                $("#ShareFacebook").fadeOut("fast");
                $("#ShareTwitter").fadeOut("fast");
                $("#LightBoxClose").fadeOut("fast");
                $("#LightBoxCenterPanel img:eq(" + (counter + 1) + ")").fadeOut("fast", function() {
                    $("#LightBoxCenterPanel img:eq(" + counter + ")").fadeIn("fast");
                    $("#ShareFacebook").fadeIn("fast");
                    $("#ShareTwitter").fadeIn("fast");
                    $("#LightBoxClose").fadeIn("fast");
                    PositionImage($("#LightBoxCenterPanel img:eq(" + counter + ")"));
                });
            }
        }
    }
}
function Random() {
    var randomNum = Math.floor((Math.random() * 100) + 1);
    return randomNum.toString();
}
function isLoading(status) {
    if (status && ($("#LoadingImage") == null || $("#LoadingImage") == undefined)) {
        $("body").append("<div id='LoadingImage'></div>");
        $("#LoadingImageContainer").css("display", "block");
    }
    else {
        if ($("#LoadingImage") != null && $("#LoadingImage") != undefined) {
            var timeOut = setTimeout(function() { $("#LoadingImage").remove(); }, 1000);
            $("#LoadingImageContainer").css("display", "none");
        }
    }
}
var loadinginterval;
function isVoyageLoading(status) {
    if (status && $("#LoadingImage").val() == undefined) {
        $("body").append("<div style='display:block;' id='LoadingImage'></div>");
    }
    else {
        loadinginterval = window.setInterval('UnloadAnimatedGif();', 1000);
    }
}
function UnloadAnimatedGif() {
    $("#LoadingImage").remove();
    window.clearInterval(loadinginterval);
}
function AjaxVoyageAction(parameters, Action, controlPanel, callBackFunction, Url) {
    if (!isBusy) {
        isBusy = true;
        isVoyageLoading(isBusy);
        $.ajax({
            type: "POST",
            cache: false,
            url: Url + '?rnd=' + Random(),
            async: false,
            data: 'AjaxRequest=' + Action + parameters,
            success: function(response) {
                if (response != '' && response != 'false') {
                    if (callBackFunction != undefined) {
                        callBackFunction(response);
                    }
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert("Sistemde hata oluştu. Lütfen daha sonra tekrar deneyiniz.");
                window.location = document.location;
            }
        });
        isBusy = false;
        isVoyageLoading(isBusy);
    }
}
function AjaxAction(parameters, Action, controlPanel, callBackFunction, Url) {
    if (!isBusy) {
        isBusy = true;
        isVoyageLoading(isBusy);
        $.ajax({
            type: "POST",
            cache: false,
            url: Url + '?rnd=' + Random(),
            async: false,
            data: 'AjaxRequest=' + Action + parameters,
            success: function (response) {
                if (response != '' && response != 'false') {
                    if (callBackFunction != undefined) {
                        callBackFunction(response);
                    }
                }
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert("Sistemde hata oluştu. Lütfen daha sonra tekrar deneyiniz.");
                window.location = document.location;
            }
        });
        isBusy = false;
        isVoyageLoading(isBusy);
    }
}
function GetDistricts() {
    meSelectBox.html('');
    $("#TextDistrict").val('');
    var callBackFunction = function(response) {
        $(meSelectBox).html($(response).html());
        $('#SelectBoxDistrict option')[0].selected = "true";
        $("#TextDistrict").val($("#SelectBoxDistrict option:selected").html());
        $("#SelectBoxDistrict").filterByText($("#TextDistrict"), true);
    };
    parameters = '&ProvinceID=' + $(meID).val();
    AjaxAction(parameters, 'LoadDistricts', meSelectBox, callBackFunction, '/webpos/77');
}
function Load(me, oSelectBox) {
    meID = me;
    meSelectBox = oSelectBox;
}
function deleteselectreservation() {
    var CheckBoxCheckedCount = $("#CB_ReservationsGrid input:checked").length;
    if (CheckBoxCheckedCount > 0) {
        var message = '';
        if ($("#CurrentLanguage").val() == "TUR")
            message = "Rezervasyonlar silinecektir. Emin misiniz?";
        else
            message = "Do you Really want to do this?";
        var resids = "";
        for (var i = 0; i < CheckBoxCheckedCount; i++) {
            var ID = $("#CB_ReservationsGrid input:checked").eq(i).attr("id").replace("CB_ReservationsGridForm_Row_ID_", "");
            ID = ID.replace("CheckBox", "");
            resids += ID;
            if (i != (CheckBoxCheckedCount - 1)) {
                resids += ",";
            }
        }
        var answer = confirm(message);
        if (answer) {
            AjaxAction('&ReservationIDs=' + resids,
               'deleteselectreservation',
                null,
                function(response) {
                    if (response == "falsetr") {
                        alert('Rezervasyonlarınız iptal edilemedi. Lütfen daha sonra tekrar deneyiniz.');
                    }
                    else if (response == "falseeng") {
                        alert('Selected reservations can not be cancelled. Please try again later.');
                    }
                    else {
                        window.location = document.location;
                    }
                },
                document.location);
        }
    }
    else {
        if ($("#CurrentLanguage").val() == "TUR") {
            message = "Rezervasyon seçmelisiniz.";
            alert(message);
        }
        else {
            message = "Select reservation";
            alert(message);
        }
    }

}
function VoyageInformation(rowid, index, meValues) {
    AjaxAction('',
               'voyageInformation',
                null,
                function(response) {
                    if (response.toString() != 'ok') {
                        var array = response.toString().split('$');
                        if (array[0] == 'false') {
                            alert(array[1]);
                        }
                        else {
                            alert(array[1]);
                        }
                    }
                },
                document.location);
}
function OpensmsPanel() {
    $("#SendRefNumber").css("display", "block");
    $("#SendRefNumber").css("overflow", "hidden");
    $("#SendRefNumber").stop().animate({ height: "100px" }, 300);
}
function deleteselectticket() {
    var CheckBoxCheckedCount = $("#CB_TicketsGrid input:checked").length;
    if (CheckBoxCheckedCount > 0) {
        var message = '';
        if ($("#CurrentLanguage").val() == "TUR")
            message = "Biletler silinecektir. Emin misiniz?";
        else
            message = "Do you want to continue your tickets will be deleted";
        var resids = "";
        for (var i = 0; i < CheckBoxCheckedCount; i++) {
            var ID = $("#CB_TicketsGrid input:checked").eq(i).attr("id").replace("CB_TicketsGridForm_Row_ID_", "");
            ID = ID.replace("CheckBox", "");
            resids += ID;
            if (i != (CheckBoxCheckedCount - 1)) {
                resids += ",";
            }
        }
        var answer = confirm(message);
        if (answer) {
            AjaxAction('&TicketIDs=' + resids,
               'deleteselectticket',
                null,
                function(response) {
                    if (response == "falsetr") {
                        alert('Biletleriniz iptal edilemedi. Lütfen daha sonra tekrar deneyiniz.');
                    }
                    else if (response == "falseeng") {
                        alert('Selected tickets can not be cancelled. Please try again later.');
                    }
                    else {
                        window.location = document.location;
                    }
                },
                document.location);
        }
    }
    else {
        if ($("#CurrentLanguage").val() == "TUR") {
            message = "Rezervasyon seçmelisiniz.";
            alert(message);
        }
        else {
            message = "Select reservation";
            alert(message);
        }
    }

}
function SendToSmsRef() {
    var CheckBoxCheckedCount = $("#CB_TicketsGrid input:checked").length;
    if (CheckBoxCheckedCount > 0) {
        var resids = "";
        for (var i = 0; i < CheckBoxCheckedCount; i++) {
            var ID = $("#CB_TicketsGrid input:checked").eq(i).attr("id").replace("CB_TicketsGridForm_Row_ID_", "");
            ID = ID.replace("CheckBox", "");
            resids += ID;
            if (i != (CheckBoxCheckedCount - 1)) {
                resids += ",";
            }
        }
        AjaxAction('&TicketIDs=' + resids + '&PhoneNumber=' + $("#PhoneSelectBox").val() + $("#PhoneTextBox").val(),
               'SendToSmsRef',
                null,
                function(response) {
                    alert(response);
                },
                document.location);

    }
    else {
        alert('Bilet seçmelisiniz.');
    }
}

function deletereservation(resid) {
    var message = '';
    if ($("#CurrentLanguage").val() == "TUR") {
        message = "Rezervasyon silinecektir. Emin misiniz?";
    }
    else {
        message = "Do you Really want to do this?";
    }
    var answer = confirm(message);
    if (answer) {
        AjaxAction('&ReservationID=' + resid + '&delete=1',
               'deletereservation',
                null,
                function(response) {
                    if (response == "falsetr") {
                        alert('Rezervasyonunuz iptal edilemedi. Lütfen daha sonra tekrar deneyiniz.')
                    }
                    else if (response == "falseeng") {
                        alert('Selected reservation can not be cancelled. Please try again later.')
                    }
                    else {
                        document.location = response;
                    }
                },
                document.location);
    }
}
function deleteticket(resid) {

    var message = '';
    if ($("#CurrentLanguage").val() == "TUR") {
        message = "Biletleriniz silinecektir. Emin misiniz?";
    }
    else {
        message = "Do you want to continue your ticket will be deleted?";
    }
    var answer = confirm(message);
    if (answer) {
        AjaxAction('&TicketID=' + resid + '&delete=1',
               'deleteticket',
                null,
                function(response) {
                    var array = response.toString().split(';');
                    if (array.length == 1) {
                        if (response == "falsetr") {
                            alert('Biletiniz iptal edilemedi. Lütfen daha sonra tekrar deneyiniz.');
                        }
                        else if (response == "falseeng") {
                            alert('Selected ticket can not be cancelled. Please try again later.');
                        }
                    }
                    else if (array[0] == "delete") {
                        document.location = array[1] + "?deleteType=" + array[2];
                    }
                    else {
                        alert(array[0]);
                        document.location = array[1];
                    }
                },
                document.location);
    }
}
function sendReservation() {
    var params = '';
    AjaxAction(params,
               'makeReservation',
                null,
                function(response) {
                    var array = response.toString().split('$');
                    if (array[0] == 'false') {
                        alert(array[1]);
                    }
                    else if (array[0] == 'true') {
                        window.location = array[1];
                    } else {
                        window.location = "/";
                    }

                },
                document.location);
}
function ValidateContactUsForm(form) {
    var message = "";
    var ContactUsForm = $(form).get(0);
    var Email = ContactUsForm["EmailAddress"].value;
    var CellPhone = ContactUsForm["MobilePhone"].value;
    var YolkartNo = ContactUsForm["YolKartNumber"].value;
    var Captcha = ContactUsForm["CaptchaCodeAnswer"].value;
    var userMessage = ContactUsForm["Message"].value;
    var SubjectHeader = ContactUsForm["SubjectHeader"].value;
    var Result = true;

    if (Captcha == null || Captcha == "") {
        message = messageCaptcha;
        Result = false;
    }

    if (userMessage == null || userMessage == "") {
        message = messageRequired;
        Result = false;
    }

    if (SubjectHeader == null || SubjectHeader == "") {
        message = messageSubjectHeader;
        Result = false;
    }

    if (Email == null || Email == "") {
        message = messageCheckYourEmail;
        Result = false;
    } else if (!IsEmail(Email)) {
        message = messageMailValid;
        Result = false;
    }

    if (!Result) {
        alert(message);
    }
    return Result;
}

function SubjectDetailTypesOnChange(control) {
    $('.DetailInfos').attr('disabled', 'disabled');
    $('#DepartureDate').attr('disabled', 'disabled');
    if (control.value == '0') {
        $('#BusRoute').removeAttr('disabled');
        $('#DepartureDate').removeAttr('disabled');
        $('#Picker img').css("display", "inline-block");
    } else if (control.value == '1') {
        $('#Bureaus').removeAttr('disabled');
    } else if (control.value == '2') {
        $('#StopOvers').removeAttr('disabled');
    }
    $('#SubjectDetailTypes').removeAttr('disabled');
    SetPassiveSelectBox();
}
function SubjectTypesOnChange(SubjectTypes) {
    if (SubjectTypes.value == '3' || SubjectTypes.value == '5') {
        $('#SubjectDetailTypes').removeAttr('disabled');
        $('#BusRoute').removeAttr('disabled');
        $('#DepartureDate').removeAttr('disabled');
        $('#Picker img').css("display", "inline-block");
    } else {
        $('.DetailInfos').attr('disabled', 'disabled');
        $('#SubjectDetailTypes').val('0');
        $('#DepartureDate').attr('disabled', 'disabled');
        $('#Picker img').css("display", "none");
        
    }
    SetPassiveSelectBox();
}

function CaseForCloseKeyPad(CaseRemove) {
    if ($('#VirtualKeyPad').css("top") == "-108px" && CaseRemove == 2) {
        CloseKeyPad();
    }
    else if ($('#VirtualKeyPad').css("top") == "-80px" && CaseRemove == 1) {
        CloseKeyPad();
    }
}
function CloseKeyPad() {
    $('#VirtualKeyPad').remove();
    $('#WhatisCvv').css("display", "none");
}
function ClearCardValue(control) {
    if (control == 1) { $('#CreditCardNumber').val(''); }
    else if (control == 2) { $('#CVC').val(''); }
}
function SetCardValue(value, control) {
    if (control == 1) {
        if ($('#CreditCardNumber').val().length < 16)
            $('#CreditCardNumber').val($('#CreditCardNumber').val() + value);
    }
    else if (control == 2) {
        if ($('#CVC').val().length < 4)
            $('#CVC').val($('#CVC').val() + value);
    }
}
var closeControl = 0;
function DrawKeyPad(clickControl) {
    CloseKeyPad();
    closeControl = clickControl;
    var nCount = "";
    var sTop = "-108px";
    var sRight = "-92px";
    if (clickControl != 1) {
        sTop = "-80px";
        sRight = "45px";
        $('#WhatisCvv').css("display", "block");
    }
    var sKeyPad = "<div id='VirtualKeyPad' style='background-color: #F3F3F3;border: 1px solid black;height: 162px;padding:10px;position:absolute;border-radius: 10px;right:" + sRight + ";top:" + sTop + ";width: 175px;'>";
    sKeyPad += "<div style='background-color:#E3E6EA;border: 1px solid black;height:133px;position:relative;width: 175px;padding-top:28px;border-radius: 10px;'>";
    for (var i = 1; i < 13; i++) {
        nCount = i.toString();
        if (i == 10) { nCount = "0"; }
        if (i == 11)
            sKeyPad += "<a href='javascript:ClearCardValue(" + clickControl + ");' style ='height:18px;width:45px;background-color:red;text-decoration:none;color:white;border-radius:5px;border:solid 1px gray;margin:1px;padding-top:3px;'>Sil</a>";
        else if (i == 12)
            sKeyPad += "<a href='javascript:CloseKeyPad();' style ='height:18px;width:45px;background-color:green;text-decoration:none;color:white;border-radius:5px;border:solid 1px gray;margin:1px;padding-top:3px;'>Kapat</a>";
        else
            sKeyPad += "<a href='javascript:SetCardValue(" + nCount + "," + clickControl + ");' style ='height:17px;color:black;width:45px;background-color:white;text-decoration:none;border-radius:5px;border:solid 1px gray;margin:1px;padding-top:4px;'>" + nCount + "</a>";

    }
    sKeyPad += "</div></div>";
    $('#CreditCardPanel').append(sKeyPad);
}
function LoadKeyPad(clickControl) {
    if (closeControl == 0) {
        DrawKeyPad(clickControl);
    }
    else if (closeControl == clickControl) {
        CloseKeyPad();
        closeControl = 0;
    }
    else {
        DrawKeyPad(clickControl);
    }
}

function LockTextInPage() {
    //No text selection, in IE
    document.onselectstart = function() {
        if (event.srcElement.type != "text" && event.srcElement.type != "textarea" && event.srcElement.type != "password" && event.srcElement.type != "select") {
            return false;
        } else {
            return true;
        }
    };
    //No text selection, in Firefox
    document.onmousedown = function(e) {
        if ((!$.browser.msie && !$.browser.version < 8.0)) {
            var obj = e.target;
            if (obj.tagName.toUpperCase() == "INPUT" || obj.tagName.toUpperCase() == "TEXTAREA" || obj.tagName.toUpperCase() == "PASSWORD" || obj.tagName.toUpperCase() == "SELECT") {
                return true;
            } else {
                return false;
            }
        }
        else {
            if (event.srcElement.type != "text" && event.srcElement.type != "textarea" && event.srcElement.type != "password" && event.srcElement.type != "select-one") {
                return false;
            } else {
                return true;
            }
        }
    };
    //    Close key ctrl
    //    window.onkeydown = function(e) {
    //        if (e.ctrlKey) {
    //            return false;
    //        }
    //    };
    document.oncontextmenu = function() { return false; };
}