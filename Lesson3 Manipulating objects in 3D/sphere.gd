extends Node3D

const SPEED: float = 1 #  between 0 and 1

# Initial color
var color: Color = Color(0, 0, 0) # RGB
var sphere_material: StandardMaterial3D
@onready var sphere_readout: Label = $"../CanvasLayer/Sphere Readout"

func _ready():
	# Set initial cube color
	sphere_material = StandardMaterial3D.new()
	self.material_override = sphere_material
	sphere_material.albedo_color = color
	sphere_material.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA

func _process(delta: float) -> void:
	
	if Input.is_action_pressed("Red_Up"):
		color.r += SPEED * delta
		if color.r > 1.0:
			color.r = 0
	
	if Input.is_action_pressed("Green_Up"):
		color.g += SPEED * delta
		if color.g > 1.0:
			color.g = 0
	
	if Input.is_action_pressed("Blue_Up"):
		color.b += SPEED * delta
		if color.b > 1.0:
			color.b = 0
		
	if Input.is_action_pressed("Alpha_Up"):
		print(color.a)
		color.a += SPEED * delta
		if color.a > 1.0:
			color.a = 0
	
	sphere_material.albedo_color = color
	sphere_readout.text = "Sphere RGBA: %.3f %.3f %.3f %.3f" % [color.r, color.g, color.b, color.a]
