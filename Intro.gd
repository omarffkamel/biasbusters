extends Node2D

var current_line = 0
var dialogue = [
	"Have you ever made a decision quickly based on something that came to your mind immediately, like recalling a recent news story or personal experience, without considering all the facts?",
	"This is an example of availability bias.",
	"Graduation is around the corner, and Niko needs to decide what career path to follow.",
	"You are going to help Niko make a decision by avoiding falling into the availability bias trap.",
	"Let's start?"
]

# Variables to manage text animation
var typing_speed = 0.1  # Slower speed (seconds per character)
var typing_index = 0  # Tracks the current character index for typing animation
var current_text = ""  # Holds the current line being typed
var full_text = ""  # The entire current line to be revealed

onready var dialogue_label = $Label
onready var button = Button.new()

# Font setup
var dynamic_font = DynamicFont.new()
var font_data = load("res://Fonts/BebasNeue-Regular.ttf")  # Correct font path
onready var typing_timer = Timer.new()

func _ready():
	# Ensure the label is initialized properly
	if dialogue_label == null:
		print("Error: DialogueLabel is not found!")
		return

	# Create and assign the dynamic font
	dynamic_font.font_data = font_data
	dynamic_font.size = 40  # Keep font size as is
	dynamic_font.extra_spacing_char = 1
	dialogue_label.add_font_override("font", dynamic_font)
	dialogue_label.add_color_override("font_color", Color(0.9, 0.9, 0.9))  # Light gray color
	dialogue_label.align = Label.ALIGN_CENTER
	dialogue_label.rect_position = Vector2(100, 80)  # Adjust position to move the text down
	dialogue_label.rect_min_size = Vector2(800, 150)  # Adjust the size of the label to ensure proper wrapping
	dialogue_label.autowrap = true  # Enable word wrapping

	# Setup the button, but hide it initially
	button.text = "Next"
	button.rect_min_size = Vector2(150, 50)
	button.rect_position = Vector2((get_viewport_rect().size.x - button.rect_min_size.x) / 2, 
									(get_viewport_rect().size.y - button.rect_min_size.y) / 1.3)
	button.visible = false  # Hide the button initially
	button.connect("pressed", self, "_on_button_pressed")
	add_child(button)

	# Initialize the dialogue display and typing animation
	add_child(typing_timer)
	typing_timer.connect("timeout", self, "_update_typing_effect")
	_start_typing_animation()

func _start_typing_animation():
	typing_index = 0
	current_text = ""
	full_text = dialogue[current_line]  # Get the current line from dialogue
	typing_timer.start(typing_speed)  # Start the timer for the typing effect

func _update_typing_effect():
	if typing_index < full_text.length():
		current_text += full_text[typing_index]  # Add one character at a time
		dialogue_label.text = current_text  # Update label with the current progress
		typing_index += 1
	else:
		typing_timer.stop()  # Stop the typing effect when the line is fully revealed
		_check_if_more_text()

# Automatically move to the next line of dialogue or show the button when done
func _check_if_more_text():
	if current_line < dialogue.size() - 1:
		current_line += 1
		_start_typing_animation()  # Start the typing animation for the next line
	else:
		# All text has been displayed, reveal the "Next" button
		button.visible = true

func _on_button_pressed():
	# When all text is done, proceed to the next scene
	get_tree().change_scene("res://MainHallway.tscn")
