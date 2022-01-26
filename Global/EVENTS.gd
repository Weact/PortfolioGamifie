extends Node
func is_class(value: String): return value == "EVENTS" or .is_class(value)
func get_class() -> String: return "EVENTS"

#### VARS ####

var ach_label : Label = null
var ach_player : AnimationPlayer = null
var ach_anim_name : String = ""

var achievements : Dictionary = {
	#XION LEAK
	"achievement_xionleak": {
		"name":"ACHIEVEMENT UNLOCKED:\nDISCOVER XION LEAK",
		"unlocked":false
	},
	"achievement_xionleak_twitter": {
		"name":"ACHIEVEMENT UNLOCKED:\nVISIT XION LEAK'S TWITTER",
		"unlocked":false
	},
	
	#NO HEAD
	"achievement_nohead": {
		"name":"ACHIEVEMENT UNLOCKED:\nDISCOVER NO HEAD",
		"unlocked":false
	},
	"achievement_nohead_itchio":{
		"name":"ACHIEVEMENT UNLOCKED:\nVISIT NOHEAD'S ITCH.IO",
		"unlocked":false
	},
	
	#COLOR SMASHER
	"achievement_colorsmasher": {
		"name":"ACHIEVEMENT UNLOCKED:\nDISCOVER COLOR SMASHER",
		"unlocked":false
	},
	"achievement_colorsmasher_itchio": {
		"name":"ACHIEVEMENT UNLOCKED:\nVISIT COLOR SMASHER'S ITCH.IO",
		"unlocked":false
	},
	
	#DEVELOPER
	"achievement_developer": {
		"name":"ACHIEVEMENT UNLOCKED:\nLEARN MORE ABOUT THE DEVELOPER",
		"unlocked":false
	},
	"achievement_developer_twitter": {
		"name":"ACHIEVEMENT UNLOCKED:\nVISIT DEVELOPER'S TWITTER",
		"unlocked":false
	},
	"achievement_developer_itchio": {
		"name":"ACHIEVEMENT UNLOCKED:\nVISIT DEVELOPER'S ITCH.IO",
		"unlocked":false
	},
	
	#HAUNTED DREAM
	"achievement_haunteddream": {
		"name":"ACHIEVEMENT UNLOCKED:\nDISCOVER HAUNTED DREAM",
		"unlocked":false
	},
	"achievement_haunteddream_itchio": {
		"name":"ACHIEVEMENT UNLOCKED:\nVISIT HAUNTED DREAM'S ITCH.IO",
		"unlocked":false
	},
	"achievement_haunteddream_global":{
		"name":"ACHIEVEMENT UNLOCKED:\nVISIT HAUNTED DREAM'S GLOBAL GAME JAM",
		"unlocked":false
	},
	
	#HORROR SHIP TASK
	"achievement_hst": {
		"name":"ACHIEVEMENT UNLOCKED:\nDISCOVER HORROR SHIP TASK",
		"unlocked":false
	},
	"achievement_hst_itchio": {
		"name":"ACHIEVEMENT UNLOCKED:\nVISIT HORROR SHIP TASK ITCH.IO",
		"unlocked":false
	},
	
	#MISCELANIOUS
	"achievement_all_planetlinks":{
		"name":"ACHIEVEMENT UNLOCKED:\nVISIT ALL PLANETS\nAND LINKS IN THE GAME",
		"unlocked":false
	},
	"achievement_all_links_visited": {
		"name":"ACHIEVEMENT UNLOCKED:\nVISIT ALL LINKS AVAILABLE IN THE GAME",
		"unlocked":false
	},
	"achievement_all_planets_discovered": {
		"name":"ACHIEVEMENT UNLOCKED:\nDISCOVER ALL PLANETS IN THE GAME",
		"unlocked":false
	},
	
	#UNIVERSE
	"achievement_outside_universe": {
		"name":"ACHIEVEMENT UNLOCKED:\nUNIVERSE EXPLORED",
		"unlocked":false
	},
	
	#GAME
	"achievement_completed_game":{
		"name":"ACHIEVEMENT UNLOCKED: COMPLETE THE GAME\nCONGRATULATIONS\nTHANKS FOR PLAYING!",
		"unlocked":false
	}
}

signal achievement_unlocked()

var planet_achievements : PoolStringArray = ["achievement_developer","achievement_xionleak","achievement_colorsmasher","achievement_nohead","achievement_hst","achievement_haunteddream"]
var links_achievements : PoolStringArray = ["achievement_xionleak_twitter","achievement_developer_twitter","achievement_developer_itchio","achievement_nohead_itchio","achievement_hst_itchio","achievement_haunteddream_itchio","achievement_haunteddream_global", "achievement_colorsmasher_itchio"]

#### ACCESSORS ####

func set_achievement(achievement_name : String = "", achievement_value : String = "") -> void:
	if achievement_exists(achievement_name):
		achievements[achievement_name].name = achievement_value
	else:
		push_error("Tried to modify name of achievement " + achievement_name + " but could not be found")

func get_achievement(achievement_name : String = "") -> String:
	if achievement_exists(achievement_name):
		return achievements.get(achievement_name).name
	else:
		return ""

func set_achievement_unlocked(achievement_name : String = "", achievement_unlocked_value : bool = false) -> void:
	if achievement_exists(achievement_name):
		achievements[achievement_name].unlocked = achievement_unlocked_value
	else:
		push_error("Tried to modify unlocked of achievement " + achievement_name + " but could not be found")

func is_achievement_unlocked(achievement_name : String = "") -> bool:
	if achievement_exists(achievement_name):
		return achievements[achievement_name].unlocked
	else:
		return false

#### BUILT IN ####

func _ready() -> void:
	var __ = connect("achievement_unlocked", self, "_on_achievement_unlocked")

#### LOGIC ####

func display_achievements_state() -> void:
	for ach in achievements:
		print("KEY: ", ach)
		print("ACHIEVEMENT: ", get_achievement(ach))
		print("UNLOCKED: ", is_achievement_unlocked(ach))

func unlock_achievement(ACH_NAME: String = "") -> String:
	if get_achievement(ACH_NAME) != "":
		set_achievement_unlocked(ACH_NAME, true)

		return achievements[ACH_NAME].name
	else:
		return ""

func achievement_exists(achievement_name : String = "") -> bool:
	if achievement_name in achievements:
		return true
	else:
		push_error("Achievement " + achievement_name + " does not exist")
		return false

func display_achievement(achievement_name : String = "") -> void:
	if is_instance_valid(ach_label):
		if achievement_name != "" and not is_achievement_unlocked(achievement_name):
			var achievement_to_display = unlock_achievement(achievement_name)
			if achievement_to_display != "":
				ach_label.set_text(achievement_to_display)
				ach_player.play(ach_anim_name)
			emit_signal("achievement_unlocked")
	else:
		push_error("Tried to display an achievement on a label but it could not be found")

func check_for_planets_achievements() -> bool:
	for ach in planet_achievements:
		if not is_achievement_unlocked(ach):
			return false
	return true
	
func check_for_links_achievements() -> bool:
	for ach in links_achievements:
		if not is_achievement_unlocked(ach):
			return false
	return true

func check_for_planetlinks_achievement() -> bool:
	if is_achievement_unlocked("achievement_all_planetlinks"):
		return true
	else:
		return false

func unlock_outside_universe() -> void:
	if check_for_planets_achievements() and not is_achievement_unlocked("achievement_outside_universe"):
		display_achievement("achievement_outside_universe")

#### VIRTUALS ####

#### SIGNALS ####
func _on_achievement_unlocked() -> void:
	if not is_achievement_unlocked("achievement_all_planets_discovered"):
		if check_for_planets_achievements():
			print("achievement_all_planets_discovered has been unlocked!")
			display_achievement("achievement_all_planets_discovered")
	if not is_achievement_unlocked("achievement_all_links_visited"):
		if check_for_links_achievements():
			print("achievement_all_links_visited has been unlocked!")
			display_achievement("achievement_all_links_visited")
	if not is_achievement_unlocked("achievement_all_planetlinks"):
		if check_for_planets_achievements() and check_for_links_achievements():
			print("achievement_all_planetlinks has been unlocked!")
			display_achievement("achievement_all_planetlinks")
	if not is_achievement_unlocked("achievement_completed_game"):
		if check_for_planetlinks_achievement() and is_achievement_unlocked("achievement_outside_universe"):
			print("achievement_completed_game has been unlocked!")
			display_achievement("achievement_completed_game")
	
