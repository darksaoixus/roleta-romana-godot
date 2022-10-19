class_name List
extends Reference


signal element_appended(new_element)
signal round_played(removed_element, next_start)

var head: LElement
var tail: LElement
var size: int = 0

func append(element: LElement) -> void:
	if size == 0:
		head = element
		tail = element
		element.next = element
		element.previous = element
	else:
		element.previous = tail
		element.next = head
		tail.next = element
		head.previous = element
		tail = element
	size += 1
	emit_signal("element_appended", element)


func remove(element: LElement) -> void:
	size -= 1
	element.previous.next = element.next


func play_round(n: int, start: LElement) -> void:
	if size != 1:
		var element_to_remove := start
		for i in range(n):
			element_to_remove = element_to_remove.next
		
		var next_start = element_to_remove.next
		emit_signal("round_played", element_to_remove, next_start)
		remove(element_to_remove)
