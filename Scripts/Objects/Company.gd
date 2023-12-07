extends Object

# Define the Company class with four attributes
class_name Company

var money: float
var employee_satisfaction: float
var investor_satisfaction: float
var market_position: float

# Constructor for the Company class
func _init(_money: float, _employee_satisfaction: float, _investor_satisfaction: float, _market_position: float):
	set_money(_money)
	set_employee_satisfaction(_employee_satisfaction)
	set_investor_satisfaction(_investor_satisfaction)
	set_market_position(_market_position)

# Setter function to enforce limits on money
func set_money(value: float):
	money = clamp(value, -10, 10)

# Setter function to enforce limits on employee satisfaction
func set_employee_satisfaction(value: float):
	employee_satisfaction = clamp(value, -10, 10)

# Setter function to enforce limits on investor satisfaction
func set_investor_satisfaction(value: float):
	investor_satisfaction = clamp(value, -10, 10)

# Setter function to enforce limits on market position
func set_market_position(value: float):
	market_position = clamp(value, -10, 10)

# Additional functions can be added as needed
