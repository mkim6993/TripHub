// show trip js

document.addEventListener("turbo:load", function () {
    var backHome = document.getElementById("backToHome");
    if (backHome) {
        backHome.addEventListener("click", function () {
            window.location.href = "/";
        });
    }
});
