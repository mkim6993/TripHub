document.addEventListener("turbo:load", function () {
    var searchBtn = document.querySelector("#searchBtn");
    var tools = document.getElementById("searchTools");
    searchBtn.addEventListener("click", function (event) {
        event.stopPropagation();
        tools.style.marginTop = "10px";
        returnLocations();
    });

    var locationSearch = document.querySelector("#locationSearch");
    locationSearch.addEventListener("click", function (event) {
        event.stopPropagation();
    });
    locationSearch.addEventListener("keypress", function (event) {
        if (event.key === "Enter") {
            event.preventDefault();
            document.getElementById("searchBtn").click();
        }
    });

    var showCreateLocation = document.getElementById("showCreateLocation");
    showCreateLocation.addEventListener("click", function (event) {
        document.getElementById("customLocationCard").style.display = "flex";
        document.getElementById("shade").style.display = "block";
    });

    var closeCreateLocationWindow = document.getElementById("xiconContainer");
    closeCreateLocationWindow.addEventListener("click", function (event) {
        document.getElementById("customLocationCard").style.display = "none";
        document.getElementById("shade").style.display = "none";
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
                        "</div><div class='locDetailAndImage'><div class='locDetails'><div class='detailText'><strong>Address: </strong>" +
                        locations[i].address +
                        "</div><div class='detailText'><strong>Contact: </strong>" +
                        locations[i].contact +
                        "</div></div><div class='locDetails'><strong>Description: </strong>" +
                        locations[i].description +
                        "</div></div><div class='addLocationBtnContainer'><button class='addLocationBtn'>Add this location</button></div></div>";
                }
            }
            document.getElementById("searchResults").innerHTML += htmlString;
            var searchResults = document.querySelector("#searchResults");
            searchResults.style.maxHeight = searchResults.scrollHeight + "px";
        } catch (err) {
            console.log("there was an error when fetching data", err);
            document.getElementById("searchResults").innerHTML += htmlString;
        }
    }
};
