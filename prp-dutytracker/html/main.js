$(function () {
    let player = 0
    let target = 0
    window.addEventListener('message', function (event) {
        var item = event.data;
        if (item.type === "trackerUi") {
            if (item.state == true) {
                player = item.player
                populate(item.dutyPlayers);
                $('.officers').attr('id', player);
                $('.track').fadeIn(150);
            } else {
                $('.track').fadeOut(150);
            }
        }
    })
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://prp-dutytracker/exit', JSON.stringify({}));
            $('.track').fadeOut(150);
            return
        }
    };

    $('.officers').on('click', '.ping', function () {

        target = $(this).data('ping');

        if (player == target) {
            $.post('http://prp-dutytracker/exit', JSON.stringify({ message: 'You can\'t ping yourself', type: 'error' }));
            $('.track').fadeOut(150);
        } else {
            $.post('http://prp-dutytracker/ping', JSON.stringify({ id: target }));
            $('.track').fadeOut(150);
        }

    });

    $('.officers').on('click', '.trackbutton', function () {

        target = $(this).data('trackbutton');

        if (player == target) {
            $.post('http://prp-dutytracker/exit', JSON.stringify({ message: 'You can\'t track yourself', type: 'error' }));
            $('.track').fadeOut(150);
        } else {
            $.post('http://prp-dutytracker/track', JSON.stringify({ id: target }));
            $('.track').fadeOut(150);
        }

    });

    function populate(data) {
        $('.track .officers').html('');

        data.sort(function (a, b) {
            let idA = a.id;
            let idB = b.id;
            if (idA < idB)
                return -1
            if (idA > idB)
                return 1
            return 0
        });

        for (var i = 0; i < data.length; i++) {
            let id = data[i].source;
            let callsign = data[i].label;

            let element = '<div class="officer">' +
                '<span class="officer-name">' + callsign + '</span>' +
                '<span class="officer-actions">' +
                '<button class="ping" data-ping="' + id + '">Ping</button> ' +
                '<button class="trackbutton" data-trackbutton="' + id + '">Track</button>' +
                '</span>' +
                '</div>' +
                '<hr>';

            $('.track .officers').append(element);
        };
    }

})