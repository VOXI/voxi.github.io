// Listeners and necessary setup
$(document).ready(function () {

  window.console.log("Window is ready.");
  $("#goal-form-advance-button").click(function(e) {
    e.preventDefault();
    if ($(this).hasClass("is-disabled") == false){
      Voxi.advanceGoalForm();
      Voxi.updatePanelPosition();
      Voxi.updateFormStructures();
      $("#goal-area-background").backstretch("pause");
    }
  });

  $("#goal-form-back-button").click(function(e) {
    e.preventDefault();
    Voxi.advanceGoalForm(true);
    Voxi.updatePanelPosition(true);
    Voxi.updateFormStructures();
  });

  $(".index .content-wrap").backstretch(Voxi.backgroundImages, {
    duration: 5000,
    fade: 1000
  }).css("background", "#f5f5f3");

});


var Voxi = {
  $goalPanels: $("#goal-panels"),
  backgroundImages: [
    "/images/homepage-background/climbing.jpg",
    "/images/homepage-background/golf.jpg",
    "/images/homepage-background/great-wall-china.jpg",
    "/images/homepage-background/dj.jpg",
    "/images/homepage-background/para-sailing.jpg",
    "/images/homepage-background/canoe.jpg",
    "/images/homepage-background/paris-eiffel-tower.jpg"
  ],
  /**
   * Returns the current position of the panel
   * @return {Number} Integer representing the current panel being viewed
   */
  panelPosition: function() {
    return parseFloat($(this.$goalPanels).attr("data-panel-position"));
  },

  /**
   * This method will advance the goal form. Animation should happen in CSS
   * @param  {boolean} reverseDirection Controls the direction the panels move
   * @return {void}
   */
  advanceGoalForm: function (reverseDirection) {
    reverseDirection = reverseDirection ? true : false;
    // Must account for auto setting and remove px from returned value
    var currentPos = $(Voxi.$goalPanels).css('left') == 'auto' ? 0 : parseFloat($(Voxi.$goalPanels).css('left').replace('px', ''));
    var panelWidth = $('.goal-panel').first().width();
    var newPos = reverseDirection ? currentPos + panelWidth + 40 : currentPos - panelWidth - 40;

    if (reverseDirection) {
      $(Voxi.$goalPanels).css('left', newPos);
    }
    else {
      $(Voxi.$goalPanels).css('left', newPos);
    }
  },

  /**
   * Updates the data attribute with the number of the visible goal panel (not o based)
   * @param  {boolean} decrease Setting this to true will decrease the slide number
   * @return {void}
   */
  updatePanelPosition: function (decrease) {
    decrease = decrease ? true : false;

    if (decrease) {
      $(Voxi.$goalPanels).attr("data-panel-position", parseFloat($(Voxi.$goalPanels).attr("data-panel-position")) - 1);
    }
    else {
      $(Voxi.$goalPanels).attr("data-panel-position", parseFloat($(Voxi.$goalPanels).attr("data-panel-position")) + 1);
    }
  },

  /**
   * Calls all update functions for buttons and form elements based on panel postion
   * @return {void} [description]
   */
  updateFormStructures: function () {
    this.updateBackButton();
    this.updateNextButton();
    this.updateGoalPanelHeight();
    this.updateGoalPanelVerticalPosition();
  },

  /**
   * Updates the height of the goal form container
   * @return {void}
   */
  updateGoalPanelHeight: function () {
    newHeight = $(".goal-panel").eq($(Voxi.$goalPanels).attr("data-panel-position") - 1).height();
    $('#goal-panels').css('height', newHeight);
  },

  updateGoalPanelVerticalPosition: function () {
    if (this.panelPosition() == 3) {
      $("#goal-form").css('margin-top', 150);
    }
    else {
      $("#goal-form").attr("style", "");
    }
  },

  /**
   * Updates the back button to display or hide based on the current slide
   * @return {void}
   */
  updateBackButton: function () {
    var $backButton = $("#goal-form-back-button");

    if ( this.panelPosition() == 1 || this.panelPosition() == 4 ) {
      $($backButton).addClass("is-hidden");
    }
    else {
      $($backButton).removeClass("is-hidden");
    }
  },

  /**
   * Updates the next button to display the correct text or hide based on the current slide
   * @return {void}
   */
  updateNextButton: function () {
    var $nextButton = $("#goal-form-advance-button");

    if (this.panelPosition() == 4) {
      $($nextButton).addClass("is-hidden");
    }
    else if (this.panelPosition() == 3) {
      $($nextButton).html("Submit");
    }
    else{
      $($nextButton).html("Next &rarr;");
    }
  }

}
