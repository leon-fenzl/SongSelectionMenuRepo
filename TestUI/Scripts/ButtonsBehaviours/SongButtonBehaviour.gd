extends Button
@onready var testSongsPath = "res://TestSongs/"
@onready var buttonIndex:int
@onready var songArray:Array
@onready var aSPlayer:AudioStreamPlayer
@onready var currentStream = AudioStream
func _on_custom_base_song_button_button_down():
	SetValues()
	aSPlayer.playing = true
	aSPlayer.volume_db = -16
func SetValues():
	for i in songArray.size():
		if i == buttonIndex:
			currentStream = load(testSongsPath+songArray[buttonIndex])
			aSPlayer.stream = currentStream
func _on_custom_base_song_button_mouse_entered():
	custom_minimum_size = Vector2(custom_minimum_size.x,120)
func _on_custom_base_song_button_mouse_exited():
	custom_minimum_size = Vector2(custom_minimum_size.x,100.0)
