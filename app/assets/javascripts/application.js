//= require jquery
//= require jquery_ujs
//= stub jquery-ui
//= stub active_admin
//= require_tree .

$(document).ready(function(){
  // Go Top
  mainGoTop = $('#mainGoTop');
  mainGoTop.hide();

  mainGoTop.click(function () {
    $('body, html').animate({scrollTop: 0}, 500);
    return false;
  });

  // Header
  Top = $('#Top');
  Header = $('#Header');
  heightTop = Top.height();

  $(window).scroll(function () {
    var scroll = $(this).scrollTop();

    if(scroll > 200) {
      mainGoTop.fadeIn("fast");
    } else {
      mainGoTop.fadeOut("fast");
    }

    if(scroll > heightTop) {
      Header.css({'position':'fixed','top':0});
    } else {
      Header.css({'position':'absolute','top':''});
    }
  })
});
