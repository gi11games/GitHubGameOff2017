extends Button

onready var count_text = get_node("count_text")
var count_num
export(int) var slot_id
export(int) var item_id
onready var item_data = get_node("ItemDatabase")
onready var invent_sys = get_parent().get_parent()
onready var timer = get_parent().get_parent().get_node("Timer")
onready var split_item = false

func _ready():
	item_id = 0
	count_num = 0
	
	#Signals
	#connect("mouse_entered", self, "_mouse_entered")
	#connect("mouse_exited", self, "_mouse_exited")

func _physics_process(delta):
	refresh()
	
func refresh():
	set_button_icon(item_data.get_item_image(item_id))
	if count_num == 0:
		item_id = 0
	if count_num > 1:
		count_text.set_text(str(count_num))
	else:
		count_text.set_text("")

	### split item timer
	if split_item == true:
		timer.set_wait_time(0.1)
		if timer.get_time_left() <= 0:
			if count_num > 0:
				invent_sys.item_select.count_num += 1
				count_num -= 1
				timer.start()

func _input(event):
	if event is InputEventMouseButton:
		if event.is_action_pressed("left_click"):
			if item_id != 0:
				if item_id == invent_sys.item_select.item_id:
					if item_data.get_can_store(item_id) :
						count_num += invent_sys.item_select.count_num
						invent_sys.item_select.item_id = 0
						invent_sys.item_select.count_num = 0
				elif invent_sys.item_select.item_id == 0:
					invent_sys.item_select.item_id = item_id
					invent_sys.item_select.count_num = count_num
					count_num = 0
					item_id = 0
				elif item_id != invent_sys.item_select.item_id and invent_sys.item_select.item_id != 0:
					var tmp_item_id = invent_sys.item_select.item_id
					var tmp_count_num = invent_sys.item_select.count_num
					invent_sys.item_select.item_id = item_id
					invent_sys.item_select.count_num = count_num
					item_id = tmp_item_id
					count_num = tmp_count_num
			elif item_id == 0:
				item_id = invent_sys.item_select.item_id
				count_num = invent_sys.item_select.count_num
				invent_sys.item_select.item_id = 0
				invent_sys.item_select.count_num = 0
		elif event.is_action_pressed("right_click"):
			if invent_sys.item_select.item_id == 0:
				invent_sys.item_select.item_id = item_id
				invent_sys.item_select.count_num += 1
				count_num -= 1
				timer.set_wait_time(0.5)
				timer.start()
				split_item = true
			elif invent_sys.item_select.item_id == item_id:
				if item_data.get_can_store(item_id):
					invent_sys.item_select.item_id = item_id
					invent_sys.item_select.count_num += 1
					count_num -= 1
					timer.set_wait_time(0.5)
					timer.start()
					split_item = true
			elif count_num == 0 and invent_sys.item_select.count_num > 0:
				item_id = invent_sys.item_select.item_id
				count_num += 1
				invent_sys.item_select.count_num -= 1
		elif event.is_action_released("right_click"):
			split_item = false
