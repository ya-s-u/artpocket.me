$(document).ready(function(){
  var $frame = $('#showLeft');
  var $bar = $('#SlideNav');

  $('#Slidee').css({'margin-left': screen.availWidth*0.1});
  $('#Slidee > li').css({'width': screen.availWidth*0.8});

  $frame.sly({
    horizontal: 1,
    itemNav: 'centered',
    mouseDragging: 1,
    touchDragging: 1,
    releaseSwing: 1,
    scrollBy: 1,
    speed: 100,
    elasticBounds: 1,
    easing: 'easeOutQuint',
    pagesBar: 1,
    pagesBar: $bar,
    pageBuilder:
        function (index) {
            return '<li></li>';
        },
    activatePageOn: 'click',
  })
});
