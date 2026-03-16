extends Camera2D

func Zoom():
	var ZOOM = Vector2(Settings.ZoomSnap, Settings.ZoomSnap)
	if Input.is_action_pressed('ZoomIn') and Settings.CamBlock == false and zoom > Vector2(0.1,0.1):
		zoom -= ZOOM
	if Input.is_action_pressed('ZoomOut') and Settings.CamBlock == false and zoom < Vector2(5,5):
		zoom += ZOOM

func move():
	if Input.is_action_pressed('Left') and Settings.CamBlock == false:
		position.x -= Settings.CamSpeed
	if Input.is_action_pressed('Right') and Settings.CamBlock == false:
		position.x += Settings.CamSpeed

	if Input.is_action_pressed('Up') and Settings.CamBlock == false:
		position.y -= Settings.CamSpeed
	if Input.is_action_pressed('Down') and Settings.CamBlock == false:
		position.y += Settings.CamSpeed

func _physics_process(delta: float) -> void:
	move()
	Zoom()
