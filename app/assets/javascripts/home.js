$(function() {
  "use strict";

  function toTop() {
  var $cache = $('#wrap');

  if ($(window).scrollTop() > 120) {
    $cache.fadeIn();
    $cache.css('display', 'block');
  } else {
    $cache.fadeOut();
    }
  };

  $(window).scroll(toTop);

  //smoothscroll
  $('#wrap').click(function(event) {
    event.preventDefault();
    $('body').animate({
      scrollTop: '0px'
    });
  });

  // autocomplete
  $("#venue").autocomplete({
    source: venueNames
  });

});