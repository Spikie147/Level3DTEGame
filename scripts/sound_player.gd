extends Node

onready var cheat_code = []
onready var music = AudioStreamPlayer.new()

#This creates dictionary for music track sounds.
var music_tracks = {
	"main_theme":"res://assets/audio_files/[SFM] Shrekophone.wav",
	"cody_gay":"res://assets/audio_files/CODY IS GAY.wav",
	"dorime":"res://assets/audio_files/ERA - Ameno-YoutubeConvert.cc.wav"
}

#This creates a dictionary for sound effects.
var sound_effects = {
	"close_game":"res://assets/audio_files/begone_thot.wav",
	"click":"res://assets/audio_files/click.wav",
	"player_slash":"res://assets/audio_files/sword_swish.wav"
	}

#Volume
var music_db = 1
var sound_db = 1

func _unhandled_key_input(event):
	if event.pressed:
		cheat_code.append(event.scancode)
		print(cheat_code.slice(-3,-1))
	if cheat_code.slice(-8,-1) == [67,79,68,89,73,83,71,65,89]:
		print("working")
		music.stop()
		music.stream = load("cody_gay") 

func change_music_db(val):
	music_db = linear2db(val)

func change_sound_db(val):
	sound_db = linear2db(val)

#Plays the music.
func _ready():
	change_music_db(0.4)
	music.volume_db = music_db
	music.stream = load(music_tracks["dorime"])
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

