extends MarginContainer

var cardDatabase = preload("res://Scripts/Objects/CardDatabase.gd")

var cardName
var cardStats: Stats

var viewport_width
	
# Called when the node enters the scene tree for the first time.
func _ready():
	var cardImageControl = $CardImage
	var cardTextControl = $CardImage/BoxContainer/CardText
	var cardInfo 
	
	# please refactor me, i'm bullshit
	if cardName == "welcome":
		cardInfo = cardDatabase.INIT_CARD[cardName]
	else:
		cardInfo = cardDatabase.DATA[cardName]
	
	var cardImage = str("res://Assets/Images/",cardInfo[0])
	cardImageControl.texture = load(cardImage)
	cardTextControl.text = cardInfo[1]
	
	cardStats = Stats.new(cardInfo[2][0], cardInfo[2][1], cardInfo[2][2], cardInfo[2][3])
	
	# swipe support
	viewport_width = get_viewport_rect().size.x
	

var swipe_start_pos
var swipe_sensitivity = 0.7
var max_rotation = PI/20
var swipe_len = 0

func _input(ev):
	if ev is InputEventScreenTouch:
		if ev.pressed:
			swipe_start_pos = ev.position.x
		else:
			rotation = 0
		
	if ev is InputEventScreenDrag:
		swipe_len = (ev.position.x - swipe_start_pos) * swipe_sensitivity / viewport_width
		swipe_len = clamp(swipe_len, -max_rotation, max_rotation)
		rotation = swipe_len
		



	
