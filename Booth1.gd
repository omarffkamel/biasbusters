extends Area2D

# An array to store dialogue lines for the booth
var booth_dialogue = [
	"Hey there! I'm so glad you stopped by.",
	"We offer top-ranked programs and great facilities.",
	"Let me know if you have any questions!"
]

# Variable to track the current dialogue line
var current_line = 0

# Reference to the Label node to display the dialogue
onready var dialogue_label = get_node("/root/Room/Control/DialogueLabel")

func _ready():
	# Debugging to check if Label is referenced properly
	print("Ready function called.")
	print_tree_pretty()  # Prints the full node tree to verify hierarchy
	print("DialogueLabel reference:", dialogue_label)  # Check if the label is correctly referenced

	# Connect the signal to detect when the player enters the booth area
	connect("body_entered", self, "_on_body_entered")

# This function is triggered when the player enters the Area2D
func _on_body_entered(body):
	if body is KinematicBody2D:  # Ensure the player is the one entering the area
		print("Player entered the booth area!")
		show_next_dialogue_line()

# Function to show the next line of dialogue
func show_next_dialogue_line():
	if dialogue_label != null:
		# Debugging to ensure visibility and text assignment works
		print("Showing next dialogue line:", booth_dialogue[current_line])
		dialogue_label.text = booth_dialogue[current_line]
		dialogue_label.visible = true  # Ensure the label is visible
		current_line += 1

		# Ensure we don't exceed the array size
		if current_line >= booth_dialogue.size():
			current_line = 0  # Reset to the beginning after all lines are shown
	else:
		print("Label is not found or not initialized properly.")
