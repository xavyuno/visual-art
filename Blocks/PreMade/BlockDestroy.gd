extends Area2D

func _on_BlockDestroy_body_entered(body: Node) -> void:
	if "Block" in body.name and body:
		if body.name != get_parent().name:
			body.queue_free()

func _physics_process(delta: float) -> void:
	if BlockConfig.Clear == true:
		get_parent().queue_free()
