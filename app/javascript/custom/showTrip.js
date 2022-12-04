// show trip js

document.addEventListener("turbo:load", function () {
    var backHome = document.getElementById("backToHome");
    backHome.addEventListener("click", function () {
        window.location.href = "/";
    });
});
