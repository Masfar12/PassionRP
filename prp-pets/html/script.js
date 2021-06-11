
var width;
var height;

window.addEventListener('message', function(event) {
    let item = event.data;

    switch (item.type) {
        case 'ui': {
            if (item.status) {

                console.log("show")
                $('#hud').fadeIn(250);

                width = $(window).width();
                height = $(window).height();


            } else {
                $('#hud').fadeOut(250);
            }
            break;
        }
        case 'coords': {

            let h_sum = $("#hud").height();

            let b = (item.hit_y - item.y);
            let a = 0.3;

            let y = item.hit_y - h_sum/height;
            let x = 0;

            if(y > 0) {
                x = Math.sqrt(Math.pow(a, 2) * (1 - ((Math.pow(y, 2) / Math.pow(b, 2)))));
            } else {
                x = a;
            }

            let x_screen = x + item.hit_x;

            if(!isNaN(x) || (item.y * height - h_sum) <= 20) {
                $("#hud").css('top', (h_sum+20)/height * 100 + 'vh');
                $("#hud").css('left', x_screen * 100 + 'vw');
            } else {
                $("#hud").css('top', item.y * 100 + 'vh');
                $("#hud").css('left', item.x * 100 + 'vw');
            }

            if (item.hp && item.comida && item.agua) {
                $('.perritos .hp a').html(Math.round(item.hp))
                $('.perritos .comida a').html(Math.round(item.comida))
                $('.perritos .agua a').html(Math.round(item.agua))
            }

            break;
        }
        default:
    }
})

$('#hud').hide();