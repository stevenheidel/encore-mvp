// Equivalent to jQuery 
$(document).bind('pageinit', function() {

  // Turn on jPqanel Menu and fix for Android
  var jPM = jPM || $.jPanelMenu({
    beforeOpen: function() {
      $("#menu-trigger").removeClass("menu-trigger");
    },
    afterClose: function() {
      $("#menu-trigger").addClass("menu-trigger");
    },
    animation: true
  });
  jPM.off();
  jPM.on();

  // Heart pics on stream page
  $('.heartpic').click(function(event) {
    $.post("/favourite/" + event.target.id, function(data) {
      $("#" + event.target.id).toggleClass('on');
    });
    return false;
  });

  // Sign-up popup code
  $("#signupForm").submit(function(event) {
    $.post("/signup", $("#signupForm").serialize(), function(data) {
      $("#popupLogin").popup('close');
      $("#addmoretext").text("Thanks for signing up!");
      $("#signupbutton").hide();
    });
    return false;
  });

});