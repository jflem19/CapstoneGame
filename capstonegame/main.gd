extends Node2D

@export var buildings : Array[PackedScene]
@export var building_distance = 10 
var previous_building_position = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame
func _process(_delta):
	if $rat.position.x > previous_building_position + building_distance:
		var new_building = buildings.pick_random().instantiate()
		new_building.position.x = previous_building_position + building_distance
		new_building.position.x += randi_range(-0, 400)
		new_building.position.y += randi_range(650, 650)
		add_child(new_building)
		previous_building_position = new_building.position.x
		
func _process2(_delta):
	if  $character> previous_building_position + building_distance:
		var new_building = buildings.pick_random().instantiate()
		new_building.position.x = previous_building_position + building_distance
		new_building.position.x += randi_range(-0, 400)
		new_building.position.y += randi_range(650, 650)
		add_child(new_building)
		previous_building_position = new_building.position.x
		
@onready var player1 = $rat
@onready var player2 = $character
@onready var camera = $Camera2D
