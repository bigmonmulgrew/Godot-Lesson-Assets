extends Area3D

@export var next_level = "res://Levels/level_1.tscn"

func _on_body_entered(body):
	print(body.name)
	if body.name != "Player":
		print("Not a player, ignoring")
		return
	print("Flag reached")
	get_tree().change_scene_to_file(next_level)
