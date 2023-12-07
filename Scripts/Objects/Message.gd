extends Popup

func show_popup():
	popup_centered()
	
func set_popup_text(text: String):
	var label = get_node("Label")
	label.text = text

func _on_label_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		hide()
		get_tree().reload_current_scene()
