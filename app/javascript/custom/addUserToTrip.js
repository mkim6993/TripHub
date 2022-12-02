document.addEventListener("turbo:load", function () {
    let popBtn = document.querySelector("#popUp");
    popBtn.addEventListener("click", function (event) {
        event.stopPropagation();
        popup();
    });
    
    let searchBtn = document.querySelector("#showUsers");
    searchBtn.addEventListener("click", function (event) {
        event.stopPropagation();
        showSearch();
    });

    let userSearch = document.querySelector("#userSearch");
    userSearch.addEventListener("click", function (event) {
        event.stopPropagation();
    });

    let searchBar = document.querySelector("#searchUser");
    let searchResults = document.querySelector("#userResults");
    searchBar.addEventListener("click", function (event) {
        event.preventDefault();
        if (searchResults.style.maxHeight) {
            searchResults.style.maxHeight = null;
        } else {
            searchResults.style.maxHeight = searchResults.scrollHeight + "px";
        }
    });
});

const getData = (searchInput) => {
    return $.ajax({
        type: "GET",
        dataType: "json",
        url: "/search_user",
        data: { search: searchInput },
        success: function (data) {
            console.log(data);
            console.log("success");
        },
    });
};

const popup = async () => {
    $('#screen').css({ opacity: 0.7, 'width':$(document).width(),'height':$(document).height()});

    var userSearch = document.getElementById("searchUser")
    userSearch.style.display = 'block';
}

const showSearch = async () => {

    document.getElementById("userResults").innerHTML = "";
    var htmlString =
        "<div id='noResult'>No results. Create a new location?</div>";
    const userSearch = document.getElementById("userSearch").value;
    if (userSearch == "") {
        alert("no search");
    } else {
        try {
            var users = await getData(userSearch);
            console.log("here", users);
            if (users.length != 0) {
                htmlString = "";
                for (let i = 0; i < users.length; i++) {
                    htmlString +=
                        "<div class='userItem'><div class='usrName'>" +
                        users[i].name +
                        "</div><div class='usrDetailAndImage'><div class='usrDetails'><div class='detailText'>" +
                        users[i].username +
                        "</div><div class='detailText'>" +
                        users[i].email +
                        "</div></div></div></div>";
                }
            }
            document.getElementById("userResults").innerHTML += htmlString;
            let userResults = document.querySelector("#userResults");
            userResults.style.maxHeight = userResults.scrollHeight + "px";
        } catch (err) {
            console.log("there was an error when fetching data", err);
            document.getElementById("searchResults").innerHTML += htmlString;
        }
    }
};