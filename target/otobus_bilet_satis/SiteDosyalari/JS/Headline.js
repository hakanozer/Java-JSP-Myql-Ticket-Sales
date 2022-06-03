var Lock = false;
var ChangeLock = false;
$(window).ready(function () {
    if ($("#WebPosHiddenValue2").length > 0) {
        if ($("#WebPosHiddenValue2").val() != '0') {
            selectVoyage($("#WebPosHiddenValue2").val());
        }
    }

    if ($("#BKMMember").val() == 1) {
        //alert($("#BKMMessage").val());

        $("body,html").animate({ scrollTop: 800 }, 800);
        $("#CreditCardContainer").css("display", "block");
        ChangeTab(5);
    };

    heightSettingsPurchasePage();
    var headline = {
        Index: 1,
        Items: $('#Headlines > .HeadlineItem'),
        Timer: '',
        Interval: 3000
    };
    if (headline.Items.length == 0) {
        $('#Headline > .Next').css('display', 'none');
        $('#Headline > .Previous').css('display', 'none');
        $('#Headline > .Pages').css('display', 'none');
    } else {
        setHeadlineTimer();
    }
    $('#Headline .Next').click(function () {
        headline.Index++;
        if (headline.Index == headline.Items.length) {
            headline.Index = 0;
        }
        selectedHeadline();
    });
    $('#Headline .Previous').click(function () {
        headline.Index--;
        if (headline.Index == -1) {
            headline.Index = (headline.Items.length - 1);
        }
        selectedHeadline();
    });
    $('#Headline > .Pages > div').click(function () {
        if (this.className != 'Selected') {
            headline.Index = this.id.replace('Page_', '');
            selectedHeadline();
        }
    });
    $('#Headline').hover(function () {
        clearHeadlineTimer();
    }, function () {
        setHeadlineTimer();
    });
    $('#Headline > .Next').hover(function () {
        clearHeadlineTimer();
    }, function () {
        setHeadlineTimer();
    });
    $('#Headline > .Previous').click(function () {
        clearHeadlineTimer();
    }, function () {
        setHeadlineTimer();
    });
    $('#Headline > .Pages').click(function () {
        clearHeadlineTimer();
    }, function () {
        setHeadlineTimer();
    });
    function setHeadline() {
        if (headline.Items != null && headline.Items.length > 0) {
            selectedHeadline();
            if (headline.Index == (headline.Items.length - 1)) {
                headline.Index = 0;
            }
            else {
                headline.Index++;
            }
        }
    }
    function selectedHeadline() {
        for (var i = 0; i < headline.Items.length; i++) {
            if (i == headline.Index) {
                $('#Headlines_Row_' + i).css('display', 'block');
                $('#Headline > .Pages > #Page_' + i).addClass('Selected');
            }
            else {
                $('#Headlines_Row_' + i).css('display', 'none');
                $('#Headline > .Pages > #Page_' + i).removeClass('Selected');
            }
        }
    }
    function setHeadlineTimer() {
        if (headline.Timer == '') {
            headline.Timer = setInterval(setHeadline, headline.Interval);
        }
    }
    function clearHeadlineTimer() {
        if (headline.Timer != '') {
            clearInterval(headline.Timer);
            headline.Timer = '';
        }
    }
});

function CloseSelection(seat) {
    $("#genderselection").remove();
    $("#seat" + seat).css("background-color", "transparent");
}

function CountValue(type, resp) {
    var passengerControlInfo = $("#PageContent #TicketInformation");
    var koruncukControlInfo = $("#PageContent #KoruncukInformation");
    var count = passengerControlInfo.length;
    var count2 = koruncukControlInfo.length;
    if (count > 0) {
        
        for (var i = 1; i < count; i++) {
            passengerControlInfo.eq(i).hide();
        }
        for (var x = 1; x < count2; x++) {
            koruncukControlInfo.eq(x).hide();
        } 

        $("#PassengersContainer").css("display", "block");
        $("#PassengersHeader").css("display", "block");
        $("#TicketInformation").css("display", "block");
        $("#KoruncukInformation").css("display", "block");

        if (resp.indexOf('updatepassengerinformation(') == -1 && type == 0) {
            passengerControlInfo.hide();
            $("#PassengersContainer").css("display", "none");
            $("#PassengersHeader").css("display", "none");
            $("#TicketInformation").css("display", "none");
            $("#KoruncukInformation").css("display", "none");
        }
    }
//    alert(count2);
//    if (count2 > 0) {
//        for (var x = 1; x < count2; x++) {
//            koruncukControlInfo.eq(x).hide();
//        } 
//    }
}
function SelectLock(type) {
    if (type == 1) {
        Lock = true;
        $("#VoyageContainer").css("opacity", "0.55");
        $("#VoyageContainer").css("filter", "alpha(opacity = 55)");
        $("#GridHeaderContainer").css("opacity", "0.55");
        $("#GridHeaderContainer").css("filter", "alpha(opacity = 55)");
        $("#gridcolumn").css("opacity", "0.55");
        $("#gridcolumn").css("filter", "alpha(opacity = 55)");
        $("#VoyagesContainer").css("opacity", "0.55");
        $("#VoyagesContainer").css("filter", "alpha(opacity = 55)");
    }
    else {
        $("#VoyageContainer").css("opacity", "1");
        $("#VoyageContainer").css("filter", "alpha(opacity = 100)")
        $("#GridHeaderContainer").css("opacity", "1");
        $("#GridHeaderContainer").css("filter", "alpha(opacity = 100)");
        $("#gridcolumn").css("opacity", "1");
        $("#gridcolumn").css("filter", "alpha(opacity = 100)");
        $("#VoyagesContainer").css("opacity", "1");
        $("#VoyagesContainer").css("filter", "alpha(opacity = 100)");
        Lock = false;
    }
    $("#SelectVoyageArrival").attr("disabled", Lock);
    $("#SelectVoyageDeparture").attr("disabled", Lock);
    $("#TextVoyageDate").attr("disabled", Lock);
    
}
function ChangeTicketLock(type) {
    if (type == 1) {
        ChangeLock = true;
        $(".SelectBoxClick").css("background-color", "#F0F0F0");
    }
    else {
        ChangeLock = false;
        $(".SelectBoxClick").css("background-color", "#FFFFFF");
    }
    $("#SelectVoyageDeparture").attr("disabled", ChangeLock);
    $("#SelectVoyageArrival").attr("disabled", ChangeLock);
    $("#TextVoyageDate").attr("disabled", ChangeLock);
    
}
var Campaign = false;
function OpenPanels(type, resp, campaignType) {
    if (type == 1) {
        if (campaignType > 0) { Campaign = true; }
        $("#CreditCardContainer").css("display", "block");
        $("#CreditCardContainer").stop().animate({ height: 350 }, 1000);
        $("#CreditCardResultContainer").css("display", "block");
        if ($("#HiddenMember").val() == 1 && campaignType != null && campaignType != 0) {
            $("#CampaignPanel").css("display", "block");
            $("#CampaignInfo").css("display", "block");
            $("#CreditCardResultContainer").stop().animate({ height: 300 }, 1000);
        }
        else {
            if (!Campaign) {
                $("#CampaignPanel").css("display", "none");
                $("#CampaignInfo").css("display", "none");
                $("#CreditCardResultContainer").stop().animate({ height: 100 }, 1000);
            }
        }
        $("#PassengersHeader").css("display", "block");
        $("#PassengersHeader").stop().animate({ height: 58 }, 1000);
        $("#PassengersContainer").css("display", "block");
        $("#ReservationComplete").css("display", "block");
        //SelectLock(1);
    }
    else {
        if (campaignType > 0) {
            Campaign = false;
            $("#CampaignPanel").css("display", "none");
            $("#CampaignInfo").css("display", "none");
            $("#CreditCardResultContainer").stop().animate({ height: 100 }, 1000);
        }
        if (resp.indexOf('updatepassengerinformation(') == -1 && type == 0) {
            
            $("#CreditCardContainer").stop().animate({ height: 0 }, 1000, function() { $("#CreditCardContainer").css("display", "none"); });
            $("#CreditCardResultContainer").stop().animate({ height: 0 }, 1000, function() { $("#CreditCardResultContainer").css("display", "none"); });
            $("#ReservationComplete").css("display", "none");
            SelectLock(0);
        }
    }
}


var currentseat;
function reserveseat(campaign, seat, nearestseat) {
    currentseat = seat;
    var element = document.getElementById('seat' + seat);
    var styleclass = false;
    if ($(element).attr("class").indexOf("reservedforme") < 0) {
        styleclass = true;
    }
    if ((element != null || element != undefined) && styleclass) {
        var selectionpanel = document.getElementById('genderselection');
        if (selectionpanel != null || selectionpanel != undefined)
            selectionpanel.parentNode.removeChild(selectionpanel);
        var selectionarea = "<div class='selectionpanel' id='genderselection'>";
        selectionarea += "<div id=\'SelectionMan\' onclick=\'reserveseatwithgender(" + campaign + "," + seat + "," + nearestseat + ",1);\'></div>";
        selectionarea += "<div id=\'SelectionWoman\' onclick=\'reserveseatwithgender(" + campaign + "," + seat + "," + nearestseat + ",2);\'></div>";
        selectionarea += "<div id=\'SelectionClose\' style=\'color:gray;font-size:11px;float:right;margin-right:15px;margin-top:5px;\' onclick=\'CloseSelection(" + seat + ");\'>" + conceptClose + "</div>";
        selectionarea += "</div>";
        element.innerHTML += selectionarea;
        $("#busimage div").css("background-color", "transparent");
        $("#seat" + seat).css("background-color", "green");
    }
    else {
        reserveseatwithgender(campaign, seat, nearestseat, -1);
        $("#seat" + seat).css("background-color", "transparent");
    }

}
function reserveseatwithgender(campaign, seat, nearestseat, gender) {
    var selectionpanel = document.getElementById('genderselection');
    if (selectionpanel != null || selectionpanel != undefined)
        selectionpanel.parentNode.removeChild(selectionpanel);
    var element = document.getElementById('seat' + seat);
    AjaxAction('&seat=' + seat + '&nearestseat=' + nearestseat + '&gender=' + gender + '&campaign=' + campaign,
               'reserveseat',
                null,
                function(response) {
                    var seatid = 'seat' + currentseat;
                    if (response.toString().indexOf('blocked') > -1) {
                        refreshPassengerInformation()
                        if (response.toString() == 'blocked;1') {
                            $('#' + seatid).addClass("reservedformeman");
                            $('#' + seatid).removeClass("reservedformewoman");
                        }
                        else {
                            $('#' + seatid).addClass("reservedformewoman");
                            $('#' + seatid).removeClass("reservedformeman");
                        }
                        OpenPanels(1, null, campaign);
                    }
                    else if (response.toString() == 'removeblock') {
                        refreshPassengerInformation()
                        if (campaign > 0) { Campaign = false; OpenPanels(1, null, 0); }
                        clearSeat(seatid);
                    }
                    else if (response.toString().indexOf('timeout') > -1) {
                        var array = response.toString().split('$');
                        alert(array[1]);
                        window.location = array[2];
                    }
                    else {
                        alert(response);
                        $("#seat" + seat).css("background-color", "transparent");
                    }
                },
                document.location);
                ChangeTab(4);
}
function clearSeat(id) {
    $('#' + id).removeClass("reservedformeman");
    $('#' + id).removeClass("reservedformewoman");
    $('#' + id).removeClass("bsavailable");
    $('#' + id).addClass("bsavailable");

}
function BusPanelCloseAndOpen(type) {
    if (type == 1) {
        if ($("#busarea") != undefined) {
            $("#busarea").css("display", "block");
            $("#busarea").stop().animate({ height: 350 }, 1000);
        }
    }
    else {
        if ($("#busarea") != undefined) {
            $("#busarea").stop().animate({ height: 0 }, 1000, function() { $("#busarea").css("display", "none"); });
        }

        $("#PassengersContainer").css("display", $("#TicketInformation").css("display"));
        $("#PassengersHeader").css("display", $("#TicketInformation").css("display"));
        $("#KoruncukInformation").css("display", $("#TicketInformation").css("display"));
//        $("#PassengersHeader").stop().animate({ height: 0 }, 1000, function() {
////            $("#PassengersHeader").css("display", "none");
//            //            $("#PassengersContainer").css("display", "none");
//        
//        });
    }
}

function TopSettingsLb() {
    var Top = $('#VoyagesContainer').scrollTop();
    var DivTop = $('#LBLayoutInfo').css("top").replace("px", "");

    $('#LBLayoutInfo').css("top", (DivTop - Top) + "px");
}
var LastShownVoyageID = 0;
var DrawerLB = 0;
var LBElement;
function DrawerLigtBox() {
    if (Lock) { return; }
    $("body").append("<div id='PaymentLBArea' style='position: fixed;top: 0;left:0; background-color: black;width: 100%;height: 100%;z-index: 10;opacity: 0.55;filter:alpha(opacity=55);' onclick='ClosePaymentLB()'></div>");
    DrawerLB = 1;
}
function selectVoyage(element) {
    if (Lock) {
        return;
    }
    var DepartureName = $("#SelectVoyageDeparture option:selected").text();
    var ArrivalName = $("#SelectVoyageArrival option:selected").text();
    var DateValue = $("#TextVoyageDate").val();
    var id;
   
   if (element == "[object HTMLTableRowElement]") {
        id = element.id;
        LastShownVoyageID = id.replace('CB_VoyagesForm_Row_ID_', '');
    }
    else {
        id = 'CB_VoyagesForm_Row_ID_' + element;
        LastShownVoyageID = element;
    }
    DepartureValue = $("#SelectVoyageDeparture option:selected").val();
    ArrivalValue = $("#SelectVoyageArrival option:selected").val();
    
    if (LastShownVoyageID == 0) { return; }
    $('.selectedrow').removeClass('selectedrow');
    if ($("#PaymentLBArea").css("display") != "block") {
        $("body,html").animate({ scrollTop: 800 }, 800);
    }
    $('#' + id).addClass('selectedrow');
    AjaxVoyageAction('&elementid=' + id + '&Type=' + DrawerLB + '&DepartureID=' + DepartureValue + '&ArrivalID=' + ArrivalValue + '&VoyageDate=' + DateValue + '&DepartureName=' + DepartureName + '&ArrivalName=' + ArrivalName,
               'showvoyage',
                null,
                function (response) {
                    var array = response.toString().split('$');
                    BusPanelCloseAndOpen(1);
                    if (array.length == 1 || array[0] == 'false' || array[0] == 'timeout' || array[0] == 'busisfull') {
    
                        if (array[0] == 'timeout') {
                            window.location = array[2];
                            alert(array[1]);
                        }
                        else if (array[0] = 'busisfull') {
                            document.getElementById('busarea').innerHTML = array[2];
                            if (array[3] != '') {
                                $("#VoyagesContainer").append(array[3]);
                                DrawerLB = 0;
                                TopSettingsLb();
                            }
                        }
                    }
                    else {
                        document.getElementById('busarea').innerHTML = array[1];
                        if (array[2] != '') {
                            $("#VoyagesContainer").append(array[2]);
                            DrawerLB = 0;
                            TopSettingsLb();
                        }
                    }
                    var width = $("#busimage").width();
                    if (width > 754) {
                        $("#BusShape").css("width", "754px");
                    }
                    else {
                        $("#BusShape").css("width", (width + 72) + "px");
                        $("#HorizontalBottom").css("width", (width - 20) + "px");
                    }

                },
                document.location);

}
function heightSettingsPurchasePage() {
    var height = $("#CB_Voyages").height();
    if (height > 477)
        height = 477

    if (height != 0) {
        $("#CustomPageLeftPanel").css("height", (height + 300) + "px");
    }
    if ($("#MemberStatus")) {
        if ($("#MemberStatus").val() == "0") {
            $("#CustomPageLeftPanel").css("height", "300px");
        }
        else if ($("#MemberStatus").val() == "1") {
            if ($("#SendtoSMSReference").css("float") != "left") {
                $("#CustomPageLeftPanel").css("height", "260px")
            }
            else {
                $("#CustomPageLeftPanel").css("height", "84px");
            }
        }
    }
    $("#VoyagesContainer").css("height", height + "px");
    $("#VoyagesContainer").css("overflow-x", "hidden");
    $("#VoyagesContainer").css("overflow-y", "scroll");
    if ($("#CB_EkstreGrid").height() > 0) {
        $("#CustomPageLeftPanel").css("height", "100px");
    }
    if ($("#CB_EkstreGrid").height() > 0) {
        $("#CustomPageLeftPanel").css("height", "100px");
    }
    if ($("#CB_ConvertToReservationsGrid").height() > 0) {
        $("#CreditCardContainer").css("margin-left", "141px");
        $("#CreditCardResultContainer").css("margin-left", "129px");
        $("#CreditCardResultContainer").css("height", "90px");
    }

}

function getNextDayVoyages() {
    if (Lock) {
        return;
    }
    var textbox = $("#TextVoyageDate").val();
    var ControlResult = DateControl(textbox, -1);
    if (!ControlResult) {
        return;
    }
   var DepartureValue = $("#SelectVoyageDeparture option:selected").val();
    var ArrivalValue = $("#SelectVoyageArrival option:selected").val();
    if (!ValidationGetVoyages(DepartureValue, ArrivalValue, textbox)) {
        getVoyagesForVoyage(1048, 1094, '01.01.2020');
        HiddenHeader(0);
        BusPanelCloseAndOpen(0);
        isLoading(false);
        return;
     }
  
    AjaxVoyageAction('&date=' + textbox,
               'getNextDayVoyages',
                null,
                function(response) {
                    document.getElementById('VoyagesContainer').outerHTML = response;
                    document.getElementById('busarea').innerHTML = '';
                    ChangeDate(-1);
                    heightSettingsPurchasePage();
                    BusPanelCloseAndOpen(0);
                },
                document.location);
                $("body,html").animate({ scrollTop: 230 }, 100);
}
function getPreviousDayVoyages() {
    if (Lock) {
        return;
    }
    var textbox = $("#TextVoyageDate").val();
   var DepartureValue = $("#SelectVoyageDeparture option:selected").val();
    var ArrivalValue = $("#SelectVoyageArrival option:selected").val();
    if (!ValidationGetVoyages(DepartureValue, ArrivalValue, textbox)) {
        getVoyagesForVoyage(1048, 1094, '01.01.2020');
        HiddenHeader(0);
        BusPanelCloseAndOpen(0);
        isLoading(false);
        return;
    }

    AjaxVoyageAction('&date=' + $("#TextVoyageDate").val(),
               'getPreviousDayVoyages',
                null,
                function(response) {
                    document.getElementById('VoyagesContainer').outerHTML = response;
                    document.getElementById('busarea').innerHTML = '';
                    ChangeDate(1);
                    heightSettingsPurchasePage();
                    BusPanelCloseAndOpen(0);
                },
                document.location);
                $("body,html").animate({ scrollTop: 230 }, 100);
}
function getVoyagesForVoyage(departureID, arrivalID, date) {
    AjaxVoyageAction('&departureID=' + departureID + '&arrivalID=' + arrivalID + '&date=' + date,
               'getVoyages',
                null,
                function(response) {
                    document.getElementById('VoyagesContainer').outerHTML = response;
                    document.getElementById('busarea').innerHTML = '';
                    heightSettingsPurchasePage();
                },
                document.location);
                $("body,html").animate({ scrollTop: 230 }, 100);
}


function getVoyages(departureID, arrivalID, date) {
    AjaxAction('&departureID=' + departureID + '&arrivalID=' + arrivalID + '&date=' + date,
               'getVoyages',
                null,
                function(response) {
                    document.getElementById('VoyagesContainer').outerHTML = response;
                    document.getElementById('busarea').innerHTML = '';
                    heightSettingsPurchasePage();
                },
                document.location);
                
}

function CheckInstallments() {
    AjaxAction('&CreditCardNumber=' + document.getElementById('CreditCardNumber').value, 'checkInstallments',
                null,
                function (response) {
                    
                    if (response == 'true') {
                        $("#InstallmentsLabel").css("display", "block");
                        $("#Installments").css("display", "block");
                    }
                },
                document.location);
}


function refreshPassengerInformation() {
    setTimeout('refreshPassengerInformationInBackground()', 100);
}
function refreshPassengerInformationInBackground() {
    AjaxAction('',
               'refreshPassengerInformation',
                null,
                function (response) {
                    document.getElementById('PassengersContainer').outerHTML = response;
                    OpenPanels(0, document.getElementById('PassengersContainer').outerHTML);
                    CountValue(0, document.getElementById('PassengersContainer').outerHTML);
                },
                document.location);
}
var deletepassengervoyageid = -1;
var deletepassengerseatid = -1;
function deletepassenger(voyageid, seatid, campaign, departureid, arrivalid) {
    
    deletepassengervoyageid = voyageid;
    deletepassengerseatid = seatid;
    AjaxAction('&voyageid=' + voyageid + '&seatid=' + seatid + '&DepartureID=' + departureid + '&ArrivalID=' + arrivalid,
               'deletepassenger',
                null,
                function (response) {
                    if (response.toString().indexOf('timeout') > -1) {
                        var array = response.toString().split(';');
                        alert(array[1]);
                        window.location = array[2];
                    }
                    else {
                        document.getElementById('PassengersContainer').outerHTML = response;
                        var passengerControl = $("#PageContent").find("#PassengersHeader");
                        
                        if (passengerControl.length > 1) {
                            for (var i = 1; i < passengerControl.length; i++) {
                                $("#PassengersHeader:eq(" + i + ")").remove();
                            }
                        }
                        
                        OpenPanels(0, response, campaign);
                        CountValue(0, response);
                        if (deletepassengervoyageid == LastShownVoyageID) {
                            var element = document.getElementById('seat' + deletepassengerseatid);
                            if (element != null && element != undefined) {
                                $("#seat" + seatid).css("background-color", "transparent");
                                clearSeat("seat" + seatid);
                            }
                        }
                    }
                },
                document.location);
                ChangeTab(4);
}
function wrongMessage() {
    $("body").append("<div id='PaymentLBArea' style='position: fixed;top: 0;left:0; background-color: black;width: 100%;height: 100%;z-index: 10;opacity: 0.55;filter:alpha(opacity=55);' onclick='ClosePaymentLB()'></div>");
    $("body").append("<div id='PaymentLBLayout' style='left: 50%;margin-left: -472px;margin-top: -220px;position: fixed;top: 50%;width: 500px;z-index: 11;'><div id='PaymentLBPanel'><div id='LBContent'>" + messageWrongMsg + "</div><a id='CloseLightBox' href='javascript:ClosePaymentLB();'></a></div></div>");
}
function submitcreditcard() {
    var params = "";
    var Contract = 0;
    var KoruncukContract = 0;
    if ($("#CreditCardContainer div").length > 0) {

        if (!ChangeTicketValue) {
            params = '&CreditCardOwner=' + document.getElementById('CreditCardOwner').value;
            params += '&CreditCardNumber=' + document.getElementById('CreditCardNumber').value;
            params += '&CVC=' + document.getElementById('CVC').value;
            params += '&Month=' + document.getElementById('Month').options[document.getElementById('Month').selectedIndex].value;
            params += '&Year=' + document.getElementById('Year').options[document.getElementById('Year').selectedIndex].value;
            params += '&CampaignPhoneNo=' + $("#CampaignPhoneNo").val();
            params += '&CampaignPass=' + $("#CampaignPass").val();
            if ($("#SalesContract").attr("checked"))
                Contract = 1;
            if ($("#KoruncukCheck").attr("checked"))
                KoruncukContract = 1;
            params += '&Contract=' + Contract + '&PhoneNumber=' + $("#ContactPhone").val() + '&Email=' + $("#ContactEmail").val() + '&KoruncukContract=' + KoruncukContract + '&KoruncukEmail=' + $("#KoruncukEmail").val();
        }
        else {
            params += '&PhoneNumber=' + $("#ContactPhone").val() + '&Email=' + $("#ContactEmail").val();
        }
    }

    AjaxAction(params,
               'submitcreditcard',
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
                        window.location = array[1];
                    }

                },
                document.location);
                ChangeTab(4);
}

var priceTotalValue = 0;
function GetPrice(price, type) {
    var passengerCount = $("#CB_Passengers tr").length;
    $("#TicketPanelTitleValue_4").val(passengerCount - 1);
    if (type = 1) {
        priceTotalValue += price;
    }
    else {
        priceTotalValue -= price;
        if (priceValue <= 0) {
            priceTotalValue = 0;
        }
    }
    $("#TicketPanelTitleValue_4").val(price + ",00 TL");
    $("#TicketPanelTitleValue_6").val(priceTotalValue + ",00 TL");
}


function convertTicketExtraDataUpdate(rowid, index, meValues) {
    var params = '&Index=' + index;
//    if (meValues.id.indexOf('_service') > -1) {
//        params += '&Terminal=0';
//        params += '&Service=' + document.getElementById(rowid + '_service').options[document.getElementById(rowid + '_service').selectedIndex].value;
//        params += '&Time=' + document.getElementById(rowid + '_service').options[document.getElementById(rowid + '_service').selectedIndex].innerHTML;
//        $("#" + rowid + "_terminal").val("0");
//    }
//    else {
//        params += '&Service=0';
//        params += '&Terminal=' + document.getElementById(rowid + '_terminal').options[document.getElementById(rowid + '_terminal').selectedIndex].value;
//        params += '&Time=0';
//        $("#" + rowid + "_service").val("0");
//    }
    if (meValues.id.indexOf('_service') > -1) {

        if (document.getElementById(rowid + '_service')) {
            params += '&Terminal=0';
            params += '&Service=' + document.getElementById(rowid + '_service').options[document.getElementById(rowid + '_service').selectedIndex].value;
            params += '&Time=' + document.getElementById(rowid + '_service').options[document.getElementById(rowid + '_service').selectedIndex].innerHTML;
            $("#" + rowid + "_terminal").val("0");
        }
    }
    else if (meValues.id.indexOf('_terminal') > -1) {
        if (document.getElementById(rowid + '_terminal')) {
            params += '&Service=0';
            params += '&Terminal=' + document.getElementById(rowid + '_terminal').options[document.getElementById(rowid + '_terminal').selectedIndex].value;
            params += '&Time=0';
            $("#" + rowid + "_service").val("0");
        }
    }
    
    if (meValues.id.indexOf('_arrivalservice') > -1) {
        if (document.getElementById(rowid + '_arrivalservice')) {
            params += '&ArrivalTerminal=0';
            params += '&ArrivalService=' + document.getElementById(rowid + '_arrivalservice').options[document.getElementById(rowid + '_arrivalservice').selectedIndex].value;
            params += '&Time=0';
            $("#" + rowid + "_arrivalterminal").val("0");
        }
    }
    else if (meValues.id.indexOf('_arrivalterminal') > -1) {
        if (document.getElementById(rowid + '_arrivalterminal')) {
            params += '&ArrivalService=0';
            params += '&ArrivalTerminal=' + document.getElementById(rowid + '_arrivalterminal').options[document.getElementById(rowid + '_arrivalterminal').selectedIndex].value;
            params += '&Time=0';
            $("#" + rowid + "_arrivalservice").val("0");
        }
    }

    AjaxAction(params,
               'convertTicketExtraDataUpdate',
                null,
                function(response) {
                    if (response.toString() != 'ok') {
                        var array = response.toString().split('$');
                        if (array[0] == 'false') {
                            alert(array[1]);
                        }
                        else {
                            window.location = array[1];
                        }
                    }
                },
                document.location);

            }

function updatepassengerinformation(departureid,arrivalid, voyageid, seatid, rowid, meValues) {
    var params = '&VoyageID=' + voyageid + '&SeatID=' + seatid;
    params += '&IdentityNumber=' + document.getElementById(rowid + '_CB_PassengersForm_Column_IdentityNumber').value;
    params += '&Name=' + document.getElementById(rowid + '_CB_PassengersForm_Column_Name').value;
    params += '&SurName=' + document.getElementById(rowid + '_CB_PassengersForm_Column_SurName').value;
    if (document.getElementById(rowid + '_gender') != null)
        params += '&Gender=' + document.getElementById(rowid + '_gender').options[document.getElementById(rowid + '_gender').selectedIndex].value;
    else
        params += '&Gender=-1';
    if (meValues.id.indexOf('_service') > -1) {
        
        if (document.getElementById(rowid + '_service')) {
            params += '&Terminal=0';
            params += '&Service=' + document.getElementById(rowid + '_service').options[document.getElementById(rowid + '_service').selectedIndex].value;
            params += '&Time=' + document.getElementById(rowid + '_service').options[document.getElementById(rowid + '_service').selectedIndex].innerHTML;
            $("#" + rowid + "_terminal").val("0");
        }
    }
    else if (meValues.id.indexOf('_terminal') > -1){
        if (document.getElementById(rowid + '_terminal')) {
            params += '&Service=0';
            params += '&Terminal=' + document.getElementById(rowid + '_terminal').options[document.getElementById(rowid + '_terminal').selectedIndex].value;
            params += '&Time=0';
            $("#" + rowid + "_service").val("0");
        }
    }
    
    if (meValues.id.indexOf('_arrivalservice') > -1) {
        if (document.getElementById(rowid + '_arrivalservice')) {
            params += '&ArrivalTerminal=0';
            params += '&ArrivalService=' + document.getElementById(rowid + '_arrivalservice').options[document.getElementById(rowid + '_arrivalservice').selectedIndex].value;
            params += '&Time=0';
            $("#" + rowid + "_arrivalterminal").val("0");
        }
    }
    else if (meValues.id.indexOf('_arrivalterminal') > -1) {
        if (document.getElementById(rowid + '_arrivalterminal')) {
            params += '&ArrivalService=0';
            params += '&ArrivalTerminal=' + document.getElementById(rowid + '_arrivalterminal').options[document.getElementById(rowid + '_arrivalterminal').selectedIndex].value;
            params += '&Time=0';
            $("#" + rowid + "_arrivalservice").val("0");
        }
    }

    params += '&DepartureID=' + departureid;
    params += '&ArrivalID=' + arrivalid;

    AjaxAction(params,
               'updatepessengerinformation',
                null,
                function(response) {
                    var array = response.toString().split(";");
                    if (array[0] == 'changegender') {
                        if (LastShownVoyageID == array[2]) {
                            var element = document.getElementById('seat' + array[3]);
                            if (element != null && element != undefined) {
                                if (array[1] == '1') {
                                    $('#' + element.id).addClass("reservedformeman");
                                    $('#' + element.id).removeClass("reservedformewoman");
                                }
                                else {
                                    $('#' + element.id).addClass("reservedformewoman");
                                    $('#' + element.id).removeClass("reservedformeman");
                                }
                               // GetPrice(price, 1);
                            }
                        }
                    }
                    else if (array[0] == "false") {
                        if (array[2] == '1') {
                            $("#" + rowid + "_gender").val("2");
                        }
                        else
                        { $("#" + rowid + "_gender").val("1"); }

                        alert(array[1]);
                    }
                    else if (array[0] == 'timeout') {
                        alert(array[1]);
                        window.location = array[2];
                    }
                },
                document.location);
}
