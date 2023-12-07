extends Node2D

const card = preload("res://Scenes/UI/Card.tscn")
const cardDatabase = preload("res://Scripts/Objects/CardDatabase.gd")
const messageScene = preload("res://Scenes/UI/Message.tscn")

var moneyProgressBar: ProgressBar
var employeeProgressBar: ProgressBar
var investorsProgressBar: ProgressBar
var marketProgressBar: ProgressBar

var cardControl: CenterContainer

var companyStats: Stats

var minValue = 0
var maxValue = 100

var popup_instance

func _ready():
	moneyProgressBar = $GridContainer/Progress/MoneyControl/Money/ProgressBar
	employeeProgressBar = $GridContainer/Progress/EmployeeControl/Employee/ProgressBar2
	investorsProgressBar = $GridContainer/Progress/InvestorsControl/Investors/ProgressBar3
	marketProgressBar = $GridContainer/Progress/WorldControl/World/ProgressBar4
	
	cardControl = $GridContainer/CardControl
	
	companyStats = Stats.new(50, 50, 50, 50)
	
	moneyProgressBar.value = companyStats.money
	employeeProgressBar.value = companyStats.employee
	investorsProgressBar.value = companyStats.investors
	marketProgressBar.value = companyStats.market
	
	var cardNames = Array(cardDatabase.DATA.keys())
	cardNames = _shuffle_array(cardNames)
	
	for cardName in cardNames:
		var newCard = card.instantiate()
		newCard.cardName = cardName
		cardControl.add_child(newCard)
		
	var initCard = card.instantiate()
	initCard.cardName = "welcome"
	cardControl.add_child(initCard)

func _on_accept_pressed():
	_process_card(true)

func _on_decline_pressed():
	_process_card(false)
		
func _process_card(accepted: bool):
	var child = _getLastCard(cardControl)
	
	if child and child.get_parent():
		_updateStats(accepted, child.cardStats.money, child.cardStats.employee, child.cardStats.investors, child.cardStats.market)
		child.get_parent().remove_child(child)
		
	if companyStats.money > maxValue:
		_end_by_money(true)
		
	if companyStats.money < minValue:
		_end_by_money(false)
	
	if companyStats.employee > maxValue:
		_end_by_employee(true)
		
	if companyStats.employee < minValue:
		_end_by_employee(false)
		
	if companyStats.investors > maxValue:
		_end_by_investors(true)
		
	if companyStats.investors < minValue:
		_end_by_investors(false)
		
	if companyStats.market > maxValue:
		_end_by_market(true)
		
	if companyStats.market < minValue:
		_end_by_market(false)
		
func _updateStats(accepted: bool, money: float, employee: float, investors: float, market: float):
	if accepted:
		companyStats.increaseMoney(money)
		companyStats.increaseEmployee(employee)
		companyStats.increaseInvestors(investors)
		companyStats.increaseMarket(market)
	else:
		companyStats.decreaseMoney(money)
		companyStats.decreaseEmployee(employee)
		companyStats.decreaseInvestors(investors)
		companyStats.decreaseMarket(market)
	
	moneyProgressBar.value = companyStats.money
	employeeProgressBar.value = companyStats.employee
	investorsProgressBar.value = companyStats.investors
	marketProgressBar.value = companyStats.market
	
func _getLastCard(cardControl):
	return cardControl.get_child(cardControl.get_child_count()-1)

func _shuffle_array(array: Array) -> Array:
	var rng = RandomNumberGenerator.new()
	rng.randomize() # This ensures a different seed for each shuffle
	for i in range(array.size() - 1, 0, -1):
		var random_index = rng.randi_range(0, i)
		var temp = array[i]
		array[i] = array[random_index]
		array[random_index] = temp
	return array
	
func _end_by_money(max: bool):
	if max:
		_show_popup("Your company made too much money and threatened the multinational giants. You were bought by Google and liquidated.")
	else:
		_show_popup("You went bankrupt and were handed over to insolvency.")
		
func _end_by_employee(max: bool):
	if max:
		_show_popup("The employees were so happy that they stopped working and moved to Bali.")
	else:
		_show_popup("You pissed off the employees so much they went to work for Pilulka.")
		
func _end_by_investors(max: bool):
	if max:
		_show_popup("The investors saw so much potential in the company that they sold it.")
	else:
		_show_popup("You let the investors down. You've been replaced.")
	
func _end_by_market(max: bool):
	if max:
		_show_popup("Your market position was so strong that the antitrust authority liquidated you.")
	else:
		_show_popup("Your position in the market is so weak that it has eliminated you Benu.")
	
func _show_popup(message: String):
	var popup_instance = messageScene.instantiate()
	add_child(popup_instance)
	popup_instance.set_popup_text(message)
	popup_instance.show_popup()

