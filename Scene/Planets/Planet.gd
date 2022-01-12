extends Node2D
class_name Planet
func is_class(value: String): return value == "Planet" or .is_class(value)
func get_class() -> String: return "Planet"

onready var PlanetArea : Area2D = get_node("PlanetShape")
onready var PlanetInformations : Node2D = get_node("PlanetInfosContainer")

#### ACCESSORS ####

#### BUILT-IN ####

func _ready() -> void:
	var __ = PlanetArea.connect("body_entered", self, "_on_body_entered")

#### VIRTUALS ####



#### LOGIC ####

func show_planet_hud():
	PlanetInformations.visible = true
	$AnimationPlayer.play("move_informations")

#### INPUTS ####



#### SIGNAL RESPONSES ####

func _on_body_entered(body: PhysicsBody2D) -> void:
	print(body)
	if is_instance_valid(body) and body.is_class("Player"):
		show_planet_hud()
