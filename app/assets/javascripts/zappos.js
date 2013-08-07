$(document).ready(function(){
var container  = $('.add');

alert('ok');
  $.ajax({
        dataType: "jsonp",
        type: "GET",
        url: 'http://api.zappos.com/Search?term=boots&filters={"productRating":"5"}&sort={"productPopularity":"desc"}&callback=wrapper&key=27b076f861701c2532e22f21b7b455c545afde4c',
        data: data,
        success: function(response) {
            container.append(data);
          },
        error: function(error) {
           alert('error');
       }
      }
    );
}