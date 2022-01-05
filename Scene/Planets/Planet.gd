extends Node2D
class_name Planet
func is_class(value: String): return value == "Planet" or .is_class(value)
func get_class() -> String: return "Planet"

onready var PlanetArea : Area2D = get_node("PlanetShape")

#### ACCESSORS ####

#### BUILT-IN ####



#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
