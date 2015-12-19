function setMarkerHall(x, y) {
    var marker = document.getElementById('marker');
    marker.style.display = 'block';
    marker.style.left = (x - 12) + 'px';
    marker.style.top  = (y - 24) + 'px';
}

function mouseOver(el) {
    el.style.backgroundColor = "cornsilk";
}
function mouseOut(el) {
    el.style.backgroundColor = "white";
}