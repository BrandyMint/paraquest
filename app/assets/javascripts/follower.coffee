follower = undefined

mouseX = (event) =>
  return event.clientX

mouseY = (event) =>
  return event.clientY

positionElement = (event) =>
  unless follower
    return

  $wrapper = $('[data-slideWrapper="game"]')

  if $wrapper.length == 0
    return

  mouse = {
    x: mouseX(event)
    y: mouseY(event)
  }
  wrapperPosition = $('[data-slideWrapper="game"]').position()
  follower.style.top = mouse.y - wrapperPosition.top + window.scrollY + 'px'
  follower.style.left = mouse.x - wrapperPosition.left + window.scrollX + 'px'

setFollower = ->
	follower = document.querySelector('[data-follower="mouse"]')

setupTimer = ->
	timer = false
	window.onmousemove = init = (event) =>
		_event = event
		timer = setTimeout =>
			positionElement(_event)
		, 1

document.addEventListener "turbolinks:load", setFollower
$( document ).ready setupTimer
