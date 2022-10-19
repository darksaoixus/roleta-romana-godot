extends Control


const ElementLabel := preload("res://scenes/element_label.tscn")

var list := List.new()

onready var add_new_element: LineEdit = get_node("%AddNewElement")

func _ready() -> void:
	list.connect("element_appended", self, "_on_list_element_appended")
	list.connect("round_played", self, "_on_list_round_played")


func _on_AddNewElement_text_entered(new_element_name: String) -> void:
	if list.size < 11:
		var element_to_append := LElement.new(new_element_name)
		list.append(element_to_append)
	else:
		pass
	add_new_element.text = ""


func _on_AddNewElement_text_changed(new_text: String) -> void:
	if new_text == " ":
		add_new_element.text = ""


func _on_list_element_appended(new_element: LElement) -> void:
	var label_to_add := ElementLabel.instance() as MarginContainer
	label_to_add.text = new_element.name
	get_node("%Elements").add_child(label_to_add)


func _on_list_round_played(removed_element: LElement, next_start: LElement) -> void:
	pass
