extends Resource

class_name task 


@export var uniqueID: int 
@export var title: String 
#0 = bad, 1 = normal 2 = good
@export var mood: int 

@export var tags: Array[String]

@export var notes: String

#Note: all times are in unix epoch time 
@export var scheduledDate: int 

@export var estimatedTimeMinutes: int
@export var currMinutes: int 

#set to 0 if active. Nonzero if not.
@export var archiveDate: int 
#Future work: Repeatable schedule

@export var currentlyTracking: bool = false

@export var startTime: int 
 

func maketask(tit: String, taggies: Array[String]) -> task:
	var thistask = task.new() 
	thistask.title = tit
	thistask.tags = taggies
	return thistask
	

func archiveTask() -> void:
	self.archiveDate = Time.get_unix_time_from_system()

func beginTracking() -> void:
	self.currentlyTracking = true
	self.startTime = Time.get_unix_time_from_system()
	
func endTracking() -> void:
	self.currentlyTracking = false
	var endingtime = Time.get_unix_time_from_system()
	self.currMinutes = endingtime - self.startTime + self.currMinutes
	self.startTime = 0

func unix_to_total_minutes(unix_time: int) -> int:
	# There are 60 seconds in a minute, so we divide.
	# The result is cast to an integer to get whole minutes.
	return int(unix_time / 60.0)

func unix_to_ISODateTime(unix_time: int) -> String:
	return Time.get_datetime_string_from_unix_time(unix_time)
