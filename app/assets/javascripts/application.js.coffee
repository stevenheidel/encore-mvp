#= require jquery
#= require jquery_ujs

#= require jquery.mobile
#= require jquery.jpanelmenu

#= require sync

#= require encore/encore
#= require encore/mixpanel

# Equivalent to jQuery document.ready
$(document).bind "pageinit", ->

  load_jpanel()
  load_hearts()
  load_signup_form()

  load_mixpanel()