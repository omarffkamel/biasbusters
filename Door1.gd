extends Area2D

export(String) var next_scene_path = "res://FirstGameScene.tscn"

func _ready():
	connect("body_entered", self, "_on_body_entered")

# This is triggered when the player enters the Area2D
func _on_body_entered(body):
	if body is KinematicBody2D:  # To ensure it detects the player (or other PhysicsBody2D)
		print("Player entered the door area!")
		get_tree().change_scene(next_scene_path)  # Change scene if player enters



func _on_Area2D_body_entered(body):
	pass # Replace with function body.
