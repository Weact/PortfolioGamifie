extends KinematicBody2D
class_name Player
func is_class(value: String):return value == "Player" or .is_class(value)
func get_class() -> String:return "Player"

export var max_speed = 400
export var speed = 0
export var acceleration = 1200
var move_direction
var moving = false
var destination = Vector2.ZERO
var movement = Vector2.ZERO

#### ACCESSORS ####

#### BUILT-IN ####
func _physics_process(delta: float) -> void:
	movements_handler(delta)
	move(delta)

#### LOGIC ####

func movements_handler(delta) -> void:
	if moving:
		destination = get_global_mouse_position()
		look_at(destination)
		reactors(true)
		
		speed += acceleration * delta
		if speed > max_speed: speed = max_speed
	else:
		speed = 0
		reactors(false)

func move(_delta) -> void:
	movement = position.direction_to(destination) * speed
	move_direction = rad2deg(destination.angle_to_point(position))
	
	if position.distance_to(destination) > 2:
		movement = move_and_slide(movement)
	else:
		moving = false

func reactors(activated: bool) -> void:
	if is_instance_valid($Reactors):
			for reactor in $Reactors.get_children():
				reactor.emitting = activated

func reset_position() -> void:
	$AnimationPlayer.get_animation("reset").track_set_key_value(0, 0, get_position())
	$AnimationPlayer.get_animation("reset").track_set_key_value(0, 1, Vector2(0,0))
	$AnimationPlayer.play("reset")
	
	look_at(Vector2(0,0))

#### VIRTUALS ####

#### INPUTS ####

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('move_player'):
		moving = true
	elif event.is_action_released('move_player'):
		moving = false
	elif event.is_action_pressed('reset'):
		reset_position()

#### SIGNAL RESPONSES ####
