document.addEventListener("turbo:load", function () {
    // move search bar on search
    var searchBtn = document.querySelector("#searchBtn");
    var tools = document.getElementById("searchTools");
    if (searchBtn) {
        searchBtn.addEventListener("click", function (event) {
            event.stopPropagation();
            tools.style.marginTop = "10px";
            returnLocations();
        });
    }

    // search location on "enter" keypress
    var locationSearch = document.querySelector("#locationSearch");
    if (locationSearch) {
        locationSearch.addEventListener("click", function (event) {
            event.stopPropagation();
        });
        locationSearch.addEventListener("keypress", function (event) {
            if (event.key === "Enter") {
                event.preventDefault();
                document.getElementById("searchBtn").click();
            }
        });
    }

    // open create new location window
    var showCreateLocation = document.getElementById("showCreateLocation");
    if (showCreateLocation) {
        showCreateLocation.addEventListener("click", function (event) {
            document.getElementById("customLocationCard").style.display =
                "flex";
            document.getElementById("shade").style.display = "block";
        });
    }

    // close create new location window
    var closeCreateLocationWindow = document.getElementById("xiconContainer");
    if (closeCreateLocationWindow) {
        closeCreateLocationWindow.addEventListener("click", function (event) {
            document.getElementById("customLocationCard").style.display =
                "none";
            document.getElementById("shade").style.display = "none";
        });
    }
});

// returns all db objects from search
const getData = (searchInput) => {
    return $.ajax({
        type: "GET",
        dataType: "json",
        url: "/search",
        data: { search: searchInput },
        success: function (data) {},
    });
};

// returns number of instances the location was used in other trips
const getInstances = (locationId) => {
    return $.ajax({
        type: "GET",
        dataType: "json",
        url: "/triplocation_instances",
        data: { location_id: locationId },
        success: function (data) {
            console.log("found", data);
        },
    });
};

// add selected location to Trip
const addSearchLocationToTrip = (locationId) => {
    var tripId = document.getElementById("containingTripId").innerHTML;
    var startTime = document.getElementById("start" + locationId).value;
    var endTime = document.getElementById("end" + locationId).value;
    $.ajax({
        type: "POST",
        url: "/add_search_location",
        data: {
            location_id: locationId,
            trip_id: tripId,
            start_time: startTime,
            end_time: endTime,
        },
    });
};

// returns results from a location search
const returnLocations = async () => {
    document.getElementById("searchResults").innerHTML = "";
    var htmlString =
        "<div id='noResult'>No results. Create a new location?</div>";
    const locationSearch = document.getElementById("locationSearch").value;
    if (locationSearch == "") {
    } else {
        try {
            var locations = await getData(locationSearch);
            var locationIdArr = [];
            if (locations.length != 0) {
                htmlString = "";
                for (let i = 0; i < locations.length; i++) {
                    var locId = locations[i].id;
                    locationIdArr.push(locId);
                    var locationInstance = await getInstances(locId);
                    //can add number of results
                    htmlString =
                        "<div class='locationItem'><div class='locName'><div>" +
                        locations[i].name +
                        "</div><div class='foundIn'>Found in " +
                        locationInstance +
                        " other trips</div></div><div class='locDetailAndImage'><div class='locDetails'><div class='detailText'><strong>Address: </strong>" +
                        locations[i].address +
                        "</div><div class='detailText'><strong>Contact: </strong>" +
                        locations[i].contact +
                        "</div></div><div class='locDetails'><strong>Description: </strong>" +
                        locations[i].description +
                        "</div><div class='locDetails'><div><strong>Start Time</strong><input type='time' id='start" +
                        locId +
                        "'></div><div><strong>End Time</strong><input type='time' id='end" +
                        locId +
                        "'></div></div></div><div class='addLocationBtnContainer'><button class='addLocationBtn' id='code" +
                        locId +
                        "'>Add this location</button></div></div>";
                    document.getElementById("searchResults").innerHTML +=
                        htmlString;
                }
                for (let i = 0; i < locationIdArr.length; i++) {
                    var addSearchedLocation = document.getElementById(
                        "code" + locationIdArr[i]
                    );
                    addSearchedLocation.addEventListener("click", function () {
                        addSearchLocationToTrip(locationIdArr[i]);
                    });
                }
            } else {
                document.getElementById("searchResults").innerHTML = htmlString;
            }
            var searchResults = document.querySelector("#searchResults");
            searchResults.style.maxHeight = searchResults.scrollHeight + "px";
        } catch (err) {
            console.log("there was an error when fetching data", err);
            document.getElementById("searchResults").innerHTML += htmlString;
        }
    }
};
