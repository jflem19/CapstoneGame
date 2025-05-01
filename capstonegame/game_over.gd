extends CanvasLayer


# Called when the node enters the scene tree for the first time.


func _on_button_button_down() -> void:
	get_tree().reload_current_scene()
func gameover(message):
	$Label.text = message
	show()
