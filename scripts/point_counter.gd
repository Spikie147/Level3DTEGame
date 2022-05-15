extends Node

var count = 0 setget _set_count

func _set_count(score):
	if score == count:return
	score = count 
	#need object to attach points to:	set_text(str(count))

func increment():
	set('count', count +1)
