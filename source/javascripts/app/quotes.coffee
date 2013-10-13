# File for the homepage quote carousel

# When the document is ready, 
$ ->
  # Timer for quotes slides
  window.setInterval(advanceQuote, 6000)
  $(window).bind('resize', quotesListHeightTimerStart)

advanceQuote = ->
  $quotesList = $(".goal-quotes.list")
  $currentQuote = $($quotesList).find(".current")

  $nextSlide = ->
    $next = $($quotesList).find(".current").next()
    if $next.length > 0
      return $next
    else
      return $($quotesList).find("li").first()

  # The height of the container element will be locked
  $($quotesList).css("min-height", $($currentQuote).css("height"))

  # an animation end event listener will be added to the new slide
  $($nextSlide()).bind('webkitAnimationEnd', resetQuotes)
  $($nextSlide()).bind('animationend', resetQuotes)
  
  # the animations will be triggered
  $($nextSlide()).addClass("next")
  $($currentQuote).addClass("previous").removeClass("current")
  

resetQuotes = ->
  $quotesList = $(".goal-quotes.list")
  $currentQuote = $($quotesList).find(".next")

  # the new slide will become the current slide
  $($currentQuote).addClass("current").removeClass("next")

  # remove the class from the previous slide
  $($quotesList).find(".previous").removeClass("previous")

  # the height of the container will be unlocked
  $($quotesList).css("min-height", $($currentQuote).css("height"))

  # the animation event listener will be removed
  $($currentQuote).unbind('webkitAnimationEnd')
  $($currentQuote).unbind('animationend')


quotesListHeightTimerStart = ->
  window.clearTimeout(quotesListHeightTimer);
  quotesListHeightTimer = window.setTimeout( quotesListHeightAdjust, 300 );

quotesListHeightAdjust = ->
  $quotesList = $(".goal-quotes.list")
  $currentQuote = $($quotesList).find(".current")
  $($quotesList).css("min-height", $($currentQuote).css("height"))
