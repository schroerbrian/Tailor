$(document).ready(function() {

  $('input[type="submit"]').click(function(event){
    event.preventDefault();
    $(this).addClass( "waiting-add" );
    $(this).css('background','black');
  })

  $("a img").error(function(){
      $(this).parent().parent().parent().hide();
  })

});