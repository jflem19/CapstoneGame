extends Node2D

@export var buildings : Array[PackedScene]
@export var building_distance = 500
var previous_building_position = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame
func _process(_delta):
	if $"../Camera2D2".position.x > previous_building_position + building_distance:
		var new_building = buildings.pick_random().instantiate()
		new_building.position.x = previous_building_position + building_distance
		new_building.position.x += randi_range(-100, 100)
		new_building.position.y += randi_range(-100, 100)
		add_child(new_building)
		previous_building_position = new_building.position.x
