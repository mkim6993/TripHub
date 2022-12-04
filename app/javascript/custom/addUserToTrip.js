document.addEventListener("turbo:load", function () {
    let popBtn = document.querySelector("#popUp");
    if (popBtn) {
        popBtn.addEventListener("click", function (event) {
            event.stopPropagation();
            popup();
        });
    }

    let searchBtn = document.querySelector("#showUsers");
    if (searchBtn) {
        searchBtn.addEventListener("click", function (event) {
            event.stopPropagation();
            showSearch();
        });
    }

    let userSearch = document.querySelector("#userSearch");
    if (userSearch) {
        userSearch.addEventListener("click", function (event) {
            event.stopPropagation();
        });
    }

    let searchBar = document.querySelector("#searchUser");
    let searchResults = document.querySelector("#userResults");
    if (searchBar) {
        searchBar.addEventListener("click", function (event) {
            event.preventDefault();
            if (searchResults.style.maxHeight) {
                searchResults.style.maxHeight = null;
            } else {
                searchResults.style.maxHeight =
                    searchResults.scrollHeight + "px";
            }
        });
    }

    var closeInvite = document.getElementById("closeInvite");
    closeInvite.addEventListener("click", function () {
        document.getElementById("screen").style.display = "none";
        searchBar.style.display = "none";
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
    $("#screen").css({
        display: "block",
    });
    $("#searchUser").css({
        display: "block",
    });
};

const showSearch = async () => {
    document.getElementById("userResults").innerHTML = "";
    var htmlString = "<div>User Not Found</div>";
    const userSearch = document.getElementById("userSearch").value;
    if (userSearch == "") {
    } else {
        try {
            var users = await getData(userSearch);
            console.log("here", users);
            if (users.length != 0) {
                htmlString = "";
                for (let i = 0; i < users.length; i++) {
                    htmlString +=
                        '<div class="searchedUserContainer"><div class="searchedUserInfo">' +
                        '<div style="font-size: 15px">@' +
                        users[i].username +
                        "</div>" +
                        '<div style="color: gray">' +
                        users[i].email +
                        "</div>" +
                        "</div><div>Invite</div></div>";
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
