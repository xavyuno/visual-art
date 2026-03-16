extends Area2D

func Draw():
	BlockConfig.Clear = false
	var Block = preload("res://Blocks/PreMade/Block.tscn").instance()
	if BlockConfig.FreeDraw == false:
		Block.global_position = get_global_mouse_position().snapped(Vector2(BlockConfig.Snap * BlockConfig.Size, BlockConfig.Snap * BlockConfig.Size))
	else:
		Block.global_position = get_global_mouse_position()
	Block.scale = Vector2(BlockConfig.Size, BlockConfig.Size)
	Block.get_node('Icon').modulate = BlockConfig.BlockColor
	Block.get_node('Icon').frame = BlockConfig.ShapeIndex
	get_parent().add_child(Block)

func _physics_process(delta: float) -> void:
	scale = Vector2(BlockConfig.Size, BlockConfig.Size)
	if BlockConfig.FreeDraw == false:
		global_position = get_global_mouse_position().snapped(Vector2(BlockConfig.Snap * BlockConfig.Size, BlockConfig.Snap * BlockConfig.Size))
	else:
		global_position = get_global_mouse_position()

	if Input.is_action_pressed("Draw") and not Input.is_action_pressed('Delete') and DrawSettings.OnePlace == false and BlockConfig.Build == true:
		Draw()

	if Input.is_action_just_pressed("Draw") and not Input.is_action_pressed('Delete') and DrawSettings.OnePlace == true and BlockConfig.Build == true:
		Draw()

func _on_DrawManager_body_entered(body: Node) -> void:
	if "Block" in body.name and Input.is_action_pressed('Delete'):
		body.queue_free()
