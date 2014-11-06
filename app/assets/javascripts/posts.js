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
  {path: /.*\/posts\/\d+/,func: function() {
    showFunc();
  }},
  {path: /.*\/posts\/new/,func: function() {
    newFunc();
  }},
  {path: /.*\/posts/,func: function() {
    indexFunc();
  }}
);

/**********************************************
 * Post#index
 **********************************************/
function indexFunc() {
  $(window).load(function() {
    $('.index_list').masonry({
      itemSelector: 'li',
      columnWidth: 300,
      isFitWidth: true,
    });
  })
}

/**********************************************
 * Post#show
 **********************************************/
function showFunc() {
   var map;
   map = new GMaps({
     div: '#map',
     lat: 35.681382,
     lng: 139.766084,
     zoo: 16,
   });

   map.addMarker({
     lat: 35.681382,
     lng: 139.766084,
     title: '東京駅',
     infoWindow: {
       content: '<p>HTML Content</p>'
     }
   })

   $(window).load(function() {
     $(".detail_right_sns .twitter").socialbutton("twitter", {
       button : "horizontal",
       text : "つぶやきに含めるテキスト",
       url : "<%=request.url%>",
     }).width(95);

     $(".detail_right_sns .facebook").socialbutton("facebook_like", {
       button : "button_count",
       url : "<%=request.url%>",
     }).width(110);

     $(".detail_right_sns .google").socialbutton("google_plusone", {
       button : "medium",
       url : "<%=request.url%>",
       count : true,
     }).width(70);

     $(".detail_right_sns .hatena").socialbutton("hatena", {
       button : "standard",
       url : "<%=request.url%>",
       title : "<%=@post.title%>",
     }).width(70);
   })

   $(window).scroll(function () {
     var s = $(this).scrollTop();
     var r = $('.detail_right_wrap').offset().top;
     var l = $('.detail_left').offset().top + $('.detail_left').height();
     var f = l-r-$('.detail_right').height();

     if (0 <= s && s <= r) {
       $('.detail_right').css('position','static');
     } else if (s > r && s < f) {
       $('.detail_right').css('position','fixed');
       $('.detail_right').css('top','0');
     } else if (s > f) {
       $('.detail_right').css('position','absolute');
       $('.detail_right').css('top',f);
     }
   })
 }

/**********************************************
 * Post#new
 **********************************************/
function newFunc() {
    var Form = $('#new_post');
    var FormSubmit = $('#form_submit');
    var Confirm = $('#confirm');
    var ConfirmCancel = $('#confirm_cancel');
    var ConfirmSubmit = $('#confirm_submit');

    Confirm.hide();

    FormSubmit.click(function() {
      Form.hide();

      var form_list = [
        'title',  'body', 'open_date',  'close_date',
        'open_time',  'close_time', 'place',  'charge',
        'promoter', 'url',  'facebook', 'twitter',
        'mail'
      ];
      $.each(form_list, function(i, value) {
          $('#confirm_'+value).text($('#post_'+value).val());
      });

      var category = [
        'イラスト・グラフィック',  '建築・インテリア・空間',  'プロダクト・パッケージ',
        '写真・映像・デジタル', 'ファッション', 'インスタレーション',
        'セミナー・講演会', 'ワークショップ'
      ];
      $('#confirm_category').text(category[$('#post_category_id').val()-1]);

      Confirm.show();
      $('html,body').animate({
        scrollTop: 0
      }, 300);
    })
    ConfirmCancel.click(function() {
      Form.show();
      Confirm.hide();
      $('html,body').animate({
        scrollTop: 0
      }, 300);
    })
    ConfirmSubmit.click(function() {
      var n=0;
      $(this).addClass('disable').text('送信中...');
      $('#new_post').submit();
    })

  function preview(ele, n) {
      if (!ele.files.length) return;  // ファイル未選択

      var file = ele.files[0];
      if (!/^image\/(png|jpg|jpeg|gif)$/.test(file.type)) return;  // typeプロパティでMIMEタイプを参照

      var img = document.createElement('img');
      var fr = new FileReader();
      fr.onload = function() {
          img.src = fr.result;  // 読み込んだ画像データをsrcにセット
          document.getElementById('preview_field'+n).appendChild(img);
          document.getElementById('confirm_field'+n).appendChild(img);
      }
      fr.readAsDataURL(file);  // 画像読み込み
  }

  $(function() {
    $('.timepicker').timepicker({
      'step': 30,
      'timeFormat': 'H:i',
      'minTime': '6:00',
      'maxTime': '23:30',
    });
  });
}
