$ ->
  $(".smiley").click ->
    logo = $(".smiley")
    logo.addClass("animated bounceOut")
    setTimeout (->
      logo.removeClass("animated bounceOut")
      return
    ), 5000
    return