$(document).ready(function() {
  let IsAuthorized = false
  function closeAll() {
    $(".public-container").css('opacity', 0);
    $(".warrants-container").css('opacity', 0);
    $(".public-records").css('opacity', 0);
    $(".body").css('opacity', 0);
  }

  function openContainer() {
    $(".body").css('opacity', 1.0);
    $(".warrants-container").css('opacity', 1.0);
    $(".warrants-container").css('top', '5%');
    $(".public-container").css('top', '105%');
    $(".public-records").css('top', '105%');
  } 

  function openPublicRecords() {
    $(".body").css('opacity', 1);
    $(".public-container").css('opacity', 1);
    $(".warrants-container").css('top', '105%');
    $(".public-records").css('top', '105%');
    $(".public-container").css('top', '5%');
  }

  function openPublicHousingRecords() {
    $(".body").css('opacity', 1);
    $(".warrants-container").css('top', '105%');
    $(".public-container").css('top', '105%');
    $(".public-records").css('top', '5%');
    $(".public-records").css('opacity', 1);
    $.post('http://prp-mdt-2/GetPublicHousingRecords', JSON.stringify({}), function(Houses){
      SetupAllPlayerHouses(Houses);
    });
    $.post('http://prp-mdt-2/GetAuth', JSON.stringify({}), function(Auth){
      IsAuthorized = Auth
    });
  }

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

  window.addEventListener('message', function(event){
    var item = event.data;

    if(item.openWarrants === true) {
      closeAll();
      openContainer();
    }

    if(item.openSection == "publicrecords") {
      closeAll();
      openPublicRecords();
    }

    if(item.openSection == "publichousingrecords") {
      closeAll();
      openPublicHousingRecords();
    }

    if(item.closeGUI) {
      closeAll();
    }
    
  });

  function _keyup(e) {
    if (e.which == 27){
      $.post('http://prp-mdt-2/close', JSON.stringify({}));
      closeAll();
    }
  }

  document.onkeyup = _keyup;

  $(".warrants-container iframe, .public-container iframe").load(function(){
    $(this).contents().keyup(_keyup);
  });

  function SetupAllPlayerHouses(Houses) {
    let houseLocation = ''
    $("#dataInsert").html('');
    let headerElm = `
        <div style="order:1;" class="flexTable-cell">Property Owner</div>
				<div style="order:1;" class="flexTable-cell">Property Name</div>
				<div style="order:1;" class="flexTable-cell">Property Type</div>
				<div style="order:1;" class="flexTable-cell">Property Cost</div>
        <div style="order:1;" class="flexTable-cell">Property Location</div>
    `
    $("#dataInsert").append(headerElm);
    if (Houses.length > 0) {
      $.each(Houses, function(id, house){

        id = id + 2

        if (IsAuthorized == true) {
          let firstname = house.charinfo.firstname
          let lastname = house.charinfo.lastname
          house.owner = firstname + ' ' + lastname
        }
        $.post('http://prp-mdt-2/GetHouseLocation', JSON.stringify({houseCoords: house.coords}), function(Res){
          houseLocation = Res
          if (houseLocation !== '') {
            var elem = `
            <div style="order:`+id+`";" class="flexTable-cell" data-house="`+house.name+`">` + house.owner + `</div>
            <div style="order:`+id+`";" class="flexTable-cell" data-house="`+house.name+`">` + house.label + `</div>
            <div style="order:`+id+`";" class="flexTable-cell" data-house="`+house.name+`">House</div>
            <div style="order:`+id+`";" class="flexTable-cell" data-house="`+house.name+`">$` + house.price + `</div>
            <div style="order:`+id+`";" class="flexTable-cell" data-house="`+house.name+`">` + houseLocation + ` Suburb</div>`
          } else {
            var elem = `
            <div style="order:`+id+`";" class="flexTable-cell" data-house="`+house.name+`">` + house.owner + `</div>
            <div style="order:`+id+`";" class="flexTable-cell" data-house="`+house.name+`">` + house.label + `</div>
            <div style="order:`+id+`";" class="flexTable-cell" data-house="`+house.name+`">House</div>
            <div style="order:`+id+`";" class="flexTable-cell" data-house="`+house.name+`">$` + house.price + `</div>
            <div style="order:`+id+`";" class="flexTable-cell" data-house="`+house.name+`">Unknown</div>`
          }
          
          $("#dataInsert").append(elem);
        });
      });
    }
  }
});
