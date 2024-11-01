extends Node3D

@export var message: String = "Hello, World!"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check for right input
	if Input.is_action_just_pressed("ui_right"):
		print("Right Pressed: " + message)
		
	# Check for left input
	if Input.is_action_just_pressed("ui_left"):
		print("Left Pressed: " + message)
		
	# Check for up input
	if Input.is_action_just_pressed("ui_up"):
		print("Up Pressed: " + message)
		
	# Check for down input
	if Input.is_action_just_pressed("ui_down"):
		print("Down Pressed: " + message)
		
	# Check for accept input
	if Input.is_action_just_pressed("ui_accept"):
		print("Accept Pressed: " + message)


func _on_timer_timeout() -> void:
	print("The timer has finished.")
