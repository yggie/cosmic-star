function byId(str) {
    return document.getElementById(str);
}
function processPatient(type, term) {
    if (type) {
        $.get("http://cosmic-star.herokuapp.com/submissions.json", {first_name: term}, function(data) {
            console.log(data);
            byId('content').style.display = 'block';
        });
    } else {
        $.get("http://cosmic-star.herokuapp.com/submissions.json", {id: term}, function(data) {
            console.log(data);
            byId('content').style.display = 'block';
        });
    }
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
