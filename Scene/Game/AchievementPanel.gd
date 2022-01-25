extends Panel

#### ACCESSORS ####

#### BUILT-IN ####

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and owner.get_name() == "Game":
		owner.achievement_animationplayer.play_backwards("display_achievement")

#### VIRTUALS ####



#### LOGIC ####



#### INPUTS ####



#### SIGNAL RESPONSES ####
