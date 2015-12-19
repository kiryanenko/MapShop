function coords(event, el, scale) { // Вставляет в поля текущие координаты при клике
    var event = event || window.event;
    document.getElementById('field_x').value = (event.pageX - el.x + 0.0) / scale
    document.getElementById('field_y').value = (event.pageY - el.y + 0.0) / scale
}

function marker(e, x, y) {

}