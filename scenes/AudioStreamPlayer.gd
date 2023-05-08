extends AudioStreamPlayer

var songs = ["BWV_1043.mp3", "Hungarian Dance no. 5 (Brahms).mp3", "Solomon, HWV 67 (Handel, George Frideric).mp3", "Symphony 40 Mozart.mp3", "Violin Concerto No. 1 in A minor (Bach).mp3"]
var last_song = -1

func play_random_song():
	var next_song = randi() % songs.size()
	if next_song == last_song:
		next_song = (next_song + 1) % songs.size()
	last_song = next_song
	var song_path = "res://Música/In-Game/" + songs[next_song]
	stream = load(song_path)
	play()

func _ready():
	songs.shuffle()
	play_random_song()

func _on_finished():
	play_random_song()
