// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
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
      mainGoTop.fadeIn("normal");
    } else {
      mainGoTop.fadeOut("normal");
    }
  })
});
