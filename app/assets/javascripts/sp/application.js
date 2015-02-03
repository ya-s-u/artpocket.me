//= require jquery
//= require jquery_ujs
//= require angular.min
//= require angular-masonry.min
//= require loader
//= require_self
//= require_tree .
//= stub jquery-ui
//= stub active_admin

$(document).ready(function(){
  // Slide Menu
  $("body").mobile_menu({
      menu: '#Slidemenu',
      menu_width: 260,
      prepend_button_to: '#SlidemenuButton',
      button_content:'<i class="icon-menu"></i>'
  });

  // Go Top
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

    // Clear transform
    if(!$('html').hasClass("build-menu-open")){
      $('#build-menu-page').removeAttr('style');
    }
  })
});
