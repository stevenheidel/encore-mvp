# Heart pics on stream page
@load_hearts = ->
  # Get JSON Data
  posts_data = $.parseJSON $("#posts-data").html() if $("#posts-data").html()

  $(".heartless").each (i, obj) ->
    $(obj).addClass("heartpic") # enable hearts
    $(obj).addClass("on") if parseInt($(obj).attr('id')) in posts_data.hearts # selected ones

    # add post click event
    $(obj).click (event) ->
      if posts_data?.logged_in
        $("#" + event.target.id).toggleClass "on"
        mixpanel?.track "Favourited a post", {"post_id": event.target.id}

        $.post "/favourite/" + event.target.id
      else
        mixpanel?.track "Attempted to favourite a post", {"post_id": event.target.id}
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


@add_concert = ->
  $("#addConcert").click ->
    #$("#facebooklogin").remove()

    $("#concert-list").slideUp 400, ->
      $("#addPage").slideDown()

    false

  $("#back").click ->
    $("#addPage").slideUp 400, ->
      $("#concert-list").slideDown()

    false