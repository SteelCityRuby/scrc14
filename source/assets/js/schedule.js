$(document).ready(function() {
  var offset = $('#schedule').scrollTop() + 500;
  var duration = 500;
  
  $(window).scroll(function() {
    if ($(this).scrollTop() > offset) {
      $('.scroll-to-top').fadeIn(duration);
    } else {
      $('.scroll-to-top').fadeOut(duration);
    }
  });

  $('.scroll-to-top').click( function(e) {
    $("html, body").animate({scrollTop: 0 }, 'slow');
    return false;
  });

});