@load_mixpanel = ->
  
  mixpanel.track_links "#facebooklogin a", "Clicked 'Log in with Facebook' from default profile"

  mixpanel.track_links "#facebookPopup a", "Clicked 'Log in with Facebook' from popup"

  $("#concertheader .setlist").click ->
    mixpanel.track "Clicked 'Setlist'"

  $("#concertheader .backred").click ->
    mixpanel.track "Clicked 'Back' from Setlist"

  $("#menu a").click ->
    mixpanel.track "Clicked menu link", {
      link: $(this).text()
    }

  $("#concert-list a").click ->
    mixpanel.track "Viewed concert from profile", {
        concert_name: $(this).children("h3").text()
    }

  $("#deal-list a").click ->
    mixpanel.track "Clicked on a deal", {
      deal_name: $(this).children("h2").text()
    }

  $("#setlist-list a").click ->
    mixpanel.track "Clicked on a setlist", {
      setlist_name: $(this).children("h2").text()
    }

  $("#concertlistings-list a").click ->
    mixpanel.track "Clicked on a concert list", {
      setlist_name: $(this).children("h2").text()
    }

  $("#infobutton").click ->
    mixpanel.track "Clicked the info button"

  # only on the homepage, not on the live stream page
  if $.mobile.path.parseUrl($.mobile.urlHistory.getActive().url).pathname == '/'
    mixpanel.track "Viewed Home Page"