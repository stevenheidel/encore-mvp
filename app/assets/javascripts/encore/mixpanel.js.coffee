@load_mixpanel = ->
  
  mixpanel.track_links "#facebooklogin a", "Clicked 'Log in with Facebook'"

  mixpanel.track_links "#concertheader .setlist", "Clicked 'Setlist'"

  mixpanel.track_links "#concertheader .backred", "Clicked 'Back' from Setlist"

  mixpanel.track_links "#jPanelMenu-menu a", "Clicked menu link", (ele) ->
    {link: $(ele).text()}

  mixpanel.track_links "#concert-list a", "Viewed concert from profile", (ele) ->
    {concert_name: $(ele).children("h3").text()}