# File for the homepage quote carousel

# When the document is ready,
$ ->
  # Timer for quotes slides
  window.quoteTimer = window.setTimeout(advanceQuote, 3000)
  $(window).bind('resize', quotesListHeightTimerStart)

  # an animation end event listener will be added to the new slide
  $(".goal-quotes.list li").bind('webkitAnimationEnd', resetQuotes).bind('animationend', resetQuotes)

advanceQuote = ->
  window.clearTimeout(window.quoteTimer)
  $quotesList = $(".goal-quotes.list")
  $currentQuote = $($quotesList).find(".current")

  $nextSlide = ->
    $next = $($currentQuote).next()
    if $next.length > 0
      return $next
    else
      return $($quotesList).find("li").first()

  # The height of the container element will be locked
  $($quotesList).css("min-height", $($currentQuote).css("height"))

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

  window.quoteTimer = window.setTimeout(advanceQuote, 3000)




quotesListHeightTimerStart = ->
  window.clearTimeout(quotesListHeightTimer);
  quotesListHeightTimer = window.setTimeout( quotesListHeightAdjust, 300 );

quotesListHeightAdjust = ->
  $quotesList = $(".goal-quotes.list")
  $currentQuote = $($quotesList).find(".current")
  $($quotesList).css("min-height", $($currentQuote).css("height"))
