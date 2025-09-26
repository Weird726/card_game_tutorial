extends CardState

#正确处理状态的过程
func enter() -> void:
	#改变颜色和文本内容,方便进行调试来确认正常工作
	card_ui.color.color = Color.ORANGE
	card_ui.state.text = "CLICKED"
	card_ui.drop_point_detector.monitoring = true

func on_input(event: InputEvent) -> void:
	#判断事件是否是鼠标的移动状态
	if event is InputEventMouseMotion:
		#从点击状态转换到拖拽状态
		transition_requested.emit(self, CardState.State.DRAGGING)
