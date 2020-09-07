extends CanvasLayer

var drawReady = false
var drawReadyTime = 0
var drawTime = 8

func _ready():
	EventBus.connect("health_player_update", self, "_update_health")

func _process(delta):
	if $DrawTimerBar.value < 100 && !drawReady:
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

func _update_health(var health):
	$HPLabel.text = str(health)
	print("new health", health)
