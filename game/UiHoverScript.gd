extends CanvasLayer


@export_file("*.tscn") var level_1_scene: String = "res://level_1.tscn"

func _ready():
	_bind_button("PlayButton")
	_bind_button("SettingsButton")
	_bind_button("QuitButton")
	
	
	var play_btn = find_child("PlayButton", true, false)
	if play_btn:
		if not play_btn.pressed.is_connected(_on_play_button_pressed):
			play_btn.pressed.connect(_on_play_button_pressed)

	
	var quit_btn = find_child("QuitButton", true, false)
	if quit_btn:
		if not quit_btn.pressed.is_connected(_on_quit_button_pressed):
			quit_btn.pressed.connect(_on_quit_button_pressed)

func _bind_button(button_name: String):
	var btn = find_child(button_name, true, false)
	if btn:
		var anim = btn.find_child("AnimationPlayer", true, false)
		if anim:
			btn.mouse_entered.connect(func(): 
				if anim.has_animation("hover"):
					anim.play("hover")
			)
			btn.mouse_exited.connect(func(): 
				if anim.has_animation("hover"):
					anim.play_backwards("hover")
			)

func _on_play_button_pressed():
	if FileAccess.file_exists(level_1_scene):
		get_tree().change_scene_to_file(level_1_scene)
	else:
		print("Error: Could not find scene file at path: ", level_1_scene)

func _on_quit_button_pressed():
	get_tree().quit()
