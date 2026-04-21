extends Control



func _on_iniciar_jogo_pressed() -> void:
	await get_tree().create_timer(0.4).timeout
	get_tree().call_deferred("change_scene_to_file","res://cenas/cena 2.tscn")
	return

func _on_sair_do_jogo_pressed() -> void:
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()
	return
