extends Node2D  # Or the appropriate base node for your scene

# Function to create and position labels above doors
func create_room_label(door_position: Vector2, room_name: String):
	var label = Label.new()
	label.text = room_name
	label.rect_min_size = Vector2(200, 30)  # Adjust size of the label
	label.rect_position = Vector2(door_position.x - 50, door_position.y - 70)  # Position above the door
	label.align = Label.ALIGN_CENTER  # Center-align the text
	label.valign = Label.VALIGN_CENTER  # Center vertically if you adjust size
	label.add_color_override("font_color", Color(1, 1, 1))  # Set font color to white (adjust as needed)
	
	# Optional: Adjust the font size
	var dynamic_font = DynamicFont.new()
	dynamic_font.size = 24  # Set a larger or smaller size as needed
	label.add_font_override("font", dynamic_font)

	add_child(label)

# Main ready function to add labels for each door
func _ready():
	# Add a label for each door
	create_room_label(Vector2(100, 300), "University Fair")  # Adjust positions based on door locations
	create_room_label(Vector2(300, 300), "Computer Room")
	create_room_label(Vector2(500, 300), "Library")
