#= require jquery
#= require jquery_ujs

#= require jquery.mobile
#= require jquery.jpanelmenu

#= require encore/encore
#= require encore/mixpanel
#= require encore/pusher

# Equivalent to jQuery document.ready
$(document).bind "pageinit", ->

  load_jpanel()
  load_hearts()
  load_signup_form()

  load_mixpanel()

  load_pusher_posts()