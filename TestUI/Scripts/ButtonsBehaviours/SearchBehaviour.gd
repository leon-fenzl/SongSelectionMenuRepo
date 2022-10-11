extends LineEdit
@onready var research = []
@onready var allButtons = [] #feeded through Game Manager
@onready var index:int
func FeedTheSearch(a:Array):
	for i in allButtons.size():
		if allButtons[i].text not in research:
			research.append(allButtons[i].text)
		else:
			return
func _on_search_bar_text_changed(new_text):
	pass # Replace with function body.
