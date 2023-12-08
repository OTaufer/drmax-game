enum {card1, card2}

const ROLES_IMAGES = {
	'init': 'card.png',
	'po': 'card.png',
	'ceo': 'card.png',
	'arch': 'card.png',
	'ccm': 'card.png'
}
#Contact Centre Manager
# image, text, stats for accept (for delete are stats inverted)
const DATA = {
	'1': [ROLES_IMAGES['po'], "Your group head of product technology came with a request to migrate sql databases to Mongo.", [15, -20, 0, -10]],
	'2': [ROLES_IMAGES['ceo'], "Your Group Head of Product Management & Delivery came in needing to implement KPIs in the company.", [15, -15, 15, 5]],
	'3': [ROLES_IMAGES['ceo'], "Your process manager has decided to implement LESS.", [0, -20, 10, 10]],
	'4': [ROLES_IMAGES['po'], "Catalog product owner has decided to exclude pricing from Magento.", [-10, 15, -5, 15]],
	'5': [ROLES_IMAGES['arch'], "Architect needs you to finish connecting to SonarQ to meet its own KPIs.", [-20, -10, 10, 10]],
	'6': [ROLES_IMAGES['arch'], "Architect wants you to split the monolith.", [-20, 25, -20, 10]],
	'7': [ROLES_IMAGES['arch'], "Architect wants you to do multi-tenant architecture.", [-10, -25, 0, -5]],
	'8': [ROLES_IMAGES['arch'], "The architect wants to move from gitlab to azure devops..", [10, -20, 5, -10]],
	'9': [ROLES_IMAGES['arch'], "The contact center manager says they can't work, because the call centre administration is down. Will you send it to the dev teams to fix it?", [10, -20, 5, -10]],
}

const INIT_CARD = {'welcome': [ROLES_IMAGES['po'], "Welcome in the game", [0, 0, 0, 0]]}
