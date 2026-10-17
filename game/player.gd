extends CharacterBody2D

var run_speed = 300.0
var gravity = 2000.0

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.x = run_speed
	move_and_slide()
