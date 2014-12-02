/**********************************************
  * Router
  * (c) Hideaki Tanabe <http://blog.kaihatsubu.com>
  * reference http://tech.kayac.com/archive/javascript-url-dispatcher.html
  **********************************************/
(function($) {
  var pathname = location.pathname;
  $.route = function() {
    $.each(arguments, function(index) {
      var path = this["path"];
      var func = this["func"];
      if (path && func) {
        if (pathname.match(path)) {
          $(function() {
            func.apply(this);
          });
        }
      }
    });
  };
})(jQuery);

$.route(
  {path: /.*\/posts\/[0-9]+/,func: function() {
    showFunc();
  }},
  {path: /.*\/posts\/new/,func: function() {
    newFunc();
  }},
  {path: /.*\/posts/,func: function() {
    indexFunc();
  }},
  {path: /./,func: function() {
    indexFunc();
  }}
);

/**********************************************
 * Post#index
 **********************************************/
function indexFunc() {
}

/**********************************************
 * Post#show
 **********************************************/
function showFunc() {
  // $(window).scroll(function () {
  //   var s = $(this).scrollTop();
  //   var r = $('.show_right_wrap').offset().top;
  //   var l = $('.show_left').offset().top + $('.show_left').height();
  //   var f = l-r-$('.show_right').height();
  //
  //   if (0 <= s && s <= r) {
  //     $('.show_right').css('position','static');
  //   } else if (s > r && s < f) {
  //     $('.show_right').css('position','fixed');
  //     $('.show_right').css('top','0');
  //   } else if (s > f) {
  //     $('.show_right').css('position','absolute');
  //     $('.show_right').css('top',f);
  //   }
  // })
 }

/**********************************************
 * Post#new
 **********************************************/
function newFunc() {
  

}
