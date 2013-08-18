$(function() {

  function fixDiv() {
  var $cache = $('.fixed-top');

  if ($(window).scrollTop() > 120) {
    $cache.css({'position': 'fixed', 'top': '0'});
    $('.venue-content').css('margin-top','50px');
  } else {
    $cache.css({'position': 'relative', 'top': 'auto'});
    $('.venue-content').css('margin-top','0');
    }
  }

  $(window).scroll(fixDiv);

  function fixTabDiv() {
    var $cache = $('.alternate-fixed-top');

    if ($(window).scrollTop() > 120) {
      $cache.css({'position': 'fixed', 'top': '0'});
      $('.venue-content').css('margin-top','50px');
    } else {
      $cache.css({'position': 'relative', 'top': 'auto'});
      $('.venue-content').css('margin-top','0');
    }
  }

  $(window).scroll(fixTabDiv);

  // display tab modal

  $('.venue-tab').click(function(event){
    event.preventDefault();
    $('.venue-tab').removeClass('tab-opened');
    $('.venue-tab').addClass('tab-closed');
    $('.details').css('display', 'none');
    $('.tags').css('display', 'none');
    $('.weather').css('display', 'none');
    $('.venue-menu ul li').removeClass('highlight');
  });

  $('.venue-menu ul li:nth-child(2)').click(function(event){
    event.preventDefault();
    $('.venue-tab').removeClass('tab-closed');
    $('.venue-tab').addClass('tab-opened');
    $('.details').fadeIn();
    $('.tags').css('display', 'none');
    $('.weather').css('display', 'none');

    $('.venue-menu ul li').removeClass('highlight');
    $(this).addClass('highlight');

  });

  $('.venue-menu ul li:nth-child(3)').click(function(event){
    event.preventDefault();
    $('.venue-tab').removeClass('tab-closed');
    $('.venue-tab').addClass('tab-opened');
    $('.details').css('display', 'none');
    $('.tags').css('display', 'none');
    $('.weather').fadeIn();

    $('.venue-menu ul li').removeClass('highlight');
    $(this).addClass('highlight');

  });

  $('.venue-menu ul li:nth-child(4)').click(function(event){
    event.preventDefault();
    $('.venue-tab').removeClass('tab-closed');
    $('.venue-tab').addClass('tab-opened');
    $('.details').css('display', 'none');
    $('.weather').css('display', 'none');
    $('.tags').fadeIn();

    $('.venue-menu ul li').removeClass('highlight');
    $(this).addClass('highlight');

  });

  // display add modal

  // PREVIOUS JQ
  // change header when .add div is displayed
  // display and remove .add div (user clothing tagging)

  function addItem(select) {
    $('.add').append('<img src="assets/loading.gif" class="loading" />');
    $('.loading').css('display','block');
    $.ajax({
      url: select.attr("href"),
      success: function(data) {
        $('.add').append(data);
        $('.add').append('<div class="more-items"><button>More</button></div>');
        $('.loading').remove();
      }
    })
  }

  // closing the modal
  function close() {
    $('.add').slideUp('fast');
    $('.add').empty();
    $(".alternate-fixed-top").slideUp('fast', function(){
      $(".fixed-top").slideDown('fast');
    });
    $("html, body").animate({ scrollTop: 0 }, 400);
      return false;
  }

  // add tags function

  $(".add-tags").click(function(event){
    event.preventDefault();
    $('.add-tags').fadeOut();
    var select = $(this).children();

    $(".fixed-top").slideUp('fast', function() {

      $(".alternate-fixed-top").slideDown('fast', function() {
        $(".add").slideDown(800);

        addItem(select);
        scroll();

      });

    });
  });

  $('#back-home').click(function(){
    close();
    $('.add-tags').fadeIn();
  });

  $('#confirm').click(function(){
    $('.waiting-add').each(function() {
      var form = $(this).parents('form');
      $.ajax({
        url: form.attr("action"),
        type: form.attr("method"),
        data: form.serialize(),
        success: function(data) {
        }
      });
    })
    alert('Your tags have been submitted.');
    close();
    window.location.reload();
  })

 // more items
  $('body').delegate('.more-items button','click', function(){
    $('.add').append('<img src="assets/loading.gif" class="loading" />');
    $('.loading').css('display','block');
    $('.more-items').remove();

    category = categories[Math.floor(Math.random()*categories.length)];
    var s = $('.add-tags').children().attr("href");
    var newSelect = s.substring(s.indexOf("=")+1,s.indexOf("&"));
    reSelect = s.replace(newSelect, encodeURIComponent(category));

    $.ajax({
      url: reSelect,
      success: function(data) {
        $('.add').append(data);
        $('.add').append('<div class="more-items"><button>More</button></div>');
        $('.loading').remove();
      }
    })
  });


});