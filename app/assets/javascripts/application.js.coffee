#= require jquery
#= require jquery_ujs

#= require jquery.mobile
#= require jquery.jpanelmenu

#= require encore

#= require mixpanel

#= require sync

# Equivalent to jQuery document.ready
$(document).bind "pageinit", ->

  load_jpanel()
  load_hearts()
  load_signup_form()

  load_mixpanel()