
function getRow() {
    let div = document.createElement("div");
    div.className = "row";

    let select = document.createElement("select");
    select.id = "selectExercise"
    div.appendChild(select);

    fetch("./public/script/exercises.json")
        .then(response => response.json())
        .then(parsed => parsed.exercises.forEach(exercise => {
            let opt = document.createElement("option");
            opt.innerText = exercise.name;
            select.appendChild(opt);

        }))

    let sets = document.createElement("input");
    sets.defaultValue = 3;
    sets.type = "number";
    sets.name = "sets";


    let reps = document.createElement("input");
    reps.defaultValue = 3;
    reps.type = "number";
    reps.name = "reps";


    let deleteButton = document.createElement("button");
    deleteButton.value = "Delete exercise"
    deleteButton.innerText = "Delete exercise"
    deleteButton.addEventListener("click", function () {
        this.parentElement.remove();
        console.log("XD")
    })

    div.appendChild(sets)
    div.appendChild(reps)
    div.appendChild(deleteButton);
    return div;
}

document.getElementById("addDay").addEventListener("click", function () {

    if (document.getElementById("editableSection") == null) {
        let section = document.createElement("section");
        section.id = "editableSection";
        section.innerHTML = '<input type="text" placeholder="Training day title..." class="dayTitle">';
        section.appendChild(getRow());

        let nextExercise = document.createElement("button");
        nextExercise.className = "bottomButton"
        nextExercise.value = "Add next exercise"
        nextExercise.innerText = "Add next exercise"
        nextExercise.addEventListener("click", function () {
            this.parentElement.insertBefore(getRow(), this);
        })
        section.appendChild(nextExercise);

        let cancel = document.createElement("button");
        cancel.value = "Cancel"
        cancel.innerText = "Cancel"
        cancel.className = "bottomButton"
        cancel.addEventListener("click", function () {
            document.getElementById("editableSection").remove();
        })
        section.appendChild(cancel);
        let saveDay = document.createElement("button");
        saveDay.className = "bottomButton"
        saveDay.value = "Save training day"
        saveDay.innerText = "Save training day"
        saveDay.addEventListener("click", function () {
            if (this.parentElement.children[0].value != "") {
                var children = Array.prototype.slice.call(this.parentElement.children);
                children.forEach(child => {
                    if (child.className == "dayTitle") {
                        child.readOnly = true;
                    } else if (child.className == "bottomButton") {
                        child.style.display = 'none';
                    }
                    else if (child.className == "row") {
                        child.children[child.children.length - 1].remove();
                        child.children[0].setAttribute('disabled', 'disabled')
                        let img = document.createElement("img");
                        img.src = "./public/img/exercises/" + child.children[0].value;
                        child.insertBefore(img, child.children[0]);
                    }
                })
                console.log(this.parentElement)
                this.parentElement.removeAttribute('id');
                this.parentElement.className = "readyDay";
            } else {
                alert("Fill all inputs first.")
            }

        })
        section.appendChild(saveDay);
        document.getElementById("trainingContainer").appendChild(section);

    }

})

document.getElementById("savePlan").addEventListener("click", function () {
    if (document.getElementById("trainingName").value != "" && document.getElementsByClassName("readyDay").length != 0) {


        let obj = {
            name: document.getElementById("trainingName").value,
            trainingDays: []
        };

        let dayElements = Array.prototype.slice.call(document.getElementsByClassName("readyDay"));
        dayElements.forEach(dayElement => {
            let day = {
                name: dayElement.children[0].value,
                exercises: []
            };
            let rows = Array.prototype.slice.call(dayElement.getElementsByClassName("row"));
            rows.forEach(row => {
                let exercise = {
                    name: row.children[1].value,
                    sets: row.children[2].value,
                    reps: row.children[3].value,
                }
                day.exercises.push(exercise);
            })
            obj.trainingDays.push(day);

        })
        console.log(JSON.stringify({
            "body": obj
        }));


        fetch("/savePlan", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                "body": obj
            })
        })
            .then(function (response) {
                console.log(response.body)
                return response.json();
            }).then(function (result) {
                if (result.body)
                    window.location.replace("/plans");
                else
                    alert("ERROR IN CREATING PLAN. PLEASE RELOAD")
            });
    }
})