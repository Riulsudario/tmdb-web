$(document).ready(function(){
  var $step = 0;
  var $nextButton = $('#continueResgistration');
  var $previousButton = $('#previousButton');
  var $formContainer = $('#formContainer');
  var $formContainer1 = $('#formContainer1');
  var $formContainer2 = $('#formContainer2');
  var $formContainer3 = $('#formContainer3');
  var $submitButton = $('#registerSubmitButton');

  function showStep($numStep) {
    if ($numStep == 0) {
      $formContainer.show();
      $formContainer1.hide();
      $formContainer2.hide();
      $formContainer3.hide();
      $previousButton.hide();
      $submitButton.hide();
    }
    else if ($numStep == 1){
      $formContainer.hide();
      $formContainer1.show();
      $formContainer2.hide();
      $formContainer3.hide();
      $previousButton.show();
      $nextButton.show();
      $submitButton.hide();
    }
    else if ($numStep == 2){
      $formContainer.hide();
      $formContainer1.hide();
      $formContainer2.show();
      $formContainer3.hide();
      $previousButton.show();
      $nextButton.show();
      $submitButton.hide();
    }

    else if ($numStep == 3){
      $formContainer.hide();
      $formContainer1.hide();
      $formContainer2.hide();
      $formContainer3.show();
      $previousButton.show();
      $nextButton.hide();
      $submitButton.show();
    }
  }

  function next($num){
    $step = $step + $num;

    showStep($step);
  }

  function previous($num){
    $step = $step - $num;

    showStep($step);
  }

  showStep($step);

  $nextButton.click(function() {
    next(1)
  });

  $previousButton.click(function() {
    previous(1)
  });
});
