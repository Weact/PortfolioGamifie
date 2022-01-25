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
	}
}

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
			ach_label.set_text(unlock_achievement(achievement_name))
			ach_player.play(ach_anim_name)
	else:
		push_error("Tried to display an achievement on a label but it could not be found")

#### VIRTUALS ####

#### SIGNALS ####
