extends CanvasLayer

var drawReady = true
var drawReadyTime = 0
var drawTime = 8

func _ready():
	EventBus.connect("health_player_update", self, "_update_health")
	EventBus.connect("drawSummoned", self, "on_draw_summon")
	
	$DrawTimerBar.value = 100

func _process(delta):
	if !drawReady && $DrawTimerBar.value < 100:
		$DrawTimerBar.value += delta / drawTime * 100
	elif !drawReady && $DrawTimerBar.value == 100:
		$DrawTimerBar.value = 0
		drawReady = true
		drawReadyTime = delta
	elif drawReadyTime > 0.5 && $DrawTimerBar.value == 100:
		$DrawTimerBar.value = 0
		drawReadyTime = 0
	elif drawReadyTime > 0.5:
		$DrawTimerBar.value = 100
		drawReadyTime = 0

	drawReadyTime += delta

	if drawReady:
		EventBus.emit_signal("drawReady")

func _update_health(var health):
	$HPLabel.text = str(health)

func on_draw_summon():
	if drawReady:
		$CardList.show()
		$CardSel.show()
		$ButtonPanel.show()
		EventBus.emit_signal("disablePlayerInput", true)

func hide_draw():
	$CardList.hide()
	$CardSel.hide()
	$ButtonPanel.hide()
	$DrawTimerBar.value = 0
	drawReady = false
	EventBus.emit_signal("disablePlayerInput", false)

func _on_StartButton_pressed():
	hide_draw()
	EventBus.emit_signal("drawStart")

func _on_DiscardButton_pressed():
	hide_draw()
	EventBus.emit_signal("drawDiscard")
