var selectedChar = null;
var WelcomePercentage = "30vh"
osMultiCharacters = {}
var Loaded = false;

$(document).ready(function (){
    window.addEventListener('message', function (event) {
        var data = event.data;

        if (data.action == "ui") {
            if (data.toggle) {
                $('.container').show();
                $(".welcomescreen").fadeIn(150);
                osMultiCharacters.resetAll();

                var originalText = "Retrieving player data";
                var loadingProgress = 0;
                var loadingDots = 0;
                $("#loading-text").html(originalText);
                var DotsInterval = setInterval(function() {
                    $("#loading-text").append(".");
                    loadingDots++;
                    loadingProgress++;
                    if (loadingProgress == 3) {
                        originalText = "Validating player data"
                        $("#loading-text").html(originalText);
                    }
                    if (loadingProgress == 4) {
                        originalText = "Retrieving characters"
                        $("#loading-text").html(originalText);
                    }
                    if (loadingProgress == 6) {
                        originalText = "Validating characters"
                        $("#loading-text").html(originalText);
                    }
                    if(loadingDots == 4) {
                        $("#loading-text").html(originalText);
                        loadingDots = 0;
                    }
                }, 500);
            
                setTimeout(function(){
                    $.post('http://prp-multicharacter/setupCharacters');
                    setTimeout(function(){
                        clearInterval(DotsInterval);
                        loadingProgress = 0;
                        originalText = "Retrieving data";
                        $(".welcomescreen").fadeOut(150);
                        osMultiCharacters.fadeInDown('.character-info', '20%', 400);
                        osMultiCharacters.fadeInDown('.characters-list', '20%', 400);
                        $.post('http://prp-multicharacter/removeBlur');
                    }, 2000);
                }, 2000);
            } else {
                $('.container').fadeOut(250);
                osMultiCharacters.resetAll();
            }
        }

        if (data.action == "setupCharacters") {
            setupCharacters(event.data.characters)
        }

        if (data.action == "setupCharInfo") {
            setupCharInfo(event.data.chardata)
        }
    });

    $('.datepicker').datepicker();
});

$('.continue-btn').click(function(e){
    e.preventDefault();

    // osMultiCharacters.fadeOutUp('.welcomescreen', undefined, 400);
    // osMultiCharacters.fadeOutDown('.server-log', undefined, 400);
    // setTimeout(function(){
    //     osMultiCharacters.fadeInDown('.characters-list', '20%', 400);
    //     osMultiCharacters.fadeInDown('.character-info', '20%', 400);
    //     $.post('http://prp-multicharacter/setupCharacters');
    // }, 400)
});

$('.disconnect-btn').click(function(e){
    e.preventDefault();

    $.post('http://prp-multicharacter/closeUI');
    $.post('http://prp-multicharacter/disconnectButton');
});

function setupCharInfo(cData) {
    if (cData == 'empty') {
        $('.character-info-valid').html('<span id="no-char">The selected character slot is not in use yet.<br><br>This character doesn\'t have information yet.</span>');
    } else {
        var gender = "Man"
        if (cData.charinfo.gender == 1) { gender = "Woman" }
        $('.character-info-valid').html(
        '<div class="character-info-box"><span id="info-label">Name: </span><span class="char-info-js">'+cData.charinfo.firstname+' '+cData.charinfo.lastname+'</span></div>' +
        '<div class="character-info-box"><span id="info-label">Birth date: </span><span class="char-info-js">'+cData.charinfo.birthdate+'</span></div>' +
        '<div class="character-info-box"><span id="info-label">Gender: </span><span class="char-info-js">'+gender+'</span></div>' +
        '<div class="character-info-box"><span id="info-label">Nationality: </span><span class="char-info-js">'+cData.charinfo.nationality+'</span></div>' +
        '<div class="character-info-box"><span id="info-label">Job: </span><span class="char-info-js">'+cData.job.label+'</span></div>' +
        '<div class="character-info-box"><span id="info-label">Cash: </span><span class="char-info-js">&dollar; '+cData.money.cash+'</span></div>' +
        '<div class="character-info-box"><span id="info-label">Bank: </span><span class="char-info-js">&dollar; '+cData.money.bank+'</span></div><br>' +
        '<div class="character-info-box"><span id="info-label">Phone number: </span><span class="char-info-js">'+cData.charinfo.phone+'</span></div>' +
        '<div class="character-info-box"><span id="info-label">Account number: </span><span class="char-info-js">'+cData.charinfo.account+'</span></div>');
    }
}

function setupCharacters(characters) {
    $.each(characters, function(index, char){
        $('#char-'+char.cid).html("");
        $('#char-'+char.cid).data("citizenid", char.citizenid);
        setTimeout(function(){
            $('#char-'+char.cid).html('<span id="slot-name">'+char.charinfo.firstname+' '+char.charinfo.lastname+'<span id="cid">' + char.citizenid + '</span></span>');
            $('#char-'+char.cid).data('cData', char)
            $('#char-'+char.cid).data('cid', char.cid)
        }, 100)
    })
}

$(document).on('click', '#close-log', function(e){
    e.preventDefault();
    selectedLog = null;
    $('.welcomescreen').css("filter", "none");
    $('.server-log').css("filter", "none");
    $('.server-log-info').fadeOut(250);
    logOpen = false;
});

$(document).on('click', '.character', function(e) {
    var cDataPed = $(this).data('cData');
    e.preventDefault();
    if (selectedChar === null) {
        selectedChar = $(this);
        if ((selectedChar).data('cid') == "") {
            $(selectedChar).addClass("char-selected");
            setupCharInfo('empty')
            $("#play-text").html("Create");
            $("#play").css({"display":"block"});
            $("#delete").css({"display":"none"});
            $.post('http://prp-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        } else {
            $(selectedChar).addClass("char-selected");
            setupCharInfo($(this).data('cData'))
            $("#play-text").html("Play");
            $("#delete-text").html("Delete");
            $("#play").css({"display":"block"});
            $("#delete").css({"display":"block"});
            $.post('http://prp-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        }
    } else if ($(selectedChar).attr('id') !== $(this).attr('id')) {
        $(selectedChar).removeClass("char-selected");
        selectedChar = $(this);
        if ((selectedChar).data('cid') == "") {
            $(selectedChar).addClass("char-selected");
            setupCharInfo('empty')
            $("#play-text").html("Register");
            $("#play").css({"display":"block"});
            $("#delete").css({"display":"none"});
            $.post('http://prp-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        } else {
            $(selectedChar).addClass("char-selected");
            setupCharInfo($(this).data('cData'))
            $("#play-text").html("Play");
            $("#delete-text").html("Delete");
            $("#play").css({"display":"block"});
            $("#delete").css({"display":"block"});
            $.post('http://prp-multicharacter/cDataPed', JSON.stringify({
                cData: cDataPed
            }));
        }
    }
});

$(document).on('click', '#create', function(e){
    e.preventDefault();
    $.post('http://prp-multicharacter/createNewCharacter', JSON.stringify({
        firstname: $('#first_name').val(),
        lastname: $('#last_name').val().replace('\'', ''),
        nationality: $('#nationality').val(),
        birthdate: $('#birthdate').val(),
        gender: $('select[name=gender]').val(),
        cid: $(selectedChar).attr('id').replace('char-', ''),
    }));
    $(".container").fadeOut(150);
    $('.characters-list').css("filter", "none");
    $('.character-info').css("filter", "none");
    osMultiCharacters.fadeOutDown('.character-register', '125%', 400);
    refreshCharacters()
});

$(document).on('click', '#accept-delete', function(e){
    $.post('http://prp-multicharacter/removeCharacter', JSON.stringify({
        citizenid: $(selectedChar).data("citizenid"),
    }));
    $('.character-delete').fadeOut(150);
    $('.characters-block').css("filter", "none");
    refreshCharacters()
});

function refreshCharacters() {
    $('.characters-list').html('<div class="character" id="char-1" data-cid=""><span id="slot-name">Empty Slot<span id="cid"></span></span></div><div class="character" id="char-2" data-cid=""><span id="slot-name">Empty Slot<span id="cid"></span></span></div><div class="character" id="char-3" data-cid=""><span id="slot-name">Empty Slot<span id="cid"></span></span></div><div class="character" id="char-4" data-cid=""><span id="slot-name">Empty Slot<span id="cid"></span></span></div><div class="character" id="char-5" data-cid=""><span id="slot-name">Empty Slot<span id="cid"></span></span></div><div class="character-btn" id="play"><p id="play-text">Select a character</p></div><div class="character-btn" id="delete"><p id="delete-text">Select a character</p></div>')
    setTimeout(function(){
        $(selectedChar).removeClass("char-selected");
        selectedChar = null;
        $.post('http://prp-multicharacter/setupCharacters');
        $("#delete").css({"display":"none"});
        $("#play").css({"display":"none"});
        osMultiCharacters.resetAll();
    }, 100)
}

$("#close-reg").click(function (e) {
    e.preventDefault();
    $('.characters-list').css("filter", "none")
    $('.character-info').css("filter", "none")
    osMultiCharacters.fadeOutDown('.character-register', '125%', 400);
})

$("#close-del").click(function (e) {
    e.preventDefault();
    $('.characters-block').css("filter", "none");
    $('.character-delete').fadeOut(150);
})

$(document).on('click', '#play', function(e) {
    e.preventDefault();
    var charData = $(selectedChar).data('cid');

    if (selectedChar !== null) {
        if (charData !== "") {
            $.post('http://prp-multicharacter/selectCharacter', JSON.stringify({
                cData: $(selectedChar).data('cData')
            }));
            // osMultiCharacters.fadeInDown('.welcomescreen', WelcomePercentage, 400);
            // osMultiCharacters.fadeInDown('.server-log', '25%', 400);
            setTimeout(function(){
                osMultiCharacters.fadeOutDown('.characters-list', "-40%", 400);
                osMultiCharacters.fadeOutDown('.character-info', "-40%", 400);
                osMultiCharacters.resetAll();
            }, 1500);
        } else {
            $('.characters-list').css("filter", "blur(2px)")
            $('.character-info').css("filter", "blur(2px)")
            osMultiCharacters.fadeInDown('.character-register', '25%', 400);
        }
    }
});

$(document).on('click', '#delete', function(e) {
    e.preventDefault();
    var charData = $(selectedChar).data('cid');

    if (selectedChar !== null) {
        if (charData !== "") {
            $('.characters-block').css("filter", "blur(2px)")
            $('.character-delete').fadeIn(250);
        }
    }
});

osMultiCharacters.fadeOutUp = function(element, time) {
    $(element).css({"display":"block"}).animate({top: "-80.5%",}, time, function(){
        $(element).css({"display":"none"});
    });
}

osMultiCharacters.fadeOutDown = function(element, percent, time) {
    if (percent !== undefined) {
        $(element).css({"display":"block"}).animate({top: percent,}, time, function(){
            $(element).css({"display":"none"});
        });
    } else {
        $(element).css({"display":"block"}).animate({top: "103.5%",}, time, function(){
            $(element).css({"display":"none"});
        });
    }
}

osMultiCharacters.fadeInDown = function(element, percent, time) {
    $(element).css({"display":"block"}).animate({top: percent,}, time);
}

osMultiCharacters.resetAll = function() {
    $('.characters-list').hide();
    $('.characters-list').css("top", "-40");
    $('.character-info').hide();
    $('.character-info').css("top", "-40");
    // $('.welcomescreen').show();
    $('.welcomescreen').css("top", WelcomePercentage);
    $('.server-log').show();
    $('.server-log').css("top", "25%");
}