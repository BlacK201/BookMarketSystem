
function search() {
    window.location.replace("./index.aspx?searchkey=" + document.getElementById("searchkey").value);
}

function onKeyPress(e) {
    var keyCode = null;
    if (e.which)
        keyCode = e.which;
    else if (e.keyCode)
        keyCode = e.keyCode;
    if (keyCode == 13) {
        search();
        return false;
    }
    return true;
}
