$("#revive").click(function () { $.post('http://prp-adminMenu/quick', JSON.stringify({ id: selected, type: 'revive' })); $(this).blur(); });
$("#godmode").click(function () { $.post('http://prp-adminMenu/quick', JSON.stringify({ type: 'godmode' })); $(this).blur(); });
$("#slay").click(function () { $.post('http://prp-adminMenu/quick', JSON.stringify({ id: selected, type: 'slay' })); $(this).blur(); });
$("#spectate").click(function () { $.post('http://prp-adminMenu/quick', JSON.stringify({ id: selected, type: 'spectate' })); $(this).blur(); });
$("#openinv").click(function () { $.post('http://prp-adminMenu/quick', JSON.stringify({ id: selected, type: 'openinv' })); $(this).blur(); });
$("#freeze").click(function () { $.post('http://prp-adminMenu/quick', JSON.stringify({ id: selected, type: 'freeze' })); $(this).blur(); });
$("#bring").click(function () { $.post('http://prp-adminmenu/quick', JSON.stringify({ id: selected, type: 'bring' })); $(this).blur(); });
$("#goto").click(function () { $.post('http://prp-adminMenu/quick', JSON.stringify({ id: selected, type: 'goto' })); $(this).blur(); });
$("#screenshot").click(function () { $.post('http://prp-adminMenu/quick', JSON.stringify({ id: selected, type: 'screenshot' })); $(this).blur(); });
$("#crash").click(function () { $.post('http://prp-adminMenu/quick', JSON.stringify({ id: selected, type: 'crash' })); $(this).blur(); });
$("#ban").click(function () { $.post('http://prp-adminMenu/quick', JSON.stringify({ id: selected, type: 'ban' })); $(this).blur(); });
$("#names").click(function () { $.post('http://prp-adminMenu/quick', JSON.stringify({ type: 'names' })); $(this).blur(); });
$("#blips").click(function () { $.post('http://prp-adminMenu/quick', JSON.stringify({ type: 'blips' })); $(this).blur(); });
$("#menu").click(function () { $.post('http://prp-adminMenu/quick', JSON.stringify({ id: selected, type: 'menu' })); $(this).blur(); });
$("#exitSpectate").click(function () { $(".admin-wrapper").fadeOut(250); $.post('http://prp-adminMenu/exitspectate', JSON.stringify({})); $(this).blur(); });
$("#closeMenu").click(function () { $(".admin-wrapper").fadeOut(250); $.post('http://prp-adminMenu/closemenu', JSON.stringify({})); $(this).blur(); });

$(document).keyup(function (e) {
    if (e.keyCode == 27) {
        $(".admin-wrapper").fadeOut(250);
        $.post('http://prp-adminMenu/closemenu', JSON.stringify({}));
    }
});

window.addEventListener('message', function (event) {
    if (event.data.type == "open") {
        $(".admin-player-list").html("");
        for(i in event.data.values){
            let playerdata = `
            <li class="player list-group-item d-flex justify-content-between align-items-center" data-name="${event.data.values[i].name}" data-job="${event.data.values[i].job}" data-bank="${event.data.values[i].bank}" data-cash="${event.data.values[i].cash}" id="${event.data.values[i].id}" type="button" style="background-color: #494f55; color: white;">
                ${event.data.values[i].name}
                <span class="badge bg-danger rounded-pill">${event.data.values[i].id}</span>
            </li>
            `;
            $(".admin-player-list").append(playerdata);
        }
        $(".admin-player-count").html(event.data.values.length);
        $(".admin-wrapper").fadeIn(250);
        
        $(".player").click(function(){
            selected = this.id;
            $(".player").removeClass("selected");
            $(".admin-player-selected").html($(this).data("name"));
            $(this).addClass("selected");
            $(".admin-controls").fadeIn(250);
            $(".admin-player-data").fadeIn(250);
        
            $("#player-name").html(`<div class="admin-text" id="player-name">Name: ${$(this).data("name")}</div>`);
            $("#player-job").html(`<div class="admin-text" id="player-job">Job: ${$(this).data("job")}</div>`);
            $("#player-cash").html(`<div class="admin-text" id="player-cash">Cash: $${$(this).data("cash")}</div>`);
            $("#player-bank").html(`<div class="admin-text" id="player-bank">Bank: $${$(this).data("bank")}</div>`);
        });
        
        $("#unselect").click(function(){
            $(".player").removeClass("selected");
            $(".admin-player-selected").html("Unselected");
            $(".admin-controls").fadeOut(250); 
            $(".admin-player-data").fadeOut(250);
        });
    } else if(event.data.type == "close"){
        $(".admin-wrapper").fadeOut(250);
    }
});