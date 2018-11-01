follower = undefined

mouseX = (event) =>
  return event.clientX

mouseY = (event) =>
  return event.clientY

positionElement = (event) =>
  mouse = {
    x: mouseX(event)
    y: mouseY(event)
  }
  wrapperPosition = $('[data-slideWrapper="game"]').position()
  follower.style.top = mouse.y - wrapperPosition.top + 'px'
  follower.style.left = mouse.x - wrapperPosition.left + 'px'

setup = ->
	follower = document.querySelector('[data-follower="mouse"]')

	timer = false
	window.onmousemove = init = (event) =>
		_event = event
		timer = setTimeout =>
			positionElement(_event)
		, 1

document.addEventListener "turbolinks:load", setup
