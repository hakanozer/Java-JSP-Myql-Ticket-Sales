var meSelectBox;
var parameters;



function changeticketdate(ticketid) {
    AjaxAction('&TicketID=' + ticketid,
               'changeticketdate',
                null,
                function(response) {
                    var array = response.toString().split(';');
                    if (array[0] == 'false') {
                        alert(array[1]);
                    }
                    else {
                        document.location = array[1];
                    }
                },
                document.location);
}
function GetFlights(departureID, arrivalID) {
    isBusy = false;
    var callBackFunction = function(response) {
        $("#SelectVoyageFlights").html($(response).html());
        $('#SelectVoyageFlights option')[0].selected = "true";
        //$("#TextVoyageFlights").val($("#SelectVoyageFlights option:selected").html());
        var Flights = $("#SelectVoyageFlights option").length;
        if (Flights > 0) {
            SelectBoxOpen(2, false);
        }
    };
    parameters = '&departureID=' + departureID + '&arrivalID=' + arrivalID;
    AjaxAction(parameters, 'getFlights', null, callBackFunction, document.location);
}

function GetDistricts2(type) {
    isBusy = false;
    if (type == 2) {
        $("#cmbDistricts").empty().append('whatever');
        $("#Terminals").html('');
    }

    if (type == 3) {
        InitializeDistricts($('#cmbCities option:selected').val());
        return true;
    }
    
    if(type==0)
        InitializeDistricts($('#cmbCities option:selected').val());

    var callBackFunction = function (response) {
        $("#cmbDistricts").html($(response).html());
                
    };
    parameters = '&cityID=' + $("#cmbCities option:selected").val();
    AjaxAction(parameters, 'LoadDistricts2', null, callBackFunction, document.location);
    GetTerminals2();
}

function GetTerminals2(type) {
 isBusy = false;
    if (type == 2) {
        $("#Terminals").html('');
    }
    if (type == 0) {
        if ($("#cmbDistricts option:selected").val() == '' && $("#cmbDistricts option:selected").size() > 0) {
            GetDistricts2(3);
            return false;
        }
        InitializeTerminals($('#cmbCities option:selected').val(), $('#cmbDistricts option:selected').val(), 0, 0);
    }
   
   
    var callBackFunction = function (response) {
        
        $("#Terminals").html($(response).html());
    };
    parameters = '&cityID=' + $("#cmbCities option:selected").val() + '&districtID=' + $("#cmbDistricts option:selected").val();
    AjaxAction(parameters, 'LoadTerminals2', null, callBackFunction, document.location);
}

function GetTerminal(rid) {
    isBusy = false;

    InitializeTerminal(document.getElementById(rid + '_CB_TerminalsGridForm_Column_Name').innerHTML);

}


$(document).ready(function () {
    Cufon.replace('a', { hover: true });
    Cufon.replace('#Language a', { hover: true });
    Cufon.replace('#OnlineSupportLink');
    Cufon.replace('#MemberPoint span');
    Cufon.replace('#CustomPageLeftPanel span');
    Cufon.replace('#SingOnText div');
    Cufon.replace('h1');
    Cufon.replace('#SiteMapArea div');
    Cufon.replace('#BannerPanelCenter div');
    Cufon.replace('#FooterPanelContent > div');
    $("#TextVoyageDate").attr('maxlength', "10");

    $(document).mouseup(function (e) {
        var voyageDeparture = $('#SelectVoyageDeparture');
        var voyageArrival = $('#SelectVoyageArrival');
        if (e.target.id != "SelectVoyageDeparture" && e.target.id != "SelectBoxClick_0" && voyageDeparture != null && voyageDeparture.css('display') == 'block')
            SelectBoxClose("0");
        if (e.target.id != "SelectVoyageArrival" && e.target.id != "SelectBoxClick_1" && voyageArrival != null && voyageArrival.css('display') == 'block')
            SelectBoxClose("1");
    });

    $(".Active").hover(function () {
        var heightValue = 0;
        var widthValue = 0;
        var value = 0;
        $("#ProfileInfo").animate({ height: "0" }, 200, function () {
            $("#ProfileInfo div").css("display", "none");
        });
        if ($(this).attr("id") != "OpenUpMenuPanelLayout") {
            hoverLink = $(this).attr("id");
        }
        $("#" + hoverLink).removeClass("HeaderPanelLayout").addClass("HeaderPanelLayoutSelector");
        value = $("div[id*=" + hoverLink + "_OpenUpMenuPanelContent]").length;
        if (value > 0) {
            $("div[id*=" + hoverLink + "_OpenUpMenuPanelContent]").css("display", "block");
            var sum = 30;
            $("div[id*=" + hoverLink + "_OpenUpMenuPanelContent]").each(function () { sum += $(this).height(); });
            widthValue = $("#OpenUpMenuPanelLayout").width();
            if (widthValue < 840) {
                $("#OpenUpMenuPanelLayout").css("width", "840px");
            }
            $("#OpenUpMenuPanelLayout").stop().animate({ height: sum.toString() + "px" }, 500);
        }
        else {
            $("#" + hoverLink).removeClass("HeaderPanelLayoutSelector").addClass("HeaderPanelLayout");
        }
    }, function () {
        $("#" + hoverLink).removeClass("HeaderPanelLayout").addClass("HeaderPanelLayoutSelector");
        value = $("div[id*=" + hoverLink + "_OpenUpMenuPanelContent]").length;
        $("#" + hoverLink).removeClass("HeaderPanelLayoutSelector").addClass("HeaderPanelLayout");
        if (value > 0) {
            $("#OpenUpMenuPanelLayout").stop().animate({ height: "0px" }, 500);
            $("div[id*=" + hoverLink + "_OpenUpMenuPanelContent]").hide();
            Cufon.replace('#HeaderPanelLayout > a', { color: 'white', hover: { color: 'White'} }).now;
        }
    });
});
function isValidDate(s) {
    var dateFormat = /^\d{1,4}[\.|\/|-]\d{1,2}[\.|\/|-]\d{1,4}$/;
    if (dateFormat.test(s)) {
        s = s.replace(/0*(\d*)/gi, "$1");
        var dateArray = s.split(/[\.|\/|-]/);
        dateArray[1] = dateArray[1] - 1;
        if (dateArray[2].length < 4) {
            dateArray[2] = (parseInt(dateArray[2]) < 50) ? 2000 + parseInt(dateArray[2]) : 1900 + parseInt(dateArray[2]);
        }
        var testDate = new Date(dateArray[2], dateArray[1], dateArray[0]);
        if (testDate.getDate() != dateArray[0] || testDate.getMonth() != dateArray[1] || testDate.getFullYear() != dateArray[2]) {
            return false;
        } else {
            return true;
        }
    } else {
        return false;
    }
}

function DateControl(mydate, type) {

    var currentTimeAndDate = new Date();
    if (mydate === undefined) {
        return false;
    }

    if (!isValidDate(mydate)) {
        $("#TextVoyageDate").val($.datepicker.formatDate('dd.mm.yy', currentTimeAndDate));
        return false;
    }

    var converttime = mydate.split(".");
    if (converttime.length != 3) {
        $("#TextVoyageDate").val($.datepicker.formatDate('dd.mm.yy', currentTimeAndDate));
        return false;
    }

    if (type == null) {
        var currentMyDate = new Date(converttime[2] + "/" + converttime[1] + "/" + converttime[0]);
        var strcurrentTimeAndDate = $.datepicker.formatDate('dd.mm.yy', currentTimeAndDate);
        if (strcurrentTimeAndDate != mydate) {
            if (currentTimeAndDate > currentMyDate) {
                $("#TextVoyageDate").val($.datepicker.formatDate('dd.mm.yy', currentTimeAndDate));
                return false;
            }
        }
        return true;
    }
    else {
        dateValue = $.datepicker.parseDate('dd.mm.yy', mydate);
        dateValue.setDate(dateValue.getDate() + (type));
        var strcurrentTimeAndDate = $.datepicker.formatDate('dd.mm.yy', currentTimeAndDate);
        var strcurrentMydate = $.datepicker.formatDate('dd.mm.yy', dateValue);
        if (strcurrentTimeAndDate != strcurrentMydate) {
            if (currentTimeAndDate > dateValue) {
                $("#TextVoyageDate").val($.datepicker.formatDate('dd.mm.yy', currentTimeAndDate));
                return false;
            }
            else {
                return true;
            }
        }
        return true;
    }
}

function ValidationGetVoyages(DepartureID, ArrivalID, Date) {
    if (!DepartureID > 0)
        return false;
    if (!ArrivalID > 0)
        return false;
    var controlTime = DateControl(Date, null);
    if (Date == null || Date == NaN || Date == '' || Date == undefined || !controlTime)
        return false;
    return true;
}
function SelectBoxClose(index) {
    if (index == "0") {
        //$("#SelectBoxClick_" + index).css("background-position", "-317px -108px");
//        $("#SelectVoyageDeparture").css("display", "none");
        //$("#SelectVoyageDeparture").attr("size", "0");
        //if ($("#TextVoyageDeparture").val() != '') {
        //    GetArrivals();
        //}
        //GetArrivals();
    }
    else if (index == "1") {
       // $("#SelectBoxClick_" + index).css("background-position", "-317px -108px");
//        $("#SelectVoyageArrival").css("display", "none");
       // $("#SelectVoyageArrival").attr("size", "0");
    }
    else if (index == "2") {
//        $("#SelectBoxClick_0").css("background-position", "-317px -108px");
//        $("#SelectBoxClick_1").css("background-position", "-317px -108px");
//        $("#SelectVoyageDeparture").css("display", "none");
//        $("#SelectVoyageDeparture").attr("size", "0");
//        $("#SelectVoyageArrival").css("display", "none");
//        $("#SelectVoyageArrival").attr("size", "0");
    }
}
function SelectBoxOpen(index, keypress) {
    if (Lock || ChangeLock) {
        return;
    }
    var optionLenght = 0;
    if (index == "0") {
       
        SelectBoxClose("1");
        //$("#TextVoyageDeparture").focus();
        if ($("#SelectVoyageDeparture").css("display") == "none" || keypress) {
            optionLenght = $("#SelectVoyageDeparture option").length;
            if (optionLenght > 0) {
                $("#SelectVoyageDeparture").css("display", "block");
                $("#SelectVoyageDeparture").attr("size", "15");
                $("#SelectBoxClick_" + index).css("background-position", "-295px -108px");
                $("#SelectVoyageDeparture").children().get(0).selected = false;
            }
            allOptions = !keypress;
        }
        else
            SelectBoxClose(index);
    }
    else if (index == "1") {
        //$("#SelectVoyageDeparture").css("display", "none");
        //$("#SelectVoyageDeparture").attr("size", "0");
        //$("#TextVoyageArrival").focus();
        if ($("#SelectVoyageArrival").css("display") == "none" || keypress) {
            optionLenght = $("#SelectVoyageArrival option").length;
            if (optionLenght > 0) {
                $("#SelectVoyageArrival").css("display", "block");
                $("#SelectVoyageArrival").attr("size", "15");
                //$("#SelectBoxClick_0").css("background-position", "-317px -108px");
                //$("#SelectBoxClick_" + index).css("background-position", "-295px -108px");
                $("#SelectVoyageArrival").children().get(0).selected = false;
            }
            allOptions = !keypress;
        }
        else
            SelectBoxClose(index);
    }
    else if (index == "2") {
//        if ($("#SelectVoyageFlights").css("display") == "none") {
//            optionLenght = $("#SelectVoyageFlights option").length;
//            if (optionLenght > 0) {
//                $("#SelectVoyageFlights").css("display", "block");
//                $("#SelectVoyageFlights").attr("size", "15");
//                //$("#SelectBoxClick_" + index).css("background-position", "-295px -108px");
//            }
//            SelectBoxClose(2);
//        } else {
//            $("#SelectBoxClick_" + index).css("background-position", "-317px -108px");
//            $("#SelectVoyageFlights").css("display", "none");
//            $("#SelectVoyageFlights").attr("size", "0");

//        }
    }
}
function GetArrivals() {
    if (parameters != '&DepartureID=' + $(meID).val()) {
        if (meSelectBox != undefined) {
            meSelectBox.html('');
            GetVoyageList();
        }
        else
            meSelectBox = $('#SelectVoyageArrival');

        //$("#TextVoyageArrival").val('');
        if (meID == undefined) {
            meID = $("#SelectVoyageDeparture");
        }
        parameters = '&DepartureID=' + $(meID).val();
//        if ($("#SelectVoyageDeparture option:selected").val() == '1227') {
//            alert("1 Mart 2014 tarihi itibari ile Denizli Otogar taşınacaktır.Yeni adres :TOPRAKLI MAH İZMİR BULVARI NO:41 PERON:6,7")
//        }
        AjaxAction(parameters, 'LoadArrivals', meSelectBox, function (response) {
            
            $(meSelectBox).html($(response).html());
            $('#SelectVoyageArrival option')[0].selected = "true";
            //$("#TextVoyageArrival").val($("#SelectVoyageArrival option:selected").html());
            //$("#SelectVoyageArrival").filterByText($("#TextVoyageArrival"), true);
            isBusy = false;
            
            GetVoyageList();
            if ($("#TextVoyageFlights").val() != undefined) {
                GetFlights($("#SelectVoyageDeparture option:selected").val(), $("#SelectVoyageArrival option:selected").val());
            }
        }, document.location)
    }
}
var lastOptions = "";
$(document).ready(function () {
    jQuery.fn.filterByText = function (textbox, selectSingleMatch) {
        if (Lock || ChangeLock) {
            return;
        }
        return this.each(function () {
            var select = this;
            var KeyCode = 0;
            var options = [];
            $(select).find('option').each(function () {
                options.push({ value: $(this).val(), text: $(this).text() });
            });
            $(select).data('options', options);
            $(textbox).bind('change keyup', function (e) {
                KeyCode = e.charCode ? e.charCode : e.keyCode;

                if (KeyCode == 40 || KeyCode == 38) return false;
                var options = $(select).empty().scrollTop(0).data('options');
                var search = $.trim($(this).val());
                if (allOptions) {
                    search = "";
                    allOptions = false;
                }
                var regex = new RegExp(search.replace('i', 'İ').toUpperCase(), 'gi');
                var count = 0;
                $.each(options, function (i) {
                    var option = options[i];
                    if (option.text.toUpperCase().match(regex) != null) {
                        $(select).append($('<option>').text(option.text).val(option.value));
                        count++;
                        if (count == 1) {
                            lastOptions = option.text;
                        }
                    }
                });
                if (count == 0) {
                    if (lastOptions != "") {
                        $(textbox).val(lastOptions);
                    }
                    else {
                        $(textbox).val(options[0].text);
                    }
                }
                if (selectSingleMatch == true && $(select).children().length > 0) {
                    if ($('#TextVoyageDeparture').val() != '')
                        $(select).children().get(0).selected = true;
                    else
                        $(select).children().get(0).selected = false;
                }
            });
        });
    };
    $(function () {
        $("#SelectVoyageDeparture").filterByText($("#TextVoyageDeparture"), true);
    });
    $("#SelectVoyageDeparture").change(function () {
        
        GetArrivals();
        //$("#TextVoyageDeparture").val($("#SelectVoyageDeparture option:selected").html());
    });
    $("#SelectVoyageArrival").change(function () {
       // $("#TextVoyageArrival").val($("#SelectVoyageArrival option:selected").html());
        if ($("#WherePassenger").val() == "True") {
            GetFlights($("#SelectVoyageDeparture option:selected").val(), $("#SelectVoyageArrival option:selected").val());
        }
        if ($("#WherePassenger").val() != "True") {
            GetVoyageList();
        }
    });
    $("#SelectVoyageDeparture").click(function () {
//        $("#TextVoyageDeparture").val($("#SelectVoyageDeparture option:selected").html());
//        $("#TextVoyageDeparture").focus();
      // SelectBoxClose("0");
    });
    $("#SelectVoyageArrival").click(function () {
       // $("#TextVoyageArrival").val($("#SelectVoyageArrival option:selected").html());
        //$("#SelectVoyageArrival").change();
        //$("#TextVoyageArrival").focus();
        //SelectBoxClose("1");
    });
    $("#TextVoyageDeparture").click(function () {
        $("#TextVoyageArrival").val($("#SelectVoyageArrival option:selected").html());
        SelectBoxOpen("0");
        if ($("#SelectVoyageDeparture").children().lenght > 0)
            $("#SelectVoyageDeparture").children().get(0).selected = false;
    });
    $("#TextVoyageArrival").click(function () {
        $("#SelectVoyageArrival").filterByText($("#TextVoyageArrival"), true);
        $("#TextVoyageArrival").val($("#SelectVoyageArrival option:selected").html());
        SelectBoxOpen("1");
        if ($("#SelectVoyageArrival").children().lenght > 0)
            $("#SelectVoyageArrival").children().get(0).selected = false;
    });

    $("#TextVoyageArrival").mousedown(function () {
        $("#SelectVoyageArrival").filterByText($("#TextVoyageArrival"), true);
    });

    $("#TextVoyageDeparture").keyup(function (e) {

        if (Lock || ChangeLock) {
            return;
        }
        var KeyCode = e.charCode ? e.charCode : e.keyCode;
        if (KeyCode == 13) {
            $("#TextVoyageDeparture").val($("#SelectVoyageDeparture option:selected").html());
            SelectBoxClose("0");
        }
        else if (KeyCode == 40) {

            if ($('#SelectVoyageDeparture option:selected').length == 0) {
                $('#SelectVoyageDeparture option')[0].selected = "true";
            }
            else {
                $('#SelectVoyageDeparture option:selected').next('option').attr('selected', 'selected');
            }
            $("#SelectVoyageDeparture").change();

            $("#SelectVoyageDeparture").css("display", "block");
            $("#SelectVoyageDeparture").attr("size", "15");
        }
        else if (KeyCode == 38) {

            if ($('#SelectVoyageDeparture option:selected').length == 0)
                $('#SelectVoyageDeparture option')[0].selected = "true";
            else
                $('#SelectVoyageDeparture option:selected').prev('option').attr('selected', 'selected');
            $("#SelectVoyageDeparture").change();

            $("#SelectVoyageDeparture").css("display", "block");
            $("#SelectVoyageDeparture").attr("size", "15");
        }
        else {
            SelectBoxOpen("0", true);
        }
    });
    $("#TextVoyageArrival").keyup(function (e) {

        var KeyCode = e.charCode ? e.charCode : e.keyCode;

        if (KeyCode == 13) {
            $("#TextVoyageArrival").val($("#SelectVoyageArrival option:selected").html());
            //$('#SelectVoyageArrival option')[0].selected = "true";
            $("#SelectVoyageArrival").change();
            SelectBoxClose("1");
        }
        else if (KeyCode == 40 && $("#SelectVoyageArrival").css("display") == "block") {
            if ($('#SelectVoyageArrival option:selected').length == 0)
                $('#SelectVoyageArrival option')[0].selected = "true";
            else
                $('#SelectVoyageArrival option:selected').next('option').attr('selected', 'selected');
            $("#SelectVoyageArrival").change();
        }
        else if (KeyCode == 38 && $("#SelectVoyageArrival").css("display") == "block") {
            if ($('#SelectVoyageArrival option:selected').length == 0)
                $('#SelectVoyageArrival option')[0].selected = "true";
            else
                $('#SelectVoyageArrival option:selected').prev('option').attr('selected', 'selected');
            $("#SelectVoyageArrival").change();
        }
        else {
            SelectBoxOpen("1", true);
        }
    });
});

function LoadHomeDistricts(control) {
    parameters = '&CityID=' + $(control).val();
    var callBackFunction = function(response) {
        if (response != '' && response != 'false') {
            $('#HomeDistrict').html($(response).html());
        }
    };
    AjaxAction(parameters, 'LoadHomeDistricts', null, callBackFunction, '/webpos/152');
}

function LoadWorkDistricts(control) {
    parameters = '&CityID=' + $(control).val();
    var callBackFunction = function(response) {
        if (response != '' && response != 'false') {
            $('#WorkDistrict').html($(response).html());
        }
    };
    AjaxAction(parameters, 'LoadWorkDistricts', null, callBackFunction, '/webpos/152');
}

function IsEmail(value) {
    if (value != '') {
        var emailreg = /^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{13}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        return emailreg.test(value);
    }
    return false;
}

function ValidateYolKartForm(form) {
    var alertMessage = "";
    var YolKartForm = $(form).get(0);
    var Email = YolKartForm["Email"].value;
    var CellPhone = YolKartForm["CellPhone"].value;

    var Result = true;
    if (Email == null || Email == "") {
        alertMessage = "E-posta alanı boş geçilemez.";
        Result = false;

    } else if (!IsEmail(Email)) {
        alertMessage = "Geçerli bir e-posta adresi giriniz.";
        Result = false;
    }

    if (CellPhone == null || CellPhone == "") {
        alertMessage += "Cep telefonu alanı boş geçilemez.";
        Result = false;
    }
    if (!Result)
        alert(alertMessage);
    return Result;
}

function ValidateLoginForm() {
    var UserName = document.LoginForm.UserName;
    var Password = document.LoginForm.Password;
    if (UserName.value == '') {
        alert("Lütfen Yolkart / TC Kimlik / Onaylı Cep Telefonu Numarası bilgilerinden birini giriniz.");
        UserName.focus();
        return false;
    }
    else if (Password.value == '') {
        alert("Lütfen parolanızı yazınız.");
        Password.focus();
        return false;
    }
    return true;
}