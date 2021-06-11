/* No JS ;)
 *
 * Icons from entypo.com
 * Avatar from uifaces.com
 */
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


$(document).ready(function(){

    



    
});



