$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.type == "open") {
            FXRadio.SlideUp()
        }

        if (event.data.type == "close") {
            FXRadio.SlideDown()
        }
    });

    document.onkeyup = function (data) {
        if (data.which == 27) { // Escape key
            $.post('http://prp-radio/escape', JSON.stringify({}));
            FXRadio.SlideDown()
        } else if (data.which == 13) { // Escape key
            $.post('http://prp-radio/joinRadio', JSON.stringify({
                channel: $("#channel").val()
            }));
        }
    };
});

$(document).on('keydown', function(data) {
    if(data.which == 78) {
      $.post("http://prp_voice/talkOn", JSON.stringify({}));
    }
});

$(document).on("keyup", function(data) {
    if(data.which == 78) {
      $.post("http://prp_voice/talkOff", JSON.stringify({}));
    }
});

FXRadio = {}

$(document).on('click', '#submit', function(e){
    e.preventDefault();

    $.post('http://prp-radio/joinRadio', JSON.stringify({
        channel: $("#channel").val()
    }));
});

$(document).on('click', '#disconnect', function(e){
    e.preventDefault();

    $.post('http://prp-radio/leaveRadio');
});

FXRadio.SlideUp = function() {
    $(".container").css("display", "block");
    $(".radio-container").animate({bottom: "6vh",}, 250);
}

FXRadio.SlideDown = function() {
    $(".radio-container").animate({bottom: "-110vh",}, 400, function(){
        $(".container").css("display", "none");
    });
}