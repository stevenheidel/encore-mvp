#= require jquery_ujs

#= require encore/encore
#= require encore/mixpanel
#= require encore/pusher

# Makes panel work for same page see https://github.com/jquery/jquery-mobile/issues/2529
$.mobile.changePage.defaults.allowSamePageTransition = true;
$.mobile.ignoreContentEnabled = true;

# Equivalent to jQuery document.ready
$(document).on "pageshow", '.ui-page', ->

  # Stupid hack to fix log out
  # http://www.channaly.info/redirect-sign-out-link-in-devise-rails3-with-jquery-mobile/
  `$(function(){
    $(document.body).delegate("form[action='/sign_out']",'submit',function(e){
      $(this).attr("data-ajax", "false");
    });
  });`

  load_hearts()
  load_signup_form()
  add_concert()

  load_mixpanel()

  load_pusher_posts()