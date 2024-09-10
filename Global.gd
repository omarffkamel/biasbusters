extends Node

var character_scene = preload("res://Character.tscn")  # Path to your Nico character scene
var character_instance = null  # Stores the instantiated character

func _ready():
	print("Global.gd _ready() called")

	# Instantiate Nico only once
	if character_instance == null:
		print("Instantiating character for the first time.")
		character_instance = character_scene.instance()

	# Add Nico to the current scene automatically
	_check_and_add_character()

func _check_and_add_character():
	var current_scene = get_tree().current_scene
	if current_scene != null:
		print("Current scene:", current_scene.name)

		# Remove Nico from any previous scene to prevent duplicates
		if character_instance.get_parent() != null:
			print("Removing character from previous scene")
			character_instance.get_parent().remove_child(character_instance)

		# Add Nico to the current scene
		print("Adding character to", current_scene.name)
		current_scene.add_child(character_instance)

		# Set Nico's position based on the scene
		_set_character_position(current_scene.name)

		print("Character position set to:", character_instance.global_position)
	else:
		print("Error: current_scene is null!")

func _set_character_position(scene_name: String):
	match scene_name:
		"MainScene":
			character_instance.global_position = Vector2(400, 400)  # Adjust position for the main scene
		"IntroScene":  # Make sure the name matches your intro scene
			character_instance.global_position = Vector2(200, 350)  # Adjust position for the intro scene
		_:
			character_instance.global_position = Vector2(100, 100)  # Default position for other scenes
