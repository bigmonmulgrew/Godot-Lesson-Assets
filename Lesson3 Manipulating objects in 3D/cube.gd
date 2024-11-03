extends MeshInstance3D

const MOVE_SPEED: float = 1 
const ROTATION_SPEED: float = 10 

@onready var cube_position_readout: Label = $"../CanvasLayer/Cube Readout"
@onready var cube_rotation_readout: Label = $"../CanvasLayer/Cube Readout2"

var cube_position: Vector3
var cube_rotation: Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cube_position = position
	cube_rotation = global_rotation
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_translate_cube(delta)
	_rotate_cube(delta)

func _translate_cube(delta: float):
	
	# This is an early exit condition
	if Input.is_key_pressed(KEY_CTRL):
		return
	
	if Input.is_action_pressed("Move_Up"):
		cube_position.y += delta * MOVE_SPEED
		
	if Input.is_action_pressed("Move_Down"):
		cube_position.y -= delta * MOVE_SPEED
		
	if Input.is_action_pressed("Move_Left"):
		cube_position.x -= delta * MOVE_SPEED
		
	if Input.is_action_pressed("Move_Right"):
		cube_position.x += delta * MOVE_SPEED
		
	if Input.is_action_pressed("Move_Forward"):
		cube_position.z -= delta * MOVE_SPEED
		
	if Input.is_action_pressed("Move_Backward"):
		cube_position.z += delta * MOVE_SPEED
	
	position = cube_position
	cube_position_readout.text = "Sphere Position: %.3f %.3f %.3f" % [cube_position.x, cube_position.y, cube_position.z]

func _rotate_cube(delta:float):
	
	# This is an early exit condition
	if not Input.is_key_pressed(KEY_CTRL):
		return
		
	var x_axis: float = Input.get_axis("Rotate_Forward", "Rotate_Backward")
	var y_axis: float = Input.get_axis("Rotate_Left", "Rotate_Right")
	var z_axis: float  = Input.get_axis("Rotate_Down", "Rotate_Up")
	
	var input_rotation: Vector3 = Vector3(x_axis, y_axis, z_axis)
	input_rotation *= delta * ROTATION_SPEED
	
	cube_rotation += input_rotation
	
	global_rotation = cube_rotation
	cube_rotation_readout.text = "Sphere Position: %.3f %.3f %.3f" % [cube_rotation.x, cube_rotation.y, cube_rotation.z]
	
	
