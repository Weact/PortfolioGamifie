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
	move(delta)

#### LOGIC ####

func move(delta):
	if not moving:
		speed = 0
		if is_instance_valid($Reactors):
			for reactor in $Reactors.get_children():
				reactor.emitting = false
	else:
		speed += acceleration * delta
		if speed > max_speed:
			speed = max_speed
	
	movement = position.direction_to(destination) * speed
	move_direction = rad2deg(destination.angle_to_point(position))
	
	if position.distance_to(destination) > 50:
		movement = move_and_slide(movement)
		if is_instance_valid($Reactors):
			for reactor in $Reactors.get_children():
				if not reactor.emitting:
					reactor.emitting = !reactor.emitting
	else:
		moving = false

#### VIRTUALS ####

#### INPUTS ####

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('move_player'):
		moving = true
		destination = get_global_mouse_position()
		look_at(destination)

#### SIGNAL RESPONSES ####
