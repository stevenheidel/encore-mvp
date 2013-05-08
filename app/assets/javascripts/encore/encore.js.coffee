# Turn on jPanel menu
@load_jpanel = ->
  # Fix for Android
  jPM = jPM or $.jPanelMenu(
    beforeOpen: ->
      $("#menu-trigger").removeClass "menu-trigger"
      $('.ui-popup').popup('close') # close all popups so they don't reappear again

    afterClose: ->
      $("#menu-trigger").addClass "menu-trigger"

    animation: true
  )
  jPM.off()
  jPM.on()

  # Close menu on menu links
  $("#jPanelMenu-menu a").click ->
    jPM.close()
  
# Heart pics on stream page
@load_hearts = ->
  # Get JSON Data
  posts_data = $.parseJSON $("#posts-data").html() if $("#posts-data").html()
  
  $(".heartless").each (i, obj) ->
    $(obj).addClass("heartpic") # enable hearts if logged in
    $(obj).addClass("on") if parseInt($(obj).attr('id')) in posts_data.hearts # selected ones

  # add post click event
  $(".heartpic").click (event) ->
    if posts_data?.logged_in
      $("#" + event.target.id).toggleClass "on"
      mixpanel.track "Favourited a post", {"post_id": event.target.id}

      $.post "/favourite/" + event.target.id
    else
      $("#facebookPopup").popup("open")

    false
  
@load_signup_form = ->
  # Sign-up popup code
  $("#signupForm").submit ->
    $.post "/signup", $("#signupForm").serialize(), ->
      $("#popupLogin").popup("close")
      $("#addmoretext").text "Thanks for signing up!"
      $("#signupbutton").hide()
      
      mixpanel.track("Signed up for beta")
    false