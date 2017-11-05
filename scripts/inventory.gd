extends Control

onready var ItemDatabase = $ItemDatabase
onready var item_select = $item_select
onready var item_list = []

func _ready():
	for i in range(get_node("inventory_slots").get_child_count()):
		item_list.append(get_node("inventory_slots").get_child(i))

	
	add_item(1)
	add_item(2)
	add_item(3)
	add_item(3)
	add_item(3)
	add_item(3)

func add_item(item_id):
	for i in range(item_list.size()):
		if item_list[i].item_id == item_id and ItemDatabase.get_can_store(item_id):
			print("1")
			item_list[i].count_num += 1
			return true
			break
		elif item_list[i].item_id == 0:
			print("2")
			item_list[i].item_id = item_id
			item_list[i].count_num += 1
			return true
			break