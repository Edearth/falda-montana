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
	if collision_shape_2d != null:
		collision_shape_2d.shape.set_b(new_position)
	line_2d.points[2] = new_position
	$Sprite2D2.position = new_position

func stop_editing():
	is_editing = false

func hit(new_position: Vector2, normal: Vector2):
	#$Line2D.points[1] = $Line2D.points[2] / 2
	$Line2D.points[1] = new_position - position
	var tween := create_tween()
	tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween.tween_method(self.lerp_line_middle, $Line2D.points[1] + normal * 100, $Line2D.points[2] / 2, .5)
	var tween2 := create_tween()
	tween2.set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_SINE)
	tween2.tween_property(self, "modulate", Color(1, 1, 1, 0), .5)
	await get_tree().create_timer(.3).timeout
	if get_node_or_null("CollisionShape2D") != null:
		$CollisionShape2D.queue_free()
	await get_tree().create_timer(.3).timeout
	queue_free()

func lerp_line_middle(target: Vector2):
	$Line2D.points[1] = target
	
