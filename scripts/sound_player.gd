extends Node

onready var cheat_code = []
onready var music = AudioStreamPlayer.new()

#This creates dictionary for music track sounds.
var music_tracks = {
	"main_theme":""
}

#This creates a dictionary for sound effects.
var sound_effects = {
	"close_game":"res://assets/audio_files/begone_thot.wav"
}

#Volume
var music_db = 1
var sound_db = 1

func change_music_db(val):
	music_db = linear2db(val)

func change_sound_db(val):
	sound_db = linear2db(val)
#This plays the music.
func _ready():
	change_music_db(0.08)
	music.volume_db = music_db
	music.stream = load(music_tracks["main_theme"])
	add_child(music)
	music.play()
	print(music.stream)
	print("playing music")

#This plays sound effects.
func play_sound_effect(sfx):
	var sound = AudioStreamPlayer.new()
	sound.stream = load(sound_effects[sfx])
	change_sound_db(.1)
	sound.volume_db = sound_db
	add_child(sound)
	sound.play()
	
	yield(sound,"finished")
	sound.queue_free()
	#return sound
