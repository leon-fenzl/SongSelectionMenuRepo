extends Button
@onready var testSongsPath = "res://TestSongs/"
@onready var buttonIndex:int
@onready var songArray:Array
@onready var aSPlayer:AudioStreamPlayer
@onready var dir:Directory
@onready var currentStream = AudioStream
func _ready():
	dir = Directory.new()
func _on_custom_base_song_button_button_down():
	dir.open(testSongsPath)
	for i in songArray.size():
		if i == buttonIndex:
			currentStream = load(testSongsPath+songArray[buttonIndex])
			aSPlayer.stream = currentStream
	aSPlayer.playing = true
	aSPlayer.volume_db = -16
