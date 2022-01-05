extends Node2D
class_name ScreenTitleMenu

func is_class(value: String): return value == "ScreenTitleMenu" or .is_class(value)
func get_class() -> String: return "ScreenTitleMenu"

onready var game_scene : PackedScene = preload("res://Scene/Game/Game.tscn")
onready var playgame_button : Button = get_node("Play")
onready var exitgame_button : Button = get_node("Exit")

#### ACCESSORS ####

#### BUILT-IN ####

func _ready() -> void:
	if is_instance_valid(playgame_button):
		var __ = playgame_button.connect("button_down", self, "_on_play_button_clicked")
	if is_instance_valid(exitgame_button):
		var __ = exitgame_button.connect("button_down", self, "_on_exit_button_clicked")

#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####

func _on_play_button_clicked() -> void:
	var __ = get_tree().change_scene_to(game_scene)

func _on_exit_button_clicked() -> void:
	if OS.has_feature('JavaScript'):
		JavaScript.eval("window.close()")
	get_tree().quit()
