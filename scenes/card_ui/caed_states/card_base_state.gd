extends CardState

#子节点准备完毕后才能知道父节点准备好了
func enter() -> void:
	#判断节点是否已在场景树中准备完毕
	if not card_ui.is_node_ready():
		await card_ui.ready
	
	#请求对CardUI进行重新父化
	card_ui.reparent_requested.emit(card_ui)
	#更改颜色
	card_ui.color.color = Color.WEB_GREEN
	#更改文本内容
	card_ui.state.text = "BASE"
	#重置卡片的旋转中心偏移量
	card_ui.pivot_offset = Vector2.ZERO

#输入事件的函数处理
func on_gui_input(event: InputEvent) -> void: 
	#判断是否按下鼠标左键
	if event.is_action_pressed("left_mouse"):
		#计算旋转中心偏移量
		card_ui.pivot_offset = card_ui.get_global_mouse_position() - card_ui.global_position
		#发出信号转换信号给状态机过渡到点击状态
		transition_requested.emit(self, CardState.State.CLICKED)   
