extends Node2D
class_name Planet
func is_class(value: String): return value == "Planet" or .is_class(value)
func get_class() -> String: return "Planet"

export var PlanetGameNamePath : String
var PlanetGameNameScene : PackedScene = null
var SpatialPlanetGameNamesArray : Array = []

onready var PlanetArea : Area2D = get_node("PlanetShape")
onready var PlanetInformations : Node2D = get_node("PlanetInfosContainer")

#### ACCESSORS ####

#### BUILT-IN ####

func _ready() -> void:
	if PlanetGameNamePath != "": PlanetGameNameScene = load(PlanetGameNamePath)
	var __ = PlanetArea.connect("body_entered", self, "_on_body_entered")

#### VIRTUALS ####



#### LOGIC ####

func show_planet_hud():
	PlanetInformations.visible = true
	$AnimationPlayer.play("move_informations")

func create_spatial_planet_game_name() -> void:
	if PlanetGameNameScene != null:
		var spatial_instance = PlanetGameNameScene.instance()
		call_deferred("add_child", spatial_instance)
		SpatialPlanetGameNamesArray.append(spatial_instance)
		destroy_first_spatial_planet_game_name()

func destroy_first_spatial_planet_game_name() -> void:
	if SpatialPlanetGameNamesArray.size() > 1:
			var first_spatial = SpatialPlanetGameNamesArray.front()
			SpatialPlanetGameNamesArray.pop_at(0)
			first_spatial.queue_free()

#### INPUTS ####



#### SIGNAL RESPONSES ####

func _on_body_entered(body: PhysicsBody2D) -> void:
	if is_instance_valid(body) and body.is_class("Player"):
		show_planet_hud()
		create_spatial_planet_game_name()
