import 'bootstrap/dist/css/bootstrap.min.css';

$(document).ready(function(){
    // Activate Carousel
    $("#d211df9506ff").carousel();
      
    // Enable Carousel Controls
    $(".left").click(function(){
      $("#d211df9506ff").carousel("prev");
    });
    $(".right").click(function(){
      $("#d211df9506ff").carousel("next");
    });
});