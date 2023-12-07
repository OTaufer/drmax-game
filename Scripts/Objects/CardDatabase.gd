enum {card1, card2}

const ROLES_IMAGES = {
	'init': 'card.png',
	'po': 'card.png',
	'ceo': 'card.png'
}

# image, text, stats for accept (for delete are stats inverted)
const DATA = {
	'card1': [ROLES_IMAGES['po'], "Your group head of product technology came with a request to migrate sql databases to Mongo.", [40, 40, -20, -20]],
	'card2': [ROLES_IMAGES['ceo'], "Your Group Head of Product Management & Delivery came in needing to implement KPIs in the company.", [40, 40, -20, -20]],
	'card3': [ROLES_IMAGES['ceo'], "Your process manager has decided to implement LESS.", [40, 40, -20, -20]],
	'card4': [ROLES_IMAGES['po'], "Catalog product owner has decided to exclude pricing from Magento.", [40, 40, -20, -20]]
}

const INIT_CARD = {'welcome': [ROLES_IMAGES['po'], "Welcome in the game", [0, 0, 0, 0]]}
