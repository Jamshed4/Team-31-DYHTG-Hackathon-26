extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	# Check if the colliding object is the player
	if body is CharacterBody2D:
		# Reload the active scene from scratch
		get_tree().reload_current_scene()
