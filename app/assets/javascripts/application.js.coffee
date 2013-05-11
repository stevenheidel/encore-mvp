#= require jquery_ujs

#= require encore/encore
#= require encore/mixpanel
#= require encore/pusher

# Makes panel work for same page see https://github.com/jquery/jquery-mobile/issues/2529
$.mobile.changePage.defaults.allowSamePageTransition = true;

# Equivalent to jQuery document.ready
$(document).bind "pageinit", ->

  load_hearts()
  load_signup_form()

  load_mixpanel()

  load_pusher_posts()