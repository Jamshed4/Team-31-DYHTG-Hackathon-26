extends CharacterBody2D

# Physics parameters - tweak these in the Inspector to fine-tune the feel
@export var forward_speed: float = 300.0      # Constant movement to the right
@export var gravity: float = 1200.0            # Snappier fall speed
@export var jetpack_force: float = 2800.0      # Upward thrust acceleration
@export var instant_impulse: float = -300.0    # Immediate upward kick when Space is tapped
@export var max_fall_speed: float = 600.0      # Max downward speed
@export var max_rise_speed: float = -450.0     # Max upward speed

func _physics_process(delta: float) -> void:
	# 1. Constant horizontal movement to the right
	velocity.x = forward_speed

	# 2. Check input actions
	var just_pressed = Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)
	var is_holding = Input.is_action_pressed("ui_accept") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)

	# 3. Instant Snappy Response on initial button press (cancels downward momentum immediately)
	if just_pressed:
		velocity.y = min(velocity.y, instant_impulse)

	# 4. Continuous Jetpack Thrust vs. Gravity
	if is_holding:
		velocity.y -= jetpack_force * delta
	else:
		velocity.y += gravity * delta

	# 5. Clamp vertical velocity so player stays controllable
	velocity.y = clamp(velocity.y, max_rise_speed, max_fall_speed)

	# 6. Apply movement and slide against floor/ceiling collisions
	move_and_slide()
