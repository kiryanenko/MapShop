function setMarker(x, y) {
    var marker = document.getElementById('marker');
    marker.hidden = false;
    marker.style.left = (x - 12) + 'px';
    marker.style.top  = (y - 24) + 'px';
}