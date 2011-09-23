function update_side_saleoff()
{
  $.get("/sanpham/giamgia/ajax", function(data){
    $("#divSaleOff").html(data);
    setTimeout(update_side_saleoff, 3000);
  });
}
/*
$(document).ready(function(){
  setTimeout(update_side_saleoff, 3000);
});
$(document).ready(function(){
  $('a.agallery').lightBox();
});
*/

$(document).ready(function() {
    $('#slides').cycle({
        // fx:     'scrollLeft,scrollDown,scrollRight,scrollUp,fade,zoom,blindX,blindY,blindZ,growX,growY,curtainX,curtainY',
        fx:     'fade',
        speed:   800,
        timeout: 4000,
        next:   '#next',
        prev:   '#prev'
    });
});

$(document).ready(function(){
  $('#menu1').menuTree({multiOpenedSubMenu: true});
});
$(document).ready(function() {
    $("#makeMeScrollable").smoothDivScroll({
        autoScroll: "onstart",
        autoScrollDirection: "backandforth",
        autoScrollStep: 1,
        autoScrollInterval: 15,
        startAtElementId: "startAtMe",
        visibleHotSpots: "always" });
});
function trim(str, chars) {
	return ltrim(rtrim(str, chars), chars);
}

function ltrim(str, chars) {
	chars = chars || "\\s";
	return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
}

function rtrim(str, chars) {
	chars = chars || "\\s";
	return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
}