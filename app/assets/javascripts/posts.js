$(function() {
  var Form = $('#new_post');
  var FormSubmit = $('#form_submit');
  var Confirm = $('#confirm');
  var ConfirmCancel = $('#confirm_cancel');
  var ConfirmSubmit = $('#confirm_submit');

  Confirm.hide();

  FormSubmit.click(function() {
    Form.hide();
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
    }
    fr.readAsDataURL(file);  // 画像読み込み
}


customOptions = {
  daysSimple: ["日" , "月" , "火" , "水" , "木" , "金" , "土"],
  monthsFull: ["1月" , "2月" , "3月" , "4月" , "5月" , "6月" , "7月" , "8月" , "9月" , "10月" , "11月" , "12月"],
    labels: {
       today: "Tod",
       gotoDateInput: "Insert your date",
       gotoDateButton: "Set",
       clearButton: "Wipe"
    },
  modules: {
      header: true,
      footer: false,
      daysOfTheWeek: true,
      navBar: true,
      today: false,
      gotoDate: false,
      icon: false,
      clear: false
  }
}

$(function() {
  $('.timepicker').timepicker({
    'step': 30,
    'timeFormat': 'H:i',
    'minTime': '6:00',
    'maxTime': '23:30',
  });
});
