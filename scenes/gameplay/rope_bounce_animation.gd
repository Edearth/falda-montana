extends Line2D

func shit(target: Vector2):
	points[1] = target

func hit(position: Vector2):
	points[1] = Vector2(position.x, 0)
	var tween := create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_ELASTIC)
	tween.tween_method(self.shit, Vector2(300,-80), points[1], .5)
