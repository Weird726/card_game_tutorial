class_name CardStateMachine
extends Node

#创建一个导出变量用于存储状态机的初始状态或起始状态
@export var initial_state: CardState

#设置两个状态变量
var current_state: CardState
var states := {}

#初始化函数
func init(card: CardUI) -> void:
	#遍历所有的子节点
	for child in get_children():
		#判断当前是否为卡牌状态类型
		if child is CardState:
			#如果是将其添加到所有状态字典中
			states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)
			child.card_ui = card
	
	if initial_state:
		initial_state.enter()
		current_state = initial_state

#输入事件回调函数
func on_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_input(event)

#判断输入事件回调函数
func on_gui_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_gui_input(event)

#鼠标进入事件
func on_mouse_entered() -> void:
	if current_state:
		current_state.on_mouse_entered()

#鼠标退出事件
func on_mouse_exited() -> void:
	if current_state:
		current_state.on_mouse_exited()

#从一个状态到另一个状态的转换(过渡状态)
func _on_transition_requested(from: CardState, to: CardState.State) -> void:
	#状态不匹配则表示发生了严重错误需要立即从状态中返回
	if from != current_state:
		return
		#从状态字典中获取新状态的引用
	var new_state: CardState = states[to]
	if not new_state:
		return
	#如果新状态存在就要退出当前状态
	if current_state:
		current_state.exit()
	#进入新状态
	new_state.enter()
	current_state = new_state
