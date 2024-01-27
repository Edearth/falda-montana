extends Line2D


func hit(position: Vector2, normal: Vector2):
	points[1] = Vector2(position.x, 0)
	var tween := create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_ELASTIC)
	tween.tween_method(self.lerp_line_middle, Vector2(300,-80), points[1], .5)

func lerp_line_middle(target: Vector2):
	points[1] = target
