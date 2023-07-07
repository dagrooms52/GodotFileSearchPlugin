extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print('Test dir search')
	test_dir_not_exists()
	
	print('test double slash')
	test_res_double_slash_not_tripled()
	
	print('test shallow search')
	test_md_found_shallow()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func test_dir_not_exists():
	var txt_files = FileSearch.search_dir('res://', "*.txt", true)
	for file in txt_files:
		print('File found: %s' % file)

func test_res_double_slash_not_tripled():
	var files = FileSearch.search_dir('res://', "*.gd", true)
	assert(len(files) >= 1)
	assert(not files[0].contains('///'))

func test_md_found_shallow():
	var files = FileSearch.search_dir('test_search_files', "*.md")
	assert(len(files) == 1)
