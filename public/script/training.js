document.getElementById("confirmPlan").addEventListener("click", function () {
    const plansJson = JSON.parse(document.getElementById("allPlans").value);
    let tmp = document.getElementById("selectDay").value
    let key = document.querySelectorAll('option[value="' + tmp + '"]')[0].parentElement.label;
    let actualJson = plansJson[key][tmp];
    let index = 0;
    document.getElementById("statsContainer").style.display = "flex";
    document.getElementById("selectContainer").style.display = "none";

    document.getElementById("DayTitle").innerText = tmp;

    let toSave = {
        planName: key,
        dayName: tmp,
        exercises: []
    }
    for (let k = 0; k < actualJson.length; k++) {
        toSave.exercises.push({
            name: actualJson[k].split(";")[0],
            reps: []
        })
        for (let i = 0; i < parseInt(actualJson[k].split(";")[1]); i++) {
            toSave.exercises[k].reps.push(actualJson[k].split(";")[2] + ";" + 100);
        }
    }
    loadExercise(toSave.exercises, index);
    document.getElementById("next").addEventListener("click", function () {
        if (index < toSave.exercises.length - 1) {
            let tmp = [];
            let reps = Array.prototype.slice.call(document.getElementById("reps").getElementsByTagName("input"));
            reps.forEach(element => {
                tmp.push(element.value + ";");
            });
            let p = 0;
            let weight = Array.prototype.slice.call(document.getElementById("weight").getElementsByTagName("input"));
            weight.forEach(element => {
                tmp[p] += element.value;
                p += 1;
            });
            toSave.exercises[index].reps = tmp;

            index += 1;
            loadExercise(toSave.exercises, index);
        }
    })
    document.getElementById("previous").addEventListener("click", function () {
        if (index > 0) {
            let tmp = [];
            let reps = Array.prototype.slice.call(document.getElementById("reps").getElementsByTagName("input"));
            reps.forEach(element => {
                tmp.push(element.value + ";");
            });
            let p = 0;
            let weight = Array.prototype.slice.call(document.getElementById("weight").getElementsByTagName("input"));
            weight.forEach(element => {
                tmp[p] += element.value;
                p += 1;
            });
            toSave.exercises[index].reps = tmp;

            index -= 1;
            loadExercise(toSave.exercises, index);
        }
    })
    document.getElementById("finish").addEventListener("click", function () {
        console.log(toSave)
        fetch("/saveTraining", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                "body": toSave
            })
        })
            .then(function (response) {
                console.log(response.body)
                return response.json();
            }).then(function (result) {
                if (result.body)
                    window.location.replace("/training");
                else
                    alert("ERROR IN CREATING TRAINING SESSION. PLEASE RELOAD")
            });
    })


})

function loadExercise(exercises, index) {
    document.getElementById("exercisename").innerText = exercises[index].name;
    //tu foto
    //document.getElementById("exerciseImage").innerText = tmp;
    document.getElementById("reps").innerHTML = "<h6>Reps done</h6>";
    document.getElementById("weight").innerHTML = "<h6>Weight</h6>";

    for (let i = 0; i < parseInt(exercises[index].reps.length); i++) {
        let sets = document.createElement("input");
        sets.defaultValue = parseInt(exercises[index].reps[i].split(";")[0]);
        sets.type = "number";
        sets.min = 0;

        document.getElementById("reps").appendChild(sets);

        let weight = document.createElement("input");
        weight.defaultValue = parseInt(exercises[index].reps[i].split(";")[1]);
        weight.type = "number";
        weight.min = 0;
        document.getElementById("weight").appendChild(weight);
    }
}