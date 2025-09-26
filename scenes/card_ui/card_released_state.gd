extends CardState

func enter() -> void:
	#初步阶段，更改颜色名称来表示释放状态已生效
	card_ui.color.color = Color.DARK_VIOLET
	card_ui.state.text = "RELEASED"
