extends Node2D
class_name Game
func is_class(value: String): return value == "Game" or .is_class(value)
func get_class() -> String: return "Game"

onready var achievement_label : Label = get_node("Achievements/CanvasLayer/AchievementPanel/AchievementName")
onready var achievement_animationplayer : AnimationPlayer = get_node("Achievements/AnimationPlayer")

#### ACCESSORS ####

#### BUILT-IN ####

func _ready() -> void:
	EVENTS.ach_label = achievement_label
	EVENTS.ach_player = achievement_animationplayer
	EVENTS.ach_anim_name = "display_achievement"

#### VIRTUALS ####

#### LOGIC ####

func unlock_game_achievement(ach_name : String = "") -> void:
	EVENTS.display_achievement(ach_name)

#### INPUTS ####

#### SIGNAL RESPONSES ####
