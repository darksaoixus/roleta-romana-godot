class_name List
extends Reference


signal element_appended()
signal element_removed(element)

var head: LElement
var tail: LElement
var size: int = 0

func append(text: String) -> void:
	var element = LElement.new(text)
	if size == 0:
		head = element
		tail = element
		head.previous = tail
		head.next = tail
		tail.previous = head
		tail.next = head
	else:
		element.previous = tail
		element.next = head
		tail.next = element
		tail = element
	size += 1
	
	emit_signal("element_appended")


func remove(element: LElement) -> void:
	if element == head:
		head = head.next
		head.previous = tail
	elif element == tail:
		tail = tail.previous
		tail.next = head
	else:
		element.previous.next = element.next
	
	emit_signal("element_removed", element)


func play_round(n: int, start: LElement) -> LElement:
	if size != 1:
		var el := start
		for _i in range(n - 1):
			el = el.next
		remove(el)
		return el.next
	return null
