extends Node2D
class_name Planet
func is_class(value: String): return value == "Planet" or .is_class(value)
func get_class() -> String: return "Planet"

export var PlanetGameNamePath : String
var PlanetGameNameScene : PackedScene = null
var SpatialPlanetGameNamesArray : Array = []

export var PlanetGameDescriptionPath : String
var PlanetGameDescriptionScene : PackedScene = null
var SpatialPlanetGameDescriptionArray : Array = []

onready var PlanetArea : Area2D = get_node("PlanetShape")
onready var PlanetInformations : Node2D = get_node("PlanetInfosContainer")

#### ACCESSORS ####

#### BUILT-IN ####

func _ready() -> void:
	if PlanetGameNamePath != "": PlanetGameNameScene = load(PlanetGameNamePath)
	if PlanetGameDescriptionPath != "": PlanetGameDescriptionScene = load(PlanetGameDescriptionPath)
	
	var __ = PlanetArea.connect("body_entered", self, "_on_body_entered")

#### VIRTUALS ####



#### LOGIC ####

func show_planet_hud():
	PlanetInformations.visible = true
	$AnimationPlayer.play("move_informations")

func create_spatial_planet_game_name() -> void:
	if PlanetGameNameScene != null:
		var spatial_instance = PlanetGameNameScene.instance()
		get_parent().call_deferred("add_child", spatial_instance)
		spatial_instance.set_position(self.get_position())
		SpatialPlanetGameNamesArray.append(spatial_instance)
		destroy_first_spatial_planet_game_name()

func destroy_first_spatial_planet_game_name() -> void:
	if SpatialPlanetGameNamesArray.size() > 1:
			var first_spatial = SpatialPlanetGameNamesArray.front()
			SpatialPlanetGameNamesArray.pop_at(0)
			first_spatial.queue_free()

func create_spatial_game_description() -> void:
	if PlanetGameDescriptionScene != null:
		var spatial_description_instance = PlanetGameDescriptionScene.instance()
		get_parent().call_deferred("add_child", spatial_description_instance)
		spatial_description_instance.set_position(self.get_position())
		SpatialPlanetGameDescriptionArray.append(spatial_description_instance)
		destroy_first_spatial_planet_game_description()

func destroy_first_spatial_planet_game_description() -> void:
	if SpatialPlanetGameDescriptionArray.size() > 1:
		var first_description_spatial = SpatialPlanetGameDescriptionArray.front()
		SpatialPlanetGameDescriptionArray.pop_at(0)
		first_description_spatial.queue_free()

#### INPUTS ####



#### SIGNAL RESPONSES ####

func _on_body_entered(body: PhysicsBody2D) -> void:
	if is_instance_valid(body) and body.is_class("Player"):
#		show_planet_hud()
		create_spatial_planet_game_name()
		create_spatial_game_description()
