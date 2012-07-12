class window.Chat
	constructor: ->
		@input = document.getElementById('chat')
		@input.addEventListener 'keydown', @keyDown, false

	showWindow: ->
		@input.value = ''
		@input.style.display = 'block'
		@input.focus()

	hideWindow: ->
		@input.blur()
		@input.style.display = 'none'

	sendMessage: ->
		game.player.displayMessage @input.value
		client.sendMessage @input.value

	receiveMessage: (message) ->
		li = document.createElement 'li'
		date = new Date()
		li.innerText = li.textContent = "#{date.getHours()}:#{date.getMinutes()}:#{date.getSeconds()} - #{message}"
		document.getElementById('chat-log').appendChild(li)
		li.scrollIntoView()

	keyDown: (e) =>
		e.stopPropagation()
		if e.keyCode is Key.KEYS.enter
			@sendMessage()
			@hideWindow()
		else if e.keyCode is Key.KEYS.escape
			@hideWindow()
