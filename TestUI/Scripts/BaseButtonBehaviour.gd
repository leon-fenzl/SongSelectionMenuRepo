extends Button
func _on_custom_base_button_mouse_entered():
	custom_minimum_size = Vector2(360.0,100.0)
func _on_custom_base_button_mouse_exited():
	custom_minimum_size = Vector2(30.0,30.0)
