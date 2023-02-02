
function getRow() {
    let div = document.createElement("div");
    div.className = "row";



    let select = document.createElement("select");
    fetch("./public/script/exercises.json")
        .then(response => response.json())
        .then(parsed => parsed.exercises.forEach(exercise => {
            let opt = document.createElement("option");
            opt.innerText = exercise.name;
            select.appendChild(opt);
        }))
        .then(div.appendChild(select));

    let sets = document.createElement("input");
    sets.type = "number";
    sets.name = "sets";
    div.appendChild(sets)

    let reps = document.createElement("input");
    sets.type = "number";
    sets.name = "reps";
    div.appendChild(reps)
    let img = document.createElement("img");
    img.src = "./public/img/delete.webp";
    img.addEventListener("click", function () {
        console.log("xd")
        this.parentElement.remove();
        console.log("xd")
    })
    div.appendChild(img);
    return div;
}

document.getElementById("addDay").addEventListener("click", function () {

    if (document.getElementById("editableSection") == null) {
        let section = document.createElement("section");
        section.id = "editableSection";
        section.innerHTML = '<input type="text" placeholder="Training day title..." name="dayTitle">';
        section.appendChild(getRow());
        section.innerHTML += '<button name="addExercise">+ Add next exercise</button><button id="saveTrainingDay">Save Training Day</button>';
        document.getElementById("trainingContainer").appendChild(section);

    }

})

//document.getElementById("saveTrainingDay").addEventListener("click", function () {



//})