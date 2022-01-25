extends Node
class_name NetworkBase
func is_class(value: String): return value == "NetworkBase" or .is_class(value)
func get_class() -> String: return "NetworkBase"

export(String) var itchio_achievement_name = ""
export(String) var twitter_achievement_name = ""
export(String) var global_achievement_name = ""

export var itch_link : String = ""
var should_open_itch : bool = true
export var twitter_link : String = ""
var should_open_twitter : bool = true
export var global_link : String = ""
var should_open_global : bool = true

#### ACCESSORS ####

#### BUILT-IN ####

func _ready() -> void:
	print(get_name())

#### VIRTUALS ####



#### LOGIC ####

func call_website(website_name) -> void:
	match(website_name):
		"itchio":
			if should_open_itch:
				var __ = OS.shell_open(itch_link)
				EVENTS.display_achievement(itchio_achievement_name)
		"twitter":
			if should_open_twitter:
				var __ = OS.shell_open(twitter_link)
				EVENTS.display_achievement(twitter_achievement_name)
		"global":
			if should_open_global:
				var __ = OS.shell_open(global_link)
				EVENTS.display_achievement(global_achievement_name)

#### INPUTS ####



#### SIGNAL RESPONSES ####
