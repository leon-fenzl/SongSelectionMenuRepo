extends Control
@onready var songsFolderPath = "res://TestSongs/"
@onready var songSArray = []
@onready var buttonObject ="res://Buttons/CustomBaseSongButton.tscn"
@onready var buttonsArray = []
func _ready():
	CreateSongsArray(songsFolderPath)
	SpawnButtons(songSArray)
	FeedEachButton()
func _input(_event):
	if Input.is_action_just_pressed("ui_end"):
		get_tree().quit()
func CreateSongsArray(path):
#	Below, is the "virtual" directory created
#	once the menu finishes its loading
	var dir = Directory.new()
#	than I open this said directory
#	and since I want to open it
#	it must have a path somewhere,
#	so I put in my said path in, "var songsFolderPath"
	dir.open(path)
#	Here I start listing all files in this directory.
	dir.list_dir_begin()
	while true:
		var songFile = dir.get_next()
#		The get_next() function looks for a file in the said directory
		if songFile == "": 
			break	#here I check first in the loop, if the checked 
					#file is a file by it self and not a directory.
					#otherwise, it goes out of the loop,
					#wich makes the loop return false
		elif !songFile.begins_with(".") and !songFile.ends_with(".import"):
			#once checked if its a file per se, and not either a directory nor
			#the end of the loop, it also checks how does it is it`s parenting
			#and if IT is not a .import intern data from Godot
			#so it ONLY ADDS the songs to the array.
			songSArray.append(songFile)
	dir.list_dir_end()
	print(songSArray)
	return songSArray
func SpawnButtons(refArray:Array):
#	Here, I generate a pool of buttons, with the
#	same length/size of the songsArray.
	var object = load(buttonObject)
	for index in refArray:
		var bObj = object.instantiate()
		buttonsArray.append(bObj)
		$Menu/HBC_Divider/ScrollContainer/VBC_Buttons.add_child(bObj)
	return buttonsArray
func FeedEachButton():
	var index:int
	for i in buttonsArray.size():
		index = i
		var each = buttonsArray[index]
		each.buttonIndex = index
		each.songArray = songSArray
		each.aSPlayer = $AudioStreamPlayer
