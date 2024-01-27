extends StaticBody2D

@onready var collision_shape_2d = $CollisionShape2D
@onready var line_2d = $Line2D
var is_editing := true

func _ready():
	var new_shape = SegmentShape2D.new()
	collision_shape_2d.set_shape(new_shape)

func _process(delta):
	if is_editing:
		update_shape(get_global_mouse_position() - position)

func update_shape(new_position: Vector2):
	collision_shape_2d.shape.set_b(new_position)
	line_2d.points[2] = new_position
	$Sprite2D2.position = new_position

func stop_editing():
	is_editing = false

func hit(position: Vector2):
	queue_free()
