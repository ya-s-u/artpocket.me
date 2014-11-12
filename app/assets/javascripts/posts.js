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
   $(window).scroll(function () {
     var s = $(this).scrollTop();
     var r = $('.show_right_wrap').offset().top;
     var l = $('.show_left').offset().top + $('.show_left').height();
     var f = l-r-$('.show_right').height();

     if (0 <= s && s <= r) {
       $('.show_right').css('position','static');
     } else if (s > r && s < f) {
       $('.show_right').css('position','fixed');
       $('.show_right').css('top','0');
     } else if (s > f) {
       $('.show_right').css('position','absolute');
       $('.show_right').css('top',f);
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

  var isChecked = false;
  $('#form_check').change(function(){
  	if ($(this).is(':checked')) {
  		isChecked = true;
      FormSubmit.addClass('active');
  	} else {
  		isChecked = false;
      FormSubmit.removeClass('active');
  	}
  });

  FormSubmit.click(function() {
    if(!isChecked) return;

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
    $('#confirm_category').text(category[Math.floor($('#post_category_id').val()/10)]);

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

  $(function() {
    $('.timepicker').timepicker({
      'step': 30,
      'timeFormat': 'H:i',
      'minTime': '6:00',
      'maxTime': '23:30',
    });
  });

  $('#form_radio_charge').hide();

  $('#form_radio_charge_free').click(function(){
    $('#form_radio_charge_free').attr("checked", true );
    $('#form_radio_charge').attr("checked", false );
    $(':input[name="post[charge]"]').val(0);
    $('#form_input_charge').val("");
  });

  $('#form_input_charge').change(function(){
    $('#form_radio_charge').attr("checked", true );
    $('#form_radio_charge_free').attr("checked", false );
    $(':input[name="post[charge]"]').val($(this).val());
  });

}
