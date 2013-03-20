color = [
	"#000000" # black
	"#ffffff" # white
	"#ff0000" # red
	"#00ff00" # green
	"#0000ff" # blue
	"#ffff00" # yellow
	"#00ffff" # cyan
	"#ff00ff" # purple
]

# start with white background
white = "#ffffff"
document.body.style.backgroundColor = white

colorid = -1
next_color = ->
	colorid++
	if colorid == color.length
		# all color has been tested, restart again
		colorid = -1
		$('#content').removeClass("invisible")
		$('#done').removeClass("invisible")
		document.body.style.backgroundColor = white
		return
	else if colorid == 0
		$('#content').addClass("invisible")
		$('#done').addClass("invisible")
	document.body.style.backgroundColor = color[colorid]
	return

# $.mobile.loadingMessage = ""
$(document).on('pageinit', ->
	# hack to hide jquery mobile loading message
	# the global configuration does not work for me
	$(".ui-loader").addClass("invisible")
	$("body").on("tap", ->
		next_color()
		return
	)
)
