# Must be outside to reference everywhere
jPM = undefined

# Equivalent to jQuery 
$(document).bind "pageinit", ->
  
  # Turn on jPqanel Menu and fix for Android
  jPM = jPM or $.jPanelMenu(
    beforeOpen: ->
      $("#menu-trigger").removeClass "menu-trigger"

    afterClose: ->
      $("#menu-trigger").addClass "menu-trigger"

    animation: true
  )
  jPM.off()
  jPM.on()
  
  # Heart pics on stream page
  # Get JSON Data
  posts_data = $.parseJSON $("#posts-data").html() if $("#posts-data").html()
  if posts_data?.logged_in
    $(".heartless").each (i, obj) ->
      $(obj).addClass("heartpic") # enable hearts if logged in
      $(obj).addClass("on") if parseInt($(obj).attr('id')) in posts_data.hearts # selected ones

  # add post click event
  $(".heartpic").click (event) ->
    $.post "/favourite/" + event.target.id, ->
      $("#" + event.target.id).toggleClass "on"
      mixpanel.track "Favourited a post", {"post_id": event.target.id}
    false
  
  # Sign-up popup code
  $("#signupForm").submit ->
    $.post "/signup", $("#signupForm").serialize(), ->
      $("#popupLogin").popup "close"
      $("#addmoretext").text "Thanks for signing up!"
      $("#signupbutton").hide()
    false