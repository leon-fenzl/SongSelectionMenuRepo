extends Button
@onready var research = []
@onready var allButtons = [] #feeded through Game Manager
@onready var index:int
func _on_button_search_button_down():
	for i in allButtons.size():
		if allButtons[i].text not in research:
			research.append(allButtons[i].text)
		else:
			return
	print(research[5])
