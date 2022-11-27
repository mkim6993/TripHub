document.addEventListener("turbo:load", function () {
    let searchBtn = document.querySelector("#searchBtn");
    searchBtn.addEventListener("click", function (event) {
        event.stopPropagation();
        returnLocations();
    });

    let locationSearch = document.querySelector("#locationSearch");
    locationSearch.addEventListener("click", function (event) {
        event.stopPropagation();
    });

    let searchBar = document.querySelector("#searchLocation");
    let searchResults = document.querySelector("#searchResults");
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
        url: "/search",
        data: { search: searchInput },
        success: function (data) {
            console.log(data);
            console.log("success");
        },
    });
};

const returnLocations = async () => {
    document.getElementById("searchResults").innerHTML = "";
    var htmlString =
        "<div id='noResult'>No results. Create a new location?</div>";
    const locationSearch = document.getElementById("locationSearch").value;
    if (locationSearch == "") {
        alert("no search");
    } else {
        try {
            var locations = await getData(locationSearch);
            console.log("here", locations);
            if (locations.length != 0) {
                htmlString = "";
                for (let i = 0; i < locations.length; i++) {
                    htmlString +=
                        "<div class='locationItem'><div class='locName'>" +
                        locations[i].name +
                        "</div><div class='locDetailAndImage'><div class='locDetails'><div class='detailText'>" +
                        locations[i].address +
                        "</div><div class='detailText'>" +
                        locations[i].contact +
                        "</div></div></div></div>";
                }
            }
            document.getElementById("searchResults").innerHTML += htmlString;
            let searchResults = document.querySelector("#searchResults");
            searchResults.style.maxHeight = searchResults.scrollHeight + "px";
        } catch (err) {
            console.log("there was an error when fetching data", err);
            document.getElementById("searchResults").innerHTML += htmlString;
        }
    }
};
