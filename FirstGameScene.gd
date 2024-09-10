extends Node2D  # Or whatever the root node of your current scene is

func _ready():
	# Load the character scene
	var character_scene = load("res://Character.tscn")
	
	# Instance the character scene
	var character_instance = character_scene.instance()
	
	# Add the character instance to the current scene
	add_child(character_instance)
	
	# Optionally, set the position of the character
	character_instance.position = Vector2(100, 100)  # Set to the desired starting position


func _on_Area2D_body_entered(body):
	pass # Replace with function body.
