extends Resource
class_name BallData

@export var position: Vector2
@export var color: Color

static func create(pos: Vector2) -> BallData:
	var data := BallData.new()
	data.position = pos
	data.color = get_rand_color()
	return data

static func get_rand_color() -> Color:
	match randi_range(0, 3) :
		0:
			return Color.RED
		1:
			return Color.BLUE
		2:
			return Color.GREEN
		3:
			return Color.YELLOW
	
	return Color.WHITE
