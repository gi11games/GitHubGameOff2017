extends Button

onready var count_text = get_node("Label")
onready var item_data = get_node("ItemDatabase")
var count_num 
var item_id

func _ready():
	count_num = 0
	item_id = 0

func _process(delta):
	refresh()
	if count_num > 1:
		count_text.set_text(str(count_num))
	else:
		count_text.set_text("")

func refresh():
	var m = get_global_mouse_position()
	set_position(Vector2(m.x, m.y))
	set_button_icon(item_data.get_item_image(item_id))
	show_hide()
	
func show_hide():
	if count_num == 0:
		item_id = 0
		hide()
	else:
		show()

