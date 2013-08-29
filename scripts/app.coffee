jQuery(document).ready ($) ->
  
  $("#full-width-slider").royalSlider
    arrowsNav: true
    loop: true
    keyboardNavEnabled: true
    controlsInside: false
    imageScaleMode: "fill"
    arrowsNavAutoHide: false
    autoScaleSlider: false
    autoScaleSliderWidth: false
    autoScaleSliderHeight: false
    controlNavigation: "bullets"
    thumbsFitInViewport: false
    navigateByClick: true
    startSlideId: 0
    autoPlay:
      # autoplay options go gere
      enabled: true
      pauseOnHover: false
      delay: 4000

    transitionType: "move"
    globalCaption: true
    deeplinking:
      enabled: true
      change: false
    # size of all images http://help.dimsemenov.com/kb/royalslider-jquery-plugin-faq/adding-width-and-height-properties-to-images
  
  # $.reveal
  #   animation: "fadeAndPop" #fade, fadeAndPop, none
  #   animationspeed: 900 #how fast animtions are
  #   closeonbackgroundclick: true #if you click background will modal close?
  #   dismissmodalclass: "close-reveal-modal" #the class of a button or element that will close an open modal

$ ->
  Shadowbox.init
    autoplayMovies: true
  
  
  $("#filter a").click ->
    selector = $(this).attr("data-filter")
    $container.isotope filter: selector
    false
  
  
  $container = $("#container") # initialize isotope
  $container.isotope
    itemSelector: ".project"
    layoutMode: "cellsByRow"
    cellsByRow:
      columnWidth: 278
      rowHeight: 190

  $optionSets = $("#options .option-set")
  $optionLinks = $optionSets.find("a")
  $optionLinks.click ->
    $this = $(this)
    
    # don't proceed if already selected
    return false  if $this.hasClass("selected")
    $optionSet = $this.parents(".option-set")
    $optionSet.find(".selected").removeClass "selected"
    $this.addClass "selected"
    
    # make option object dynamically, i.e. { filter: '.my-filter-class' }
    options = {}
    key = $optionSet.attr("data-option-key")
    value = $this.attr("data-option-value")
    
    # parse 'false' as false boolean
    value = (if value is "false" then false else value)
    options[key] = value
    if key is "layoutMode" and typeof changeLayoutMode is "function"
      
      # changes in layout modes need extra logic
      changeLayoutMode $this, options
    else
      
      # otherwise, apply new options
      $container.isotope options
    false

