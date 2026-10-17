extends CanvasLayer

func _ready():
	_bind_button("PlayButton")
	_bind_button("SettingsButton")
	_bind_button("QuitButton")

func _bind_button(button_name: String):
	# Automatically searches the ENTIRE scene tree regardless of containers
	var btn = find_child(button_name, true, false)
	if btn:
		var anim = btn.find_child("AnimationPlayer", true, false)
		if anim:
			btn.mouse_entered.connect(func(): anim.play("hover"))
			btn.mouse_exited.connect(func(): anim.play_backwards("hover"))

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://MainGame.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
