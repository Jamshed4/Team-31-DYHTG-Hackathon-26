extends CanvasLayer

func _ready():
	_bind_button("PlayButton")
	_bind_button("SettingsButton")
	_bind_button("QuitButton")

func _bind_button(button_name: String):
	var btn = find_child(button_name, true, false)
	if btn:
		var anim = btn.find_child("AnimationPlayer", true, false)
		if anim:
			# Safely check if "hover" animation exists before playing
			btn.mouse_entered.connect(func(): 
				if anim.has_animation("hover"):
					anim.play("hover")
			)
			btn.mouse_exited.connect(func(): 
				if anim.has_animation("hover"):
					anim.play_backwards("hover")
			)

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://MainGame.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
