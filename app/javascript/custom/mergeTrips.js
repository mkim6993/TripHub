document.addEventListener("turbo:load", function () {
    let popBtn = document.querySelector("#merge");
    if (popBtn) {
        popBtn.addEventListener("click", function (event) {
            event.stopPropagation();
            popup();
        });
    }

    let merged_display = document.getElementsByClassName("mergeButton");
    if (merged_display.length > 0) {
        for (let i = 0; i < merged_display.length; i++) {
            merged_display[i].addEventListener("click", function (event) {
                event.stopPropagation();
                disp_merged();
            });
        }
    }

    let submit_merge = document.getElementById("submit_merge");
    if (submit_merge) {
        submit_merge.addEventListener("click", function (event) {
            event.stopPropagation();
            finalize_trip(merged_trip);
        });
    }

    let cancel_merge = document.getElementById("cancel_merge");
    if (cancel_merge) {
        cancel_merge.addEventListener("click", function (event) {
            event.stopPropagation();
            exit_merge();
        });
    }

    const element = document.getElementById("display_merged");
    if (element) {
        element.addEventListener("click", () => {
            disp_merged();
        });
    }
});

const popup = async () => {
    $("#mergeScreen").css({
        opacity: 0.7,
        width: $(document).width(),
        height: $(document).height(),
    });

    var userSearch = document.getElementById("mergeWindow");
    userSearch.style.display = "block";
};

const exit_merge = async () => {
    $("#mergeScreen").css({ opacity: 0, width: 0, height: 0 });

    var userSearch = document.getElementById("mergeWindow");
    userSearch.style.display = "none";
};

const finalize_trip = (loc_array) => {
    var t_id = document.getElementById("trip_id").innerHTML;
    console.log(loc_array);
    $.ajax({
        type: "POST",
        url: "/finalize_trip",
        data: {
            location_array: loc_array,
            trip_id: t_id,
            num_locations: loc_array.length,
        },
    });
};

const disp_merged = async () => {
    console.log("complete");
    var display_trip = "";
    var total_start_minutes = 0;
    var total_end_minutes = 0;
    var l1hours = 0;
    var l1minutes = 0;

    for (let x = 0; x < merged_trip.length; x++) {
        [l1hours, l1minutes] = merged_trip[x][1].split(":");
        total_start_minutes = parseInt(l1hours) * 60 + parseInt(l1minutes);

        display_trip +=
            '<div class="spacer" style="height: ' +
            (
                ((total_start_minutes - total_end_minutes) / 1440.0) *
                125
            ).toString() +
            'vh;"></div>';

        [l1hours, l1minutes] = merged_trip[x][2].split(":");
        total_end_minutes = parseInt(l1hours) * 60 + parseInt(l1minutes);

        display_trip +=
            '<div class="locTime" style="height: ' +
            (
                ((total_end_minutes - total_start_minutes) / 1440.0) *
                125
            ).toString() +
            'vh;">';
        display_trip += '<div class="locName">';
        display_trip += merged_trip[x][3];
        display_trip += "</div>";
        display_trip +=
            '<button class="mergeButton" onclick="remove_location_from_trip(' +
            x.toString() +
            ')">Remove Location</button>';
        display_trip += "</div>";
    }

    document.getElementById("display_merged").innerHTML = display_trip;
};
