extends ViewportContainer

func _on_CanvasHolder_mouse_entered() -> void:
	BlockConfig.Build = true


func _on_CanvasHolder_mouse_exited() -> void:
	BlockConfig.Build = false
