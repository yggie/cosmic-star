function byId(str) {
    return document.getElementById(str);
}
function processPatient(type, term) {
    byId('content').style.display = 'none';
    if (type) {
        $.ajax({
            url: "http://cosmic-star.herokuapp.com/submissions.json", 
            data: {first_name: term},
            error: function(XMLHttpRequest, textStatus, errorThrown){
                alert('No Patient Found');
            },
            success: function(data){
                console.log(data);
                inputData(data, function() {
                    byId('content').style.display = 'block';
                });
            }
        });
    } else {
        $.ajax({
            url: "http://cosmic-star.herokuapp.com/submissions.json", 
            data: {id: term},
            error: function(XMLHttpRequest, textStatus, errorThrown){
                alert('No Patient Found');
            },
            success: function(data){
                inputData(data, function() {
                    byId('content').style.display = 'block';
                });
            }
        });
    }
}
function inputData(json, callback) {
    byId('data-id').innerHTML = json['patient_id'];
    byId('data-firstname').innerHTML = json['first_name'];
    byId('data-surname').innerHTML = json['surname'];
    byId('data-dob').innerHTML = json['dob'];
    answers = json['submissions'][0]['answers'];
    for(i = 0; i < answers.length; i++) {
        root = answers[i];
        byId('data-' + i).innerHTML = root.answer;
    }
    callback();
}
window.onload = function() {
    parentTab = byId('parent');
    childTab = byId('child');
    parentContent = byId('content-parent');
    childContent = byId('content-child');
    search = byId('search');
    parentTab.onclick = function() {
        if (this.className != 'selected') {
            this.className = 'selected';
            parentContent.className = 'selected';
            childTab.className = '';
            childContent.className = '';
        }
    }
    childTab.onclick = function() {
        if (this.className != 'selected') {
            this.className = 'selected';
            childContent.className = 'selected';
            parentTab.className = '';
            parentContent.className = '';
        }
    }
    search.form.onsubmit = function (e) {
        e.preventDefault();
        processPatient(byId('first-name').checked, search.value);
    }
}
