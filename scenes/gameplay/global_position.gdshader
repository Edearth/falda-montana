shader_type canvas_item;

uniform vec2 node_size = vec2(400.0, 400.0);

varying vec2 vert;

void vertex(){
	vert = VERTEX;
}

void fragment() {
	vec2 full_uv = vert/node_size;
	COLOR.rgb = vec3(full_uv, 0.0);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
