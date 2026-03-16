extends Control

func LoadImage():
	var img = load('res://Textures/' + Settings.ImageName + '.png')
	get_parent().get_parent().get_node('AspectCanvas/CanvasHolder/Viewport/Canvas/PreLoad').texture = img

func _on_Save_pressed() -> void:
	Settings.CamBlock = false
	if Settings.ImageName == "":
		print("Error")
		$Error.start()
		$FileName.modulate = Color.red
	else:
		print("Saved")
		var Img = get_parent().get_parent().get_node('AspectCanvas/CanvasHolder/Viewport').get_texture().get_data()
		Img.flip_y()
		Img.resize(512, 480)
		Img.save_png("res://Textures/" + Settings.ImageName + ".png")

func _on_FileName_text_changed(new_text: String) -> void:
	Settings.CamBlock = true
	Settings.ImageName = new_text


func _on_Error_timeout() -> void:
	$FileName.modulate= Color.white


func _on_FileName_text_entered(new_text: String) -> void:
	$FileName.release_focus()
	Settings.CamBlock = false


func _on_Load_pressed() -> void:
	LoadImage()
