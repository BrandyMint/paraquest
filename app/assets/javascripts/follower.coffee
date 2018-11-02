FOLLOWER_QUERY = '[data-follower="mouse"]'
WRAPPER_QUERY = '[data-slideWrapper="game"]'

follower = undefined
wrapper = undefined
$wrapper = undefined

positionElement = (event) =>
  unless follower && wrapper
    return

  wrapperPosition = $wrapper.position()

  left = event.clientX - wrapperPosition.left + window.scrollX
  top = event.clientY - wrapperPosition.top + window.scrollY

  left = 0 if left < 0
  top = 0 if top < 0

  left = $wrapper.width() if left > $wrapper.width()
  top = $wrapper.height() if top > $wrapper.height()

  follower.style.left = left + 'px'
  follower.style.top = top + 'px'

setFollower = ->
  follower = document.querySelector FOLLOWER_QUERY
  wrapper = document.querySelector WRAPPER_QUERY
  $wrapper = $ wrapper

  if wrapper
    wrapper.onmousemove = (event) =>
      _event = event
      setTimeout =>
        positionElement(_event)
      , 1

document.addEventListener "turbolinks:load", setFollower
