var IsCompleted = true;
var LastClickLink = "Online";
function randomize() {
    return ((Math.floor(Math.random() * 10000)) + 100)
}
$(document).ready(function() {
    if (document.getElementById('FunctionalDeparture') != null)
        document.getElementById('FunctionalDeparture').selectedIndex = 0;
});

function AjaxFunction(url, params, CallBackFunction) {
    $.ajax({
        type: 'POST',
        beforeSend: function(XMLHttpRequest) {
            XMLHttpRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
        },
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        url: '/' + url + '/?rnd=' + randomize().toString(),
        data: params + '&Protocol=' + window.location.protocol,
        success: function(response) {
            IsCompleted = true;
            isLoading(false);
            if (CallBackFunction != null && CallBackFunction != undefined) {
                CallBackFunction(response);
            }
        },
        error: function(XMLHttpRequest, txtStatus, errorThrown) { IsCompleted = true; isLoading(false); }
    });
}
function isLoading(status, elementName, cssName, value, hasBigImg, hasConfirmMsg) {
    if (status) {
        ClearLoading();
        $("#" + elementName).append("<div id='LoadingImage'>" + ((hasConfirmMsg) ? "<div style='margin-left:35px;margin-top: 7px;'>" + hasConfirmMsg + "</div>" : "") + "</div>");
        if (cssName != "" && value != "") {
            $("#LoadingImage").css(cssName, value + "px");
            $("#LoadingImage").css("position", "absolute");
            $("#LoadingImage").css("left", "-40px");
        }
        if (hasBigImg != null && hasBigImg != undefined && hasBigImg) {
            $("#LoadingImage").css("background-image", "url('/Files/Images/NewVersion/MainLoaderBig.gif')");
        }
    }
    else {
        ClearLoading();
    }
}
function ClearLoading() {
    if ($("#LoadingImage") != null && $("#LoadingImage") != undefined) {
        $("#LoadingImage").remove();
    }
}
var oldElement = null;
function FunctionalButtonClick(element) {
    var top = 0;
    var elementID = element.attr("id");
    if (elementID == "MyTickets")
        top = 37;
    else if (elementID == "WherePassenger")
        top = 85;
    else if (elementID == "Card")
        top = 132;
    else if (elementID == "Suggestions")
        top = 184;
    else
        top = -12
    $("#SelectLink").stop().animate({ top: top }, 600);
    if (oldElement != null && oldElement != undefined) {
        oldElement.attr("class", "UnClick");
    }
    else {
        oldElement = $(".Click");
        oldElement.attr("class", "UnClick");
    }
    oldElement = element;
    element.attr("class", "Click");
    Cufon.refresh();
}
function GetOnlinePanel(element) {
    if (LastClickLink != element.attr("id")) {
        LastClickLink = element.attr("id");
        FunctionalButtonClick(element);
        if (IsCompleted) {
            IsCompleted = false;
            isLoading(true, "FunctionalPanel", "top", "-25", false, "");
            AjaxFunction("AjaxRequest", "OP=GetOnline", GetOnlinePanelCallBack);

        }
    }
}
function GetMyTicketsPanel(element) {
    if (LastClickLink != element.attr("id")) {
        LastClickLink = element.attr("id");
        FunctionalButtonClick(element);
        if (IsCompleted) {
            IsCompleted = false;
            isLoading(true, "FunctionalPanel", "top", "-25", false, "");
            AjaxFunction("AjaxRequest", "OP=GetMyTickets", GetMyTicketsPanelCallBack);
        }
    }
}
function GetWherePassengerPanel(element) {
    if (LastClickLink != element.attr("id")) {
        LastClickLink = element.attr("id");
        FunctionalButtonClick(element);
        if (IsCompleted) {
            IsCompleted = false;
            isLoading(true, "FunctionalPanel", "top", "-25", false, "");
            AjaxFunction("AjaxRequest", "OP=GetWherePassenger", GetWherePassengerPanelCallBack);
        }
    }
}
function GetCardPanel(element) {
    if (LastClickLink != element.attr("id")) {
        LastClickLink = element.attr("id");
        FunctionalButtonClick(element);
        if (IsCompleted) {
            IsCompleted = false;
            isLoading(true, "FunctionalPanel", "top", "-25", false, "");
            AjaxFunction("AjaxRequest", "OP=GetCard", GetCardPanelCallBack);
        }
    }
}
function GetOnlinePanelCallBack(responseText) {
    if (responseText != null && responseText != undefined && responseText != '') {
        var element = $(responseText);
        $("#FunctionalPanel").html(element.html());
        var VoyageDate = $("#VoyageDate");
        VoyageDate.datepicker("destroy");
        var myDate = new Date();
        VoyageDate.datepicker({ showOn: 'button', buttonImage: '/Files/Images/btn_calendar.png', buttonImageOnly: true, minDate: new Date(myDate.getFullYear(), myDate.getMonth(), myDate.getDate()) });
        Cufon.replace('#FunctionalPanel a');
    }
}
function GetMyTicketsPanelCallBack(responseText) {
    if (responseText != null && responseText != undefined && responseText != '') {
        var element = $(responseText);
        $("#FunctionalPanel").html(element.html());
        Cufon.replace('#FunctionalPanel a');
    }
}
function GetWherePassengerPanelCallBack(responseText) {
    if (responseText != null && responseText != undefined && responseText != '') {
        var element = $(responseText);
        $("#FunctionalPanel").html(element.html());
        Cufon.replace('#FunctionalPanel a');
    }
}
function GetCardPanelCallBack(responseText) {
    if (responseText != null && responseText != undefined && responseText != '') {
        var element = $(responseText);
        $("#FunctionalPanel").html(element.html());
        Cufon.replace('#FunctionalPanel a');
    }
}
function Selection(element, height) {
    var SelectedPanel = $(".OpenSelectionPanel");
    SelectedPanel.stop().animate({ height: 0 }, 600, function() {
        SelectedPanel.attr("class", "NotOpenSelectionPanel");
        SelectedPanel.css("display", "none");
    });
    var OpeningPanel = element.next();
    OpeningPanel.css("display", "block");
    OpeningPanel.stop().animate({ height: height }, 600, function() {
        OpeningPanel.attr("class", "OpenSelectionPanel");
    });
}
function LoginAndMyTickets() {
    if (EmptyControl($("#FunctionalLoginUserNo")) && EmptyControl($("#FunctionalLoginPassword"))) {
        if (IsCompleted) {
            IsCompleted = false;
            isLoading(true, "FunctionalPanel", "top", "-25", false, "");
            var UserNo = $("#FunctionalLoginUserNo").val();
            var Password = $("#FunctionalLoginPassword").val();
            AjaxFunction("AjaxRequest", "OP=LoginAndMyTickets&UserNo=" + UserNo + "&Password=" + Password + "&RememberMe=" + $("#FunctionalRememberMe").val(), LoginAndMyTicketsCallBack);
        }
    }
}
function LoginAndMyTicketsCallBack(responseText) {
    if (responseText != "False") {
        window.location = responseText;
    }
    else
    { alert("Kullanıcı bilgileri hatalı.")}
}
function Login() {
    if (EmptyControl($("#FunctionalLoginUserNo")) && EmptyControl($("#FunctionalLoginPassword"))) {
        if (IsCompleted) {
            IsCompleted = false;
            isLoading(true, "FunctionalPanel", "top", "-25", false, "");
            var UserNo = $("#FunctionalLoginUserNo").val();
            var Password = $("#FunctionalLoginPassword").val();
            AjaxFunction("AjaxRequest", "OP=Login&UserNo=" + UserNo + "&Password=" + Password + "&RememberMe=" + $("#FunctionalRememberMe").val(), LoginCallBack);
        }
    }
}
function LoginCallBack(responseText) {
    if (responseText != "False") {
        window.location = responseText;
    }
}


function SearchTicket(element, type) {
    if (EmptyControl(element)) {
        if (IsCompleted) {
            IsCompleted = false;
            isLoading(true, "FunctionalPanel", "top", "-25", false, "");
            var SearchValue = element.val();
            AjaxFunction("AjaxRequest", "OP=SearchTicket&SearchValue=" + SearchValue + "&SearchType=" + type, SearchTicketCallBack);
        }
    }
}
function SearchTicketCallBack(responseText) {
    if (responseText != "False") {
        window.location = responseText;
    }
}
function EmptyControl(element) {
    if (element.val() == "") {
        element.css("border", "1px solid red");
        return false;
    }
    return true;
}
function EmptySelectBox(element) {
    if (element.children(":selected").val() != "" && element.children(":selected").val() != undefined && element.children(":selected").val() != null && element.children(":selected").val() != "0") {
        return true;
    }
    else {
        element.css("border", "1px solid red");
        return false;
    }
}
function DateValidation(element) {
    var controlTime = DateControl(element.val(), 1);
    if (element.val() != null && element.val() != NaN && element.val() != '' && element.val() != undefined && controlTime) {
        return true;
    }
    else {
        element.css("border", "1px solid red");
        return false;
    }
}
function EmailValidation(element) {
    if (IsEmail(element.val())) {
        return true;
    }
    else {
        element.css("border", "1px solid red");
        return false;
    }
}

function WherePassengerArrival(element) {
    if (IsCompleted) {
        IsCompleted = false;
        isLoading(true, "FunctionalPanel", "top", "-25", false, "");
        var DepartureID = element.children(":selected").val();
//        if (DepartureID == '1227') {
//            alert("1 Mart 2014 tarihi itibari ile Denizli Otogar taşınacaktır.Yeni adres :TOPRAKLI MAH İZMİR BULVARI NO:41 PERON:6,7")
//        }
        AjaxFunction("AjaxRequest", "OP=GetLoadArrivals&DepartureID=" + DepartureID, WherePassengerArrivalCallBack);
    }
}
function WherePassengerArrivalCallBack(responseText) {
    if (responseText != "False") {
        var element = $(responseText);
        $("#FunctionalArrival").html(element.html());
    }
}
function WherePassengerFlight(element, appendElement) {
    if (IsCompleted) {
        IsCompleted = false;
        isLoading(true, "FunctionalPanel", "top", "-25", false, "");
        var ArrivalID = element.children(":selected").val();
        var DepartureID = appendElement.children(":selected").val();
        AjaxFunction("AjaxRequest", "OP=GetLoadFlights&ArrivalID=" + ArrivalID + "&DepartureID=" + DepartureID, WherePassengerFlightCallBack);
    }
}
function WherePassengerFlightCallBack(responseText) {
    if (responseText != "False") {
        var element = $(responseText);
        $("#FunctionalFlights").html(element.html());       
    }
}
function WherePassengerPosition(element) {
    if (IsCompleted) {
        IsCompleted = false;
        isLoading(true, "FunctionalPanel", "top", "-25", false, "");
        var OtoID = element.children(":selected").val();
        AjaxFunction("AjaxRequest", "OP=GetLoadPosition&OtoID=" + OtoID, WherePassengerPositionCallBack);
    }
}
function WherePassengerPositionCallBack(responseText) {
    if (responseText != "False") { }
}
function SetTicketInfo() {
    if (EmptySelectBox($("#FunctionalDeparture")) && EmptySelectBox($("#FunctionalArrival")) && EmptyControl($("#VoyageDate")) && DateValidation($("#VoyageDate"))) {
        if (IsCompleted) {
            IsCompleted = false;
            isLoading(true, "FunctionalPanel", "top", "-25", false, "");
            var DepartureID = $("#FunctionalDeparture").children(":selected").val();
            var ArrivalID = $("#FunctionalArrival").children(":selected").val();
            var DateTime = $("#VoyageDate").val();
            var SearchType = $('input[name=FunctionalRadio]:checked').val();
            var HasYolkart = $("#FunctionalRememberMe").is(":checked");
            AjaxFunction("AjaxRequest", "OP=SetTicketInfo&DepartureID=" + DepartureID + "&ArrivalID=" + ArrivalID + "&DateTime=" + DateTime + "&SearchType=" + SearchType + "&HasYolkart=" + HasYolkart, SetTicketInfoCallBack);
        }
    }
}
function SetTicketInfoCallBack(responseText) {
    if (responseText != "False") {
        window.location = responseText;
    }
}
var DateReservation = "";
function GetAvailableReservation(Type) {
    if (Type == 1 && DateReservation == "") {
        if (IsCompleted) {
            IsCompleted = false;
            isLoading(true, "FunctionalPanel", "top", "-25", false, "");
            AjaxFunction("AjaxRequest", "OP=GetAvailableReservation", GetAvailableReservationCallBack);
        }
    }
    else if (Type == 2) {
        var VoyageDate = $("#VoyageDate");
        VoyageDate.datepicker("destroy");
        var myDate = new Date();
        VoyageDate.datepicker({ showOn: 'button', buttonImage: '/Files/Images/btn_calendar.png', buttonImageOnly: true, minDate: new Date(myDate.getFullYear(), myDate.getMonth(), myDate.getDate()) });
        VoyageDate.val(myDate.getDate() + "." + (myDate.getMonth() + 1) + "." + myDate.getFullYear());
    }
    else {
        var VoyageDate = $("#VoyageDate");
        var myDate = new Date(DateReservation);
        VoyageDate.datepicker("destroy");
        VoyageDate.datepicker({ showOn: 'button', buttonImage: '/Files/Images/btn_calendar.png', buttonImageOnly: true, minDate: new Date(myDate.getFullYear(), myDate.getMonth(), myDate.getDate()) });
        VoyageDate.val(myDate.getDate() + "." + (myDate.getMonth() + 1) + "." + myDate.getFullYear());
    }
}
function GetAvailableReservationCallBack(responseText) {
    if (responseText != "False") {
        var VoyageDate = $("#VoyageDate");
        var arrDateList;
        arrDateList = responseText.split('.');
        DateReservation = arrDateList[1] + "/" + arrDateList[0] + "/" + arrDateList[2];
        var myDate = new Date(DateReservation);
        VoyageDate.datepicker("destroy");
        VoyageDate.datepicker({ showOn: 'button', buttonImage: '/Files/Images/btn_calendar.png', buttonImageOnly: true, minDate: new Date(myDate.getFullYear(), myDate.getMonth(), myDate.getDate()) });
        VoyageDate.val(myDate.getDate() + "." + (myDate.getMonth() + 1) + "." + myDate.getFullYear());
    }
}
$("#VoyageDate").live('change', function(event) {
    $(this).css("border", "1px solid #3D6B95");
});
$("#VoyageDate").live('keypress', function(event) {
    $(this).css("border", "1px solid #3D6B95");
});
$("#FunctionalEmailField").live('keypress', function(event) {
    $(this).css("border", "1px solid #3D6B95");
});
$("#FunctionalLoginUserNo").live('keypress', function(event) {
    $(this).css("border", "1px solid #3D6B95");
    return IsNumericOnly(event);
});
$("#FunctionalLoginPassword").live('keypress', function(event) {
    $(this).css("border", "1px solid #3D6B95");
});
$("#FunctionalSearchCreditCard").live('keypress', function(event) {
    $(this).css("border", "1px solid #3D6B95");
    return IsNumericOnly(event);
});
$("#FunctionalIdentity").live('keypress', function(event) {
    $(this).css("border", "1px solid #3D6B95");
    return IsNumericOnly(event);
});
$("#FunctionalSearchPhoneNo").live('keypress', function(event) {
    $(this).css("border", "1px solid #3D6B95");
});
$("#FunctionalIdentity").live('keypress', function(event) {
    $(this).css("border", "1px solid #3D6B95");
    return IsNumericOnly(event);
});
$("#FunctionalYolkartNoField").live('keypress', function(event) {
    $(this).css("border", "1px solid #3D6B95");
    return IsNumericOnly(event);
});
$("#FunctionalPhoneNoField").live('keypress', function(event) {
    $(this).css("border", "1px solid #3D6B95");
    return IsNumericOnly(event);
});
$("#FunctionalDeparture").live('change', function(event) {
    $(this).css("border", "1px solid #3D6B95");
});
$("#FunctionalArrival").live('change', function(event) {
    $(this).css("border", "1px solid #3D6B95");
});
$("#FunctionalFlights").live('change', function(event) {
    $(this).css("border", "1px solid #3D6B95");
});
function GoToWherePassenger(url) {
    if (EmptySelectBox($("#FunctionalDeparture")) && EmptySelectBox($("#FunctionalArrival")) && EmptySelectBox($("#FunctionalFlights"))) {
        window.location = url;
    }
}
function RememberYolkart(element) {
    if (EmptyControl(element)) {
        if (IsCompleted) {
            IsCompleted = false;
            isLoading(true, "FunctionalPanel", "top", "-25", false, "");
            var IdentityValue = element.val();
            AjaxFunction("AjaxRequest", "OP=GetYolkartNo&IdentityNo=" + IdentityValue, RememberYolkartCallBack);
        }
    }
}
function RememberYolkartCallBack(responseText) {
    if (responseText != "False") {
        $('#Warning').remove();
        $("#FunctionalIdentityContainer").append("<div id='Warning' style='margin-top:10px;margin-bottom:0px;'>" + responseText + "</div>");
    }
}
function RememberPassword(yolkartNoElement, phoneNoElement, emailElement) {
    if (IsCompleted) {
        IsCompleted = false;
        isLoading(true, "FunctionalPanel", "top", "-25", false, "");
        var Type = 0;
        var Value = "";
        if (yolkartNoElement.val() != "" && yolkartNoElement != undefined && yolkartNoElement != null) {
            Type = 1;
            Value = yolkartNoElement.val();
        }
        else if (phoneNoElement.val() != "" && phoneNoElement != undefined && phoneNoElement != null) {
            Type = 3;
            Value = phoneNoElement.val();
        }
        else if (emailElement.val() != "" && emailElement != undefined && emailElement != null && EmailValidation(emailElement)) {
            Type = 2;
            Value = emailElement.val();
        }
        else {
            IsCompleted = true;
            isLoading(false);
            return false;
        }
        AjaxFunction("AjaxRequest", "OP=GetPassword&Value=" + Value + "&Type=" + Type, RememberPasswordCallBack);
    }
}
function RememberPasswordCallBack(responseText) {
    if (responseText != "False") {
        $('#Warning').remove();
        $("#FunctionalRememberPasswordContainer").append("<div id='Warning' style='margin-top:2px;margin-bottom:0px;'>" + responseText + "</div>");
    }
}

//function DateValidation(mydate, type) {

//    var currentTimeAndDate = new Date();
//    if (mydate === undefined) {
//        return false;
//    }

//    if (!isValidDate(mydate)) {
//        $("#VoyageDate").val($.datepicker.formatDate('dd.mm.yy', currentTimeAndDate));
//        return true;
//    }

//    var converttime = mydate.split(".");
//    if (converttime.length != 3) {
//        $("#VoyageDate").val($.datepicker.formatDate('dd.mm.yy', currentTimeAndDate));
//        return true;
//    }

//    if (type == null) {
//        var currentMyDate = new Date(converttime[2] + "/" + converttime[1] + "/" + converttime[0]);
//        var strcurrentTimeAndDate = $.datepicker.formatDate('dd.mm.yy', currentTimeAndDate);
//        if (strcurrentTimeAndDate != mydate) {
//            if (currentTimeAndDate > currentMyDate) {
//                $("#VoyageDate").val($.datepicker.formatDate('dd.mm.yy', currentTimeAndDate));
//                return true;
//            }
//        }
//        return true;
//    }
//    else {
//        dateValue = $.datepicker.parseDate('dd.mm.yy', mydate);
//        dateValue.setDate(dateValue.getDate() + (type));
//        var strcurrentTimeAndDate = $.datepicker.formatDate('dd.mm.yy', currentTimeAndDate);
//        var strcurrentMydate = $.datepicker.formatDate('dd.mm.yy', dateValue);
//        if (strcurrentTimeAndDate != strcurrentMydate) {
//            if (currentTimeAndDate > dateValue) {
//                $("#VoyageDate").val($.datepicker.formatDate('dd.mm.yy', currentTimeAndDate));
//                return true;
//            }
//            else {
//                return true;
//            }
//        }
//        return true;
//    }
//}
