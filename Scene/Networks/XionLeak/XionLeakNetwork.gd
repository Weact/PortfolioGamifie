extends NetworkBase
class_name XionLeakNetwork
func is_class(value: String): return value == "XionLeakNetwork" or .is_class(value)
func get_class() -> String: return "XionLeakNetwork"

onready var itcharea : Area2D = get_node("ItchIO/itcharea")
onready var twitterarea : Area2D = get_node("Twitter/twitterarea")

onready var itchioplayer_node : AnimationPlayer = get_node("ItchIOPlayer")
onready var twitterplayer_node : AnimationPlayer = get_node("TwitterPlayer")

#### ACCESSORS ####

#### BUILT-IN ####

func _ready() -> void:
	var __
	__ = itcharea.connect("body_entered", self, "_on_body_entered_itch_area")
	__ = itcharea.connect("body_exited", self, "_on_body_exited_itch_area")
	
	__ = twitterarea.connect("body_entered", self, "_on_body_entered_twitter_area")
	__ = twitterarea.connect("body_exited", self, "_on_body_exited_twitter_area")

#### VIRTUALS ####

#### LOGIC ####

#### INPUTS ####

#### SIGNAL RESPONSES ####

func _on_body_entered_itch_area(body: PhysicsBody2D) -> void:
	if body is Player:
		itchioplayer_node.set_speed_scale(1.0)
		itchioplayer_node.play("itchio_appear")
		should_open_itch = true

func _on_body_exited_itch_area(body: PhysicsBody2D) -> void:
	if body is Player:
		itchioplayer_node.set_speed_scale(3.0)
		itchioplayer_node.play_backwards("itchio_appear")
		should_open_itch = false

func _on_body_entered_twitter_area(body: PhysicsBody2D) -> void:
	if body is Player:
		twitterplayer_node.set_speed_scale(1.0)
		twitterplayer_node.play("twitter_appear")
		should_open_twitter = true

func _on_body_exited_twitter_area(body: PhysicsBody2D) -> void:
	if body is Player:
		twitterplayer_node.set_speed_scale(3.0)
		twitterplayer_node.play_backwards("twitter_appear")
		should_open_twitter= false
