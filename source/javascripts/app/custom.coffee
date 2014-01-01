# First rule of code club, make it work
# Second rule, make it pretty
window.SplashController = ->
  @settings = {
    imagesFolder: "/images/homepage-background/"
    quotes: [
      {
        desktopImage: "paris-eiffel-tower.jpg"
        mobileImage: "paris-eiffel-tower-mobile.jpg"
        quote: "Ride a motorcycle throughout Europe"
        citation: "Christian P, Chicago IL"
      },
      {
        desktopImage: "climbing.jpg"
        mobileImage: "climbing-mobile.jpg"
        quote: "Track wild lemurs in Madagascar"
        citation: "Carolyn C, Chicago IL"
      }
      {
        desktopImage: "para-sailing.jpg"
        mobileImage: "para-sailing-mobile.jpg"
        quote: "Visit Australia"
        citation: "Kevin S, Chicago IL"
      },
      {
        desktopImage: "canoe.jpg"
        mobileImage: "canoe-mobile.jpg"
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
      $(@settings.$splash).backstretch(@settings.imagesFolder + image)
    else
      $(@settings.$splash).backstretch(@settings.imagesFolder + image, {fade: 800})

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


# <%
#   max = {
#     image: "max-chopovsky.jpg",
#     name: "Max C"
#   }
#   carolyn = {
#     image: "carolyn-chandler.jpg",
#     name: "Carolyn C"
#   }
#   christian = {
#     image: "christian-picciolini.jpg",
#     name: "Christian P"
#   }
#   ezekiel = {
#     image: "ezekiel-binion.jpg",
#     name: "Ezekiel B"
#   }
#   kevin = {
#     image: "kevin-solorio.jpg",
#     name: "Kevin S"
#   }
# %>

# <!--
#         <%= partial("partials/quote", locals: {
#           class_name: "current",
#           person: ezekiel,
#           quote: "See the Seven Wonders of the World"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: christian,
#           quote: "Play golf at St. Andrews in Scotland"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: carolyn,
#           quote: "Travel to China to see the Great Wall, Terra Cotta soldiers, and Hong
# Kong"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: max,
#           quote: "Open for Armin Van Buuren"
#         }) %>
#          <%= partial("partials/quote", locals: {
#           person: kevin,
#           quote: "Get my instrument rating (aviation)"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: ezekiel,
#           quote: "Canoe the Chicago River"
#         }) %>

#         <%= partial("partials/quote", locals: {
#           person: christian,
#           quote: "Ride a motorcycle throughout Europe"
#         }) %>

#         <%= partial("partials/quote", locals: {
#           person: carolyn,
#           quote: "Find design inspiration in Japan"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: max,
#           quote: "Direct a music video played on TV"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: ezekiel,
#           quote: "Learn IOS development"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: christian,
#           quote: "Take batting practice at Fenway Park"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: kevin,
#           quote: "Attend a Stanley Cup Game"
#         }) %>


#         <%= partial("partials/quote", locals: {
#           person: carolyn,
#           quote: "Walk the Walk of Fame in Los Angeles"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: christian,
#           quote: "Visit the Great Pyramids of Giza"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: max,
#           quote: "Eat at Sukiyabashi Jiro"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: kevin,
#           quote: "Start a successful company"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: ezekiel,
#           quote: "Create a camp that makes design and technology fun for underprivileged youth"
#         }) %>

#         <%= partial("partials/quote", locals: {
#           person: carolyn,
#           quote: "Track wild lemurs in Madagascar"
#         }) %>

#         <%= partial("partials/quote", locals: {
#           person: kevin,
#           quote: "Tour Europe"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: max,
#           quote: "Run a marathon"
#         }) %>

#         <%= partial("partials/quote", locals: {
#           person: christian,
#           quote: "Attend a Native American Sweat Lodge Ceremony"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: carolyn,
#           quote: "See the Earth from space"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: kevin,
#           quote: "Visit Australia"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: ezekiel,
#           quote: "Buy my first home"
#         }) %>
#         <%= partial("partials/quote", locals: {
#           person: max,
#           quote: "Fly a jet"
#         }) %>
#  -->
