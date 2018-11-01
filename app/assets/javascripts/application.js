//= require jquery3
//= require rails-ujs
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
//= require nprogress
//= require nprogress-turbolinks
//= require nprogress-ajax
//= require flash
//= require_tree .

window.onload = function () {
  image = document.querySelector('[data-slide="image"]');
  var resize = function() {
      $wrapper = $('[data-slideWrapper]');
      $wrapper.width($(image).width());
  };

  if (image) {
    if (image.complete) {
      resize();
    } else {
      image.onload = resize;
    }
  }
};

// Другой ример https://codepen.io/tamm/pen/LIFam
$( document ).ready( function() {
  $wrapper = $('[data-slideWrapper]');

  $wrapper.on("click", function(event) {
    var x = event.pageX - this.offsetLeft;
    var y = event.pageY - this.offsetTop;

    var $image = $('[data-game="image"]');
    var width = $image.width();
    var height = $image.height();

    console.log("Click X Coordinate: " + x + " Y Coordinate: " + y + ", image width: " + width + ", image height: " + height);

    $form = $('[data-game="form"]');

    $form.find('input#game_current_slide_width').val(width);
    $form.find('input#game_current_slide_height').val(height);

    $form.find('input#game_click_top').val(y);
    $form.find('input#game_click_left').val(x);

    $('[data-game="form"]').submit();
  });
});

document.addEventListener("turbolinks:load", function() {
});
