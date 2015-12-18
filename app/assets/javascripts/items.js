function coords(e, scale) { // Вставляет в поля текущие координаты при клике
    document.getElementById('field_x').value = (event.clientX - e.x + 0.0) / scale
    document.getElementById('field_y').value = (event.clientY - e.y + 0.0) / scale
}
