extends FlowContainer

var mytask: task = null




func _ready() -> void:
	updateLabel()

func updateLabel() -> void:
	$taskname.text = mytask.title
	$notes.text = mytask.notes
	for thingy in mytask.tags: 
		$tags.append_text(thingy + " ")
		pass
	$tasktime.text = (str(mytask.currMinutes) + "/" + "[i]" + str(mytask.estimatedTimeMinutes) + "[/i]") 


func _on_start_logging_pressed() -> void:
	if(mytask.currentlyTracking == false):
		mytask.beginTracking()
		$startLogging.modulate = Color.DARK_GREEN
	else:
		mytask.endTracking()
		$startLogging.modulate = Color.WHITE
		updateLabel()
	pass # Replace with function body.
