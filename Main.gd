extends Control

func _ready():
	# Add a background color
	var background = ColorRect.new()
	background.color = Color(0.2, 0.3, 0.4, 1)  # Darkish blue
	background.rect_min_size = Vector2(1024, 600)
	add_child(background)

	# Create a dynamic font and load the Bebas Neue font resource
	var dynamic_font = DynamicFont.new()
	var font_data = load("res://Fonts/BebasNeue-Regular.ttf")  # Correct font path
	dynamic_font.font_data = font_data
	dynamic_font.size = 80  # Slightly increased font size for better prominence
	dynamic_font.extra_spacing_char = 1  # Tighter character spacing for better appearance

	# Create the title label with enhanced styling
	var title_label = Label.new()
	title_label.text = "Bias Busters"
	title_label.rect_min_size = Vector2(800, 120)  # Adjusted label size
	title_label.rect_position = Vector2(112, 50)  # Position adjusted based on new size
	title_label.add_color_override("font_color", Color(0.9, 0.9, 0.9))  # Soft off-white color for a smoother look
	title_label.add_font_override("font", dynamic_font)  # Apply the dynamic font

	# Center the title text horizontally
	title_label.align = Label.ALIGN_CENTER
	add_child(title_label)

	# Create the Start Button
	var start_button = Button.new()
	start_button.text = "Start"
	start_button.rect_min_size = Vector2(200, 60)
	start_button.rect_position = Vector2(412, 280)  # Moved the button up to reduce the gap
	add_child(start_button)

	# Connect the button's pressed signal to a function
	start_button.connect("pressed", self, "_on_StartButton_pressed")

# Function to handle the button press
func _on_StartButton_pressed():
	var second_scene = load("res://Intro.tscn")
	if second_scene != null:
		get_tree().change_scene_to(second_scene)
