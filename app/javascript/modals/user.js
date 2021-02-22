$(document).ready(function(){
  var $modal = $(".dropdown");

  var $btn = $(".user-container");

  $btn.click(function() {
    $modal.show();
  })


  $(window).click(function(event){
    if(!event.target.matches('img.user-avatar'))
    {
      $modal.hide();
    }
  });

});
