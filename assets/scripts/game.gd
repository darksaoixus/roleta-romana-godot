extends Control


const ElementText := preload("res://assets/scenes/element_text.tscn")

var list := List.new()
var step: int

func _ready() -> void:
	list.connect("element_appended", self, "_update_elements")
	list.connect("element_removed", self, "_update_removed_elements")
	
#	list.append("oi")
#	list.append("tchau")
#	list.append("treqw")
#	list.play_round(4, list.head)


func _update_elements() -> void:
	if $"%Elements".get_child_count() != 0:
		for c in $"%Elements".get_children():
			$"%Elements".remove_child(c)
	
	var el := list.head
	while true:
		var element_text: Label = ElementText.instance()
		element_text.text = el.text
		$"%Elements".add_child(element_text)
		if el == list.tail:
			break
		el = el.next


func _update_removed_elements(element: LElement) -> void:
	_update_elements()
	var element_text: Label = ElementText.instance()
	element_text.text = element.text
	
	$"%RemovedElements".add_child(element_text)


func _on_ElementNameEdit_text_entered(new_text: String) -> void:
	list.append(new_text)
	$"%ElementNameEdit".text = ""


func _on_NEdit_text_entered(new_text: String) -> void:
	if not new_text.is_valid_integer():
		$"%NEdit".text = ""
		$NError.popup()
	else:
		var n := int(new_text)
		if n <= 0:
			$"%NEdit".text = ""
			$NError.popup()
		else:
			step = n
			$"%NextStepButton".disabled = false
			$"%NEdit".editable = false
