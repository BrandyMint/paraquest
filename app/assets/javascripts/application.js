// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
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


// ругой ример https://codepen.io/tamm/pen/LIFam

document.addEventListener("turbolinks:load", function() {
  $('[data-game="image"]').on("click", function(event) {
    console.log('click');
    var x = event.pageX - this.offsetLeft;
    var y = event.pageY - this.offsetTop;
    alert("X Coordinate: " + x + " Y Coordinate: " + y);
    $('[data-game="form"] input#game_coordinate_x').val(x);
    $('[data-game="form"] input#game_coordinate_y').val(y);
    $('[data-game="form"]').submit()
  });
});
