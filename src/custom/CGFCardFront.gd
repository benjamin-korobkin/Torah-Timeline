extends CardFront

func _ready() -> void:
	var _card_text = find_node("CardText")
	# Map your card text label layout here. We use this when scaling
	# The card or filling up its text
	card_labels["Name"] = find_node("Name")
	card_labels["Type"] = find_node("Type")
	card_labels["Tags"] = find_node("Tags")
	card_labels["Description"] = find_node("Description")
	card_labels["Cost"] = find_node("Cost")
	card_labels["Power"] = find_node("Power")

	# These set the max size of each label. This is used to calculate how much
	# To shrink the font when it doesn't fit in the rect.
	card_label_min_sizes["Name"] = Vector2(CFConst.CARD_SIZE.x - 4, 20)
	card_label_min_sizes["Type"] = Vector2(CFConst.CARD_SIZE.x - 4, 20)
	card_label_min_sizes["Tags"] = Vector2(CFConst.CARD_SIZE.x - 4, 17)
	card_label_min_sizes["Description"] = Vector2(CFConst.CARD_SIZE.x - 4, 20)
	card_label_min_sizes["Cost"] = Vector2(16,16)
	card_label_min_sizes["Power"] = Vector2(16,16)

	# This is not strictly necessary, but it allows us to change
	# the card label sizes without editing the scene
	for l in card_label_min_sizes:
		card_labels[l].rect_min_size = card_label_min_sizes[l]

	# This stores the maximum size for each label, when the card is at its
	# standard size.
	# This is multiplied when the card is resized in the viewport.
	for label in card_labels:
		match label:
			"Cost","Power":
				original_font_sizes[label] = 20
			"Description":
				original_font_sizes[label] = 20
			"Teaching":
				original_font_sizes[label] = 28
			_:
				original_font_sizes[label] = 20
