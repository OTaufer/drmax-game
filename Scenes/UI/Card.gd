extends MarginContainer

var cardDatabase = preload("res://Scripts/Objects/CardDatabase.gd")

var cardName
var cardStats: Stats
	
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
