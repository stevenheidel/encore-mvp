@load_mixpanel = ->
  
  $("#facebooklogin a").click ->
    mixpanel.track "Clicked 'Log in with Facebook'"

  $("#concertheader .setlist").click ->
    mixpanel.track "Clicked 'Setlist'"

  $("#concertheader .backred").click ->
    mixpanel.track "Clicked 'Back' from Setlist"

  $("#jPanelMenu-menu a").click ->
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