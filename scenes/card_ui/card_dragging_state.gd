extends CardState

func enter() -> void:
	var ui_layer := get_tree().get_first_node_in_group("ui_layer")
	#判断检查是否存在这样一个节点
	if ui_layer:
		card_ui.reparent(ui_layer)
	
	#调整父化节点位置并改变卡牌状态（颜色与文本)
	card_ui.color.color = Color.NAVY_BLUE
	card_ui.state.text = "DRAGGING"

func on_input(event: InputEvent) -> void:
	#判断鼠标的输入状态是否为真,并赋值
	var mouse_motion := event is InputEventMouseMotion
	#设置一个名为cancel标志位,确认是否取消操作
	var cancel = event.is_action_pressed("right_mouse")
	#判断设置状态的选项
	var confirm = event.is_action_released("left_mouse") or event.is_action_pressed("left_mouse")
	
	#做一些处理，鼠标移动处理，更新卡片的全局位置,使其卡片跟随鼠标移动
	if mouse_motion:
		#轴心偏移量 (pivot offset)
		card_ui.global_position = card_ui.get_global_mouse_position() - card_ui.pivot_offset
	
	#如果取消了鼠标拖拽操作，返回基础状态(信号发出返回)
	if cancel:
		transition_requested.emit(self, CardState.State.BASE)
	elif  confirm:
		#标记已处理，防止以外获取新的卡片
		get_viewport().set_input_as_handled()
		#请求从拖拽状态转换到释放状态
		transition_requested.emit(self, CardState.State.RELEASED)
