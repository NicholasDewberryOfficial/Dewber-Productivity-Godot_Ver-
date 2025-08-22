extends Node2D

@export var taskslice: PackedScene

@export var currtasks: Array[task]

func _ready() -> void:
	#read from a file 
	#show all tasks
	for thingy in currtasks:
		var currslice = taskslice.instantiate()
		currslice.mytask = thingy
		$HBoxContainer.add_child(currslice)
		pass
	
	pass


func addTask() -> void: 
	pass
