//= require jquery
//= require jquery_ujs
//= stub jquery-ui
//= stub active_admin
//= require_tree .

// Go to Top
$(document).ready(function(){
  header = $('#Header');
  mainGoTop = $('#mainGoTop');
  mainGoTop.hide();

  mainGoTop.click(function () {
    $('body, html').animate({scrollTop: 0}, 500);
    return false;
  });

  $(window).scroll(function () {
    var scroll = $(this).scrollTop();

    if(scroll > 200) {
      mainGoTop.fadeIn("fast");
    } else {
      mainGoTop.fadeOut("fast");
    }
  })
});
