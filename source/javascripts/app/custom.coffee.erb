# First rule of code club, make it work
# Second rule, make it pretty
window.SplashController = ->
  @settings = {
    quotes: [
      {
        desktopImage: '<%= splash_path "paris-eiffel-tower.jpg" %>'
        mobileImage: '<%= splash_path "paris-eiffel-tower-mobile.jpg" %>'
        quote: "Ride a motorcycle throughout Europe"
        citation: "Christian P, Chicago IL"
      },
      {
        desktopImage: '<%= splash_path "climbing.jpg" %>'
        mobileImage: '<%= splash_path "climbing-mobile.jpg" %>'
        quote: "Track wild lemurs in Madagascar"
        citation: "Carolyn C, Chicago IL"
      }
      {
        desktopImage: '<%= splash_path "para-sailing.jpg" %>'
        mobileImage: '<%= splash_path "para-sailing-mobile.jpg" %>'
        quote: "Visit Australia"
        citation: "Kevin S, Chicago IL"
      },
      {
        desktopImage: '<%= splash_path "canoe.jpg" %>'
        mobileImage: '<%= splash_path "canoe-mobile.jpg" %>'
        quote: "Learn to kayak"
        citation: "Zeke B, Chicago IL"
      }
    ]
    currentQuoteNumber: 0
    $quote: $(".splash-area .goal-quote")
    $citation: $(".splash-area .goal-quote-cite")
    $splash: $(".splash-area")
    mobileBreak: 600
    delay: 8000
  }

  @currentQuote = =>
    return @settings.quotes[@settings.currentQuoteNumber]

  @updateQuote = =>
    $(@settings.$quote).html("#{@currentQuote()['quote']}")

  @updateCitation = =>
    $(@settings.$citation).html("#{@currentQuote()['citation']}")

  @updateImage = (skipFade = false) =>
    if @isMobile()
      image = @currentQuote()['mobileImage']
    else
      image = @currentQuote()['desktopImage']

    if skipFade
      $(@settings.$splash).backstretch(image)
    else
      $(@settings.$splash).backstretch(image, {fade: 800})

  @isMobile = =>
    return $("body").width() <= @settings.mobileBreak

  @updateSplashArea = =>
    @advanceCurrentQuoteNumber()
    @updateImage()
    @updateQuote()
    @updateCitation()
    return true

  @advanceCurrentQuoteNumber = =>
    if @settings.currentQuoteNumber < @settings.quotes.length - 1
      @settings.currentQuoteNumber++
    else
      @settings.currentQuoteNumber = 0

    return @settings.currentQuoteNumber

  # Initial set-up
  @updateImage(true)
  @updateQuote()
  @updateCitation()
  window.setInterval(@updateSplashArea, @settings.delay)

  return this


splash = new SplashController()
