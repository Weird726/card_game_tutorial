class_name CardState
extends Node

#用于状态设置的枚举
enum State {BASE, CLICKED, DRAGGING, AIMING, RELEASED}

#卡牌状态信号
signal transition_requested(from: CardState, to: State)

#导出变量，编辑器中为节点分配状态
@export var state: State

#引用UI状态来获取关于UI的一切操作
var card_ui: CardUI

#进入状态
func enter() -> void:
	pass

#退出状态
func exit() -> void:
	pass

#回调函数输入事件
func on_input(_event: InputEvent) -> void:
	pass

#回调函数分配指南输入事件
func on_gui_input(_event: InputEvent) -> void:
	pass

#鼠标点击进入事件
func on_mouse_entered() -> void:
	pass

#鼠标松开推出事件
func on_mouse_exited() -> void:
	pass
