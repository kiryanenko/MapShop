function coords(event, el, scale) { // Вставляет в поля текущие координаты при клике
    var event = event || window.event;
    var x = event.pageX - el.x
    var y = event.pageY - el.y
    setMarker(x, y);
    document.getElementById('field_x').value = (x + 0.0) / scale;
    document.getElementById('field_y').value = (y + 0.0) / scale;
}

function setMarker(x, y) {
    var marker = document.getElementById('marker');
    if (x != undefined) marker.style.left = (x - 12) + 'px';
    if (y != undefined) marker.style.top  = (y - 24) + 'px';
}