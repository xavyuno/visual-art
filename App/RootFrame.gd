extends Node


func _on_BlockColor_color_changed(color: Color) -> void:
	BlockConfig.BlockColor = color


func _on_Clear_pressed() -> void:
	BlockConfig.Clear = true
	get_tree().reload_current_scene()
