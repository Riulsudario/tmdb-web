$(document).ready(function(){
  var $modal = $(".dropdown-content");

  var $btn = $(".notification-container");

  $btn.click(function() {
    $modal.show();
  })


  $(window).click(function(event){
    if(!event.target.matches('img.notification'))
    {
      $modal.hide();
    }
  });

});
