extends Node

const ITEM_ID = 0
const ITEM_NAME = 1
const ITEM_IMAGE = 8
const ITEM_MODEL = 9
const CAN_STORE = 10

var item_database = [
	{ITEM_ID : 0, ITEM_NAME : "Empty",  ITEM_IMAGE : "res://assets/sprites/temp/yellow.png", CAN_STORE : true},
	{ITEM_ID : 1, ITEM_NAME : "Wood",  	ITEM_IMAGE : "res://assets/sprites/temp/green.png", CAN_STORE : true},
	{ITEM_ID : 2, ITEM_NAME : "Water",  ITEM_IMAGE : "res://assets/sprites/temp/blue.png", CAN_STORE : true},
	{ITEM_ID : 3, ITEM_NAME : "Fire",  	ITEM_IMAGE : "res://assets/sprites/temp/red.png", CAN_STORE : true},
]

func get_item_id(i):
	return item_database[i][ITEM_ID]

func get_item_name(i):
	return item_database[i][ITEM_NAME]
	
func get_item_image(i):
	var image = load(item_database[i][ITEM_IMAGE])
	return image
	
func get_item_model(i):
	var model = load(item_database[i][ITEM_MODEL])
	return model.instance()

func get_can_store(i):
	return item_database[i][CAN_STORE]