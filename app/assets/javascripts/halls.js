function setMarkerHall(x, y) {
    var marker = document.getElementById('marker');
    marker.style.display = 'block';
    marker.style.left = (x - 12) + 'px';
    marker.style.top  = (y - 24) + 'px';
}

function mouseOver(el, x, y) {
    setMarkerHall(x, y);
    el.style.backgroundColor = "cornsilk";
}
function mouseOut(el) {
    el.style.backgroundColor = "white";
}