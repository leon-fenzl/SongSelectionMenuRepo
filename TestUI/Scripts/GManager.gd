extends Control
@onready var songsFolderPath = "res://TestSongs/"
@onready var songSArray = []
@onready var buttonObject ="res://Buttons/SongButton.tscn"
@onready var buttonsArray = []
@onready var searchBttRef = $Menu/HBC_Top/VBC_Sorter/HBC_ButtonsHeader/Button_Search
func _ready():
	CreateSongsArray(songsFolderPath)
	SpawnButtons(songSArray)
	FeedEachButton()
func _input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
func CreateSongsArray(path):
	var dir = DirAccess.open(path)
	dir.list_dir_begin()
	while true:
		var songFile = dir.get_next()
		if songFile == "": 
			break
		elif !songFile.begins_with(".") and !songFile.ends_with(".import"):
			songSArray.append(songFile)
	dir.list_dir_end()
	return songSArray
func SpawnButtons(refArray:Array):
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
		searchBttRef.allButtons.append(buttonsArray[index]) #Feed Search Array
		var each = buttonsArray[index]
		each.buttonIndex = index
		each.songArray = songSArray
		each.aSPlayer = $AudioStreamPlayer
		var upperCase:String = str(songSArray[index])
		var lowerCase:String = str(songSArray[index])
		upperCase = upperCase.left(1).to_upper()
		lowerCase = lowerCase.right(-1).replace(".ogg","")
		each.text = upperCase+lowerCase
