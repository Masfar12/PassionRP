function calculateDisplayPrice(stockPrice) {
    const wsPercentage = 90;
    const addPercentage = 20;

    const regPrice = stockPrice / (wsPercentage / 100);
    return Math.ceil(regPrice + (regPrice * (addPercentage / 100)));
}

$(document).ready(function(){
    var GlobalVlist = null

 window.addEventListener( 'message', function( event ) {
        var item = event.data;
        var Clist = item.Clist;
        var CSoldlist = item.CSoldlist;
        var Vlist = item.Vlist;
        var COlist = item.COlist;
        var Elist = item.Elist;
        var ClistCount = item.ClistCount;
        var CSoldlistCount = item.CSoldlistCount;
        var VlistCount = item.VlistCount;
        var ElistCount = item.ElistCount;
        var i = 0;
        var VehicleImageList = []
        var VehicleImageListPC = []

        GlobalVlist = Vlist
        if ( item.showPlayerMenu == "refreshmoney" ) { // Hide the menu
            document.getElementById("cmoney").innerHTML = "" + item.comoney + "$";
        } else if ( item.showPlayerMenu == "return" ) { // Hide the menu
            $('body').css('display','block');
        } else if ( item.showPlayerMenu == "addemp" ) { // Hide the menu
            $("#tbodyemployers").append(
                '<tr id="'+ Elist[i].Name.replace(" ", "_") +'_Em_tr">'+
                    '<td>'+ Elist[i].Name.replace("_", " ") +'</td>'+
                    '<td>'+ Elist[i].age +'</td>'+
                    '<td>'+ Elist[i].sex +'</td>'+
                    '<td>'+ Elist[i].grade +'</td>'+
                    '<td>'+ Elist[i].salary +'$</td>'+
                    '<td id="'+ Elist[i].CitizenId.replace(" ", "_") +'_Em" onclick="deleterow(this.id)"><i class="fa fa-trash trash"></i></td>'+
                '</tr>'
            );
        } else if ( item.showPlayerMenu == true ) {

            $('body').css('display','block');
            if (item.User == "boss"){
                $('#bosstab').css('display','block');
                $('#dashboardtab').css('display','block');
                $('#customerstab').css('display','block');
                $('#carssoldtabletab').css('display','block');
                $('#vehiclespagetab').css('display','block');
            } else if (item.User == "notboss") {
                $('#dashboardtab').css('display','block');
                $('#customerstab').css('display','block');
                $('#carssoldtabletab').css('display','block');
                $('#vehiclespagetab').css('display','block');
                $('#bosstab').css('display','none');
            } else {
                openpage('catalogpage')
                $('#dashboardtab').css('display','none');
                $('#customerstab').css('display','none');
                $('#carssoldtabletab').css('display','none');
                $('#vehiclespagetab').css('display','none');
                $('#bosstab').css('display','none');
                toggleSearchBar(true);
            }
            $("#vehicles").html("");
            document.getElementById("customersnum").innerHTML = "" + COlist.Customers + "";
            document.getElementById("carssold").innerHTML = "" + COlist.CarsSold + "";
            document.getElementById("earned").innerHTML = "" + COlist.MoneyEarned + "";
            document.getElementById("cmoney").innerHTML = "" + COlist.Money + "$";

            $('.counter').counterUp({
                delay: 10,
                time: 2000
            });
            $('.counter').addClass('animated fadeInDownBig');
            $('h3').addClass('animated fadeIn');

            $("#tbodycustomers").html("");
            i = 0;
            while (i < ClistCount + 0) {
                $("#tbodycustomers").append(
                    '<tr id="'+ Clist[i].Plate +'_tr">'+
                        '<td>'+ Clist[i].Name.replace("_", " ") +'</td>'+
                        '<td>'+ Clist[i].CarName +'</td>'+
                        '<td>'+ Clist[i].Plate +'</td>'+
                        '<td>'+ Clist[i].Price +'$</td>'+
                        '<td><i class="'+ Clist[i].Paid +'"></i></td>'+
                        '<td id="' + Clist[i].Plate +'" onclick="deleteroe(this.id)"><i class="fa fa-trash trash"></i></td>'+
                    '</tr>'
                );
                i++;
            }

            $("#tbodycarssold").html("");
            i = 0;
            while (i < CSoldlistCount + 0) {
                $("#tbodycarssold").append(
                    '<tr>'+
                        '<td>'+ CSoldlist[i].Name.replace("_", " ") +'</td>'+
                        '<td>'+ CSoldlist[i].CarName +'</td>'+
                        '<td>'+ CSoldlist[i].Plate +'</td>'+
                        '<td>'+ CSoldlist[i].PriceStock +'$</td>'+
                        '<td>'+ CSoldlist[i].PriceSold +'$</td>'+
                    '</tr>'
                );
                i++;
            }

            $("#tbodyemployers").html("");
            i = 0;
            while (i < ElistCount + 0) {
                $("#tbodyemployers").append(
                    '<tr id="'+ Elist[i].Name.replace(" ", "_") +'_Em_tr">'+
                        '<td>'+ Elist[i].Name.replace("_", " ") +'</td>'+
                        '<td>'+ Elist[i].age +'</td>'+
                        '<td>'+ Elist[i].sex +'</td>'+
                        '<td>'+ Elist[i].grade +'</td>'+
                        '<td>'+ Elist[i].salary +'$</td>'+
                        '<td id="'+ Elist[i].CitizenId.replace(" ", "_") +'_Em" onclick="deleterow(this.id)"><i class="fa fa-trash trash"></i></td>'+
                    '</tr>'
                );
                i++;
            }
            $("#vehiclespage").html("");
            i = 0;
            while (i < VlistCount + 0) {
                var VehicleNameId = Vlist[i].Name.replace(" ", "_") + "_PC"
                VehicleImageListPC.push({Name: VehicleNameId, Img: Vlist[i].Image})
                $("#vehiclespage").append(
                    '<div id="'+ VehicleNameId +'" class="card">'+
                        '<div class="card-title">'+
                            '<a href="#" class="toggle-info btn">'+
                            '<span class="left"></span>'+
                            '<span class="right"></span>'+
                            '</a>'+
                            '<h2>'+
                                ''+ Vlist[i].Name +''+
                                '<small>'+ Vlist[i].Price +'$</small>'+
                            '</h2>'+
                        '</div>'+
                        '<div class="card-flap flap1">'+
                            '<div id="'+ VehicleNameId +'_applyimage" class="card-description">'+

                            '</div>'+
                            '<div class="card-flap flap2">'+
                                '<div class="card-actions">'+
                                    '<a href="#" class="btn" id="'+ Vlist[i].Model +'" onclick="BuyCar(this.id)">Buy Now</a>'+
                                    '<a href="#" class="btn" id="'+ Vlist[i].Model +'" onclick="TestCar(this.id)">Test Drive</a>'+
                                '</div>'+
                            '</div>'+
                        '</div>'+
                    '</div>'
                );
                i++;
            }
            $("#catalogpage").html("");
            i = 0;
            while (i < VlistCount + 0) {
                var VehicleNameId = Vlist[i].Name.replace(" ", "_") 
                VehicleImageList.push({Name: VehicleNameId, Img: Vlist[i].Image})

                const sellPrice = calculateDisplayPrice(VList[i].Price);

                $("#catalogpage").append(
                    '<div id="'+ VehicleNameId +'" class="card">'+
                        '<div class="card-title">'+
                            '<a href="#" class="toggle-info btn">'+
                                '<span class="left"></span>'+
                                '<span class="right"></span>'+
                            '</a>'+
                            '<h2>'+
                                ''+ Vlist[i].Name +''+
                                '<small>'+ sellPrice +'$</small>'+
                            '</h2>'+
                        '</div>'+
                        '<div class="card-flap flap1">'+
                            '<div id="'+ VehicleNameId +'_applyimage" class="card-description">'+
                                
                            '</div>'+
                        '</div>'+
                    '</div>'
                );
                i++;
            }

            var vehicleImages = document.querySelectorAll("[data-src]");
            var observerOptions = {
                threshold: 1
            }
            var imgObserver = new IntersectionObserver((entries, imgObserver) => {
                entries.map(entry => {
                    if (!entry.isIntersecting) {
                        return;
                    } else {
                        preloadImage(entry.target);
                        imgObserver.unobserve(entry.target);
                    }
                })
            }, observerOptions)

            vehicleImages.forEach(image => {
                imgObserver.observe(image)
            });
    
        } else if ( item.showPlayerMenu == false ) { // Hide the menu
            $('body').css('display','none');
        }



        var zindex = 10;
    
        $("div.card").click(function(e){
            e.preventDefault();

            var isShowing = false;
            var CurrentId = this.id;
            var divImage = null

            $.each(VehicleImageList, function(i, vehicle){
                if (CurrentId == vehicle.Name) {
                    divImage = vehicle.Img
                }
            })

            if (divImage != null) {
                
            }else{
                $.each(VehicleImageListPC, function(i, vehicle){
                    if (CurrentId == vehicle.Name) {
                        divImage = vehicle.Img
                    }
                })
            }
            $("#"+ CurrentId +"_applyimage").html("")
            $("#"+ CurrentId +"_applyimage").append('<img src="'+ divImage +'">')
            if ($(this).hasClass("show")) {
            isShowing = true
            }

            if ($("div.cards").hasClass("showing")) {
                // a card is already in view
                $("div.card.show")
                    .removeClass("show");

                if (isShowing) {
                    // this card was showing - reset the grid
                    $("div.cards")
                    .removeClass("showing");
                } else {
                    // this card isn't showing - get in with it
                    $(this)
                    .css({zIndex: zindex})
                    .addClass("show");

                }
                zindex++;

            } else {
            // no cards in view
                $("div.cards")
                    .addClass("showing");

                
                $(this)
                    .css({zIndex:zindex})
                    .addClass("show");

                zindex++;
            }
            
        });
 } );
    

    $(document).keyup(function(e) {
        if ( e.keyCode == 27 ) {
            $("#vehiclespage-and-catalog-search-bar").val("")
            $.post('http://prp-vehicleshop_new/closeButton', JSON.stringify({}));2
        }
    });

    $("#vehiclespage-and-catalog-search-bar").keyup(function() {
        var searchValue = $("#vehiclespage-and-catalog-search-bar").val()
        searchValue = searchValue.toLowerCase()
        
        var newVlist = new Array()
        GlobalVlist.map(vehicle => {
            console.log(vehicle.Brand);
            console.log(vehicle.Category);
            if (vehicle.Model.toLowerCase().includes(searchValue) || vehicle.Name.toLowerCase().includes(searchValue) || searchValue == undefined || searchValue == '' || vehicle.Category.toLowerCase().includes(searchValue) || vehicle.Brand.toLowerCase().includes(searchValue)) {
                newVlist.push(vehicle)
            }
        });
        $("#vehiclespage").html("");
        $("#catalogpage").html("");
        var n = 0;
        while (n < newVlist.length + 0) {
            $("#vehiclespage").append(
                '<div class="card">'+
                    '<div class="card-title">'+
                        '<a href="#" class="toggle-info btn">'+
                        '<span class="left"></span>'+
                        '<span class="right"></span>'+
                        '</a>'+
                        '<h2>'+
                            ''+ newVlist[n].Name +''+
                            '<small>'+ newVlist[n].Price +'$</small>'+
                        '</h2>'+
                    '</div>'+
                    '<div class="card-flap flap1">'+
                        '<div class="card-description">'+
                        '<img data-src="'+ newVlist[n].Image +'">'+
                        '</div>'+
                        '<div class="card-flap flap2">'+
                        '<div class="card-actions">'+
                            '<a href="#" class="btn" id="'+ newVlist[n].Model +'" onclick="BuyCar(this.id)">Buy Now</a>'+
                            '<a href="#" class="btn" id="'+ newVlist[n].Model +'" onclick="TestCar(this.id)">Test Drive</a>'+
                        '</div>'+
                        '</div>'+
                    '</div>'+
                '</div>'
            );

            const sellPrice = calculateDisplayPrice(newVlist[n].Price);
            $("#catalogpage").append(
                '<div class="card">'+
                    '<div class="card-title">'+
                        '<a href="#" class="toggle-info btn">'+
                        '<span class="left"></span>'+
                        '<span class="right"></span>'+
                        '</a>'+
                        '<h2>'+
                            ''+ newVlist[n].Name +''+
                            '<small>'+ sellPrice +'$</small>'+
                        '</h2>'+
                    '</div>'+
                    '<div class="card-flap flap1">'+
                        '<div class="card-description">'+
                        '<img data-src="'+ newVlist[n].Image +'">'+
                        '</div>'+
                    '</div>'+
                '</div>'
            );
            n++;
        }
        var vehicleImages = document.querySelectorAll("[data-src]");
        var observerOptions = {
            threshold: 1
        }
        var imgObserver = new IntersectionObserver((entries, imgObserver) => {
            entries.map(entry => {
                if (!entry.isIntersecting) {
                    return;
                } else {
                    preloadImage(entry.target);
                    imgObserver.unobserve(entry.target);
                }
            })
        }, observerOptions)

        vehicleImages.forEach(image => {
            imgObserver.observe(image)
        });
        var zindexSearch = 10

        $("div.card").click(function(e){
            e.preventDefault();
    
            var isShowing = false;
    
            if ($(this).hasClass("show")) {
            isShowing = true
            }
    
            if ($("div.cards").hasClass("showing")) {
            // a card is already in view
            $("div.card.show")
                .removeClass("show");
    
            if (isShowing) {
                // this card was showing - reset the grid
                $("div.cards")
                .removeClass("showing");
            } else {
                // this card isn't showing - get in with it
                $(this)
                .css({zIndex: zindexSearch})
                .addClass("show");
    
            }
    
            zindexSearch++;
    
            } else {
            // no cards in view
            $("div.cards")
                .addClass("showing");
            $(this)
                .css({zIndex:zindexSearch})
                .addClass("show");
    
                zindexSearch++;
            }
            
        });    
    });

    function preloadImage(img) {
        const src = img.getAttribute("data-src")
        if (!src) {
            return;
        }
        img.src = src;
    }
})