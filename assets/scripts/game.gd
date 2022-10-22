extends Control


const ElementText := preload("res://assets/scenes/element_text.tscn")

var list := List.new()

onready var elements: VBoxContainer = get_node("%Elements")
onready var removed_elements: VBoxContainer = get_node("%RemovedElements")

func _ready() -> void:
	list.connect("element_appended", self, "_update_elements")
	list.connect("element_removed", self, "_update_removed_elements")
	
	list.append("oi")
	list.append("tchau")
	list.append("treqw")
	list.play_round(4, list.head)


func _update_elements() -> void:
	for c in elements.get_children():
		elements.remove_child(c)
	
	var el := list.head
	while true:
		var element_text: Label = ElementText.instance()
		element_text.text = el.text
		elements.add_child(element_text)
		if el == list.tail:
			break
		el = el.next


func _update_removed_elements(element: LElement) -> void:
	_update_elements()
	var element_text: Label = ElementText.instance()
	element_text.text = element.text
	
	removed_elements.add_child(element_text)
