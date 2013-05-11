# stolen and modified from https://gist.github.com/kamranzafar/3136584
`
  var toast=function(msg){
    $("#toast").remove();

    $("<div id='toast' class='ui-loader ui-overlay-shadow ui-body-e ui-corner-all'><h3 style='margin:0'>"+msg+"</h3></div>")
    .css({ display: "block", 
      opacity: 0.90, 
      position: "fixed",
      padding: "10px",
      "text-align": "center",
      left: ($(window).width() - 284)/2,
      width: "284px",
      top: "50px" })
    .appendTo( $.mobile.pageContainer ).delay( 1500 )
    .on("click", function() {
      $(this).remove();
      $.mobile.changePage(window.location.href,{
        allowSamePageTransition : true,
        reloadPage: true
      });
    });
  }
`

@load_pusher_posts = ->
  posts_data = $.parseJSON $("#posts-data").html() if $("#posts-data").html()
  concert_id = posts_data?.concert_id

  num_posts = 0
  $("#toast").remove();

  channel = pusher.subscribe("channel_concert_" + concert_id)
  channel.bind "new_post", (data) ->
    num_posts += 1
    toast "Click to view " + num_posts + " new posts"