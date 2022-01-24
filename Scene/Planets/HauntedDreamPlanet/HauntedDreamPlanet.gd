extends Planet
class_name HauntedDreamPlanet
func is_class(value: String):return value == "HauntedDreamPlanet" or .is_class(value)
func get_class() -> String:return "HauntedDreamPlanet"

#### ACCESSORS ####

#### BUILT-IN ####

#### LOGIC ####

#### VIRTUALS ####

func create_spatial_planet_game_name() -> void:
	if PlanetGameNameScene != null:
		var spatial_instance = PlanetGameNameScene.instance()
		get_parent().call_deferred("add_child", spatial_instance)
		spatial_instance.set_position(Vector2(self.get_position().x - 260, self.get_position().y - 750))
		SpatialPlanetGameNamesArray.append(spatial_instance)
		destroy_first_spatial_planet_game_name()

func create_spatial_game_description() -> void:
	if PlanetGameDescriptionScene != null:
		var spatial_description_instance = PlanetGameDescriptionScene.instance()
		get_parent().call_deferred("add_child", spatial_description_instance)
		spatial_description_instance.set_position(Vector2(self.get_position().x, self.get_position().y - 350))
		SpatialPlanetGameDescriptionArray.append(spatial_description_instance)
		destroy_first_spatial_planet_game_description()

#### INPUTS ####

#### SIGNAL RESPONSES ####
