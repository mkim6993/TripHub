document.addEventListener("turbo:load", function () {
    let searchBtn = document.querySelector("#userSearchPopUp");
    searchBtn.addEventListener("click", function (event) {
        event.stopPropagation();
        showSearch();
    });
});

const showSearch = async () => {
    var userSearch = document.getElementById("userSearch")
    userSearch.innerHTML = "";
    var htmlString =
        "<div id='noResult'>No results.</div>";
    userSearch.innerHTML += htmlString;
    userSearch.style.display = 'block';
};
