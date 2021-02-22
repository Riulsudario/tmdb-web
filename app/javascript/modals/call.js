$(document).ready(function(){
  var $modal = $(".modal-container");
  var $modalContainer = document.querySelector(".modal-container");

  var $btn = $("#schedule-movie");
  var $span = $(".close");

  $btn.click(function() {
    $modal.show();
  })

  $span.click(function() {
    $modal.hide();
  });

  $(window).click(function(event){
    if(event.target == $modalContainer)
    {
      $modal.hide();
    }
  });

});
