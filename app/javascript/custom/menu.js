// Menu manipulation

// Add toggle listeners to listen for clicks.
document.addEventListener("turbo:load", function () {
    let hamburger = document.querySelector("#hamburger");
    hamburger.addEventListener("click", function (event) {
        event.preventDefault();
        let menu = document.querySelector("#navbar-menu");
        menu.classList.toggle("collapse");
    });

    // let test = document.querySelector("#addNewLoc");
    // test.addEventListener("click", function (event) {
    //     event.preventDefault();
    //     alert("hi");
    // });

    // let account = document.querySelector("#account");
    // account.addEventListener("click", function (event) {
    //     event.preventDefault();
    //     let menu = document.querySelector("#dropdown-menu");
    //     menu.classList.toggle("active");
    // });
});
