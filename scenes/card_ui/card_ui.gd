class_name CardUI
extends Control

#定义一个信号
signal reparent_requested(which_card_ui: CardUI)

@onready var color: ColorRect = $Color
@onready var state: Label = $State
