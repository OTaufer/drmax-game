class_name Stats

var money: float
var employee: float
var investors: float
var market: float

var maxValue: int = 100
var minValue: int = 0

func _init(_money: float, _employee: float, _investors: float, _market: float):
	money = _money
	employee = _employee
	investors = _investors
	market = _market
	
func decreaseMoney(_money: float):
	money -= _money
	
	if (money < minValue):
		return false
	
	return true
	
func decreaseEmployee(_employee: float):
	employee -= _employee
	
	if (employee < minValue):
		return false
	
	return true
	
func decreaseInvestors(_investors: float):
	investors -= _investors
	
	if (investors < minValue):
		return false
		
	return true
	
func decreaseMarket(_market: float):
	market -= _market
	
	if (market < minValue):
		return false
		
	return true
	
func increaseMoney(_money: float):
	money += _money
	
	if (money > maxValue):
		return false
	
	return false
	
func increaseEmployee(_employee: float):
	employee += _employee
	
	if (employee > maxValue):
		return false
	
	return false
	
func increaseInvestors(_investors: float):
	investors += _investors
	
	if (investors > maxValue):
		return false
	
	return false
	
func increaseMarket(_market: float):
	market += _market
	
	if (market > maxValue):
		return false
	
	return false
	

