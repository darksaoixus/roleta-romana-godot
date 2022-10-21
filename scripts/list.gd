extends Reference


var head: LElement
var tail: LElement
var size: int = 0

func append(element: LElement) -> void:
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


func remove(element: LElement) -> void:
	if element == head:
		head = head.next
		head.previous = tail
	elif element == tail:
		tail = tail.previous
		tail.next = head
	else:
		element.previous.next = element.next


func play_round(n: int, start: LElement) -> void:
	var el := start
	for _i in range(n):
		el = el.next
	remove(el)
