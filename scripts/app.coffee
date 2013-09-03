#
# Add change click to touch for touchscreens
# 
clickevt = (if (Modernizr.touch) then (->
  $("section").each (i, el) ->
    $(el).addClass "in-view"

  "touchstart"
) else "click")

PBH = PBH or {}
$w = $(window)
$wh = $w.height()
$d = $(document)
$dh = $d.height()
ftop = undefined
navbottom = undefined
PBH.navvars = ->
  setTimeout (->
    # backpages, wait for active menu to expand before getting height
    ftop = $("section.last-scene").offset().top + 75
    navbottom = $("section.last-scene").offset().top + 75
    # navbottom = $("#sidebar-nav-wrap").offset().top + $("#sidebar-nav-wrap").height()
  ), 325

###
Fix for iPhone viewport scale bug
http://www.blog.highub.com/mobile-2/a-fix-for-iphone-viewport-scale-bug/
###
PBH.viewportmeta = document.querySelector and document.querySelector("meta[name=\"viewport\"]")
PBH.ua = navigator.userAgent
PBH.scaleFix = ->
  if PBH.viewportmeta and /iPhone|iPad|iPod/.test(PBH.ua) and not /Opera Mini/.test(PBH.ua)
    PBH.viewportmeta.content = "width=device-width, minimum-scale=1.0, maximum-scale=1.0"
    document.addEventListener "gesturestart", PBH.gestureStart, false

PBH.gestureStart = ->
  PBH.viewportmeta.content = "width=device-width, minimum-scale=0.25, maximum-scale=1.6"
  
PBH.sizeonce = ->
  $("section.full-height").not(".instagram").each (i, el) ->
    $(el).css
      "min-height": $(el).outerHeight()
      height: $wh

PBH.sectionheights = ->
  $("section.full-height").not(".instagram").each((i, el) ->
    $(el).height("auto").css "min-height": ""
    if $wh > $(el).outerHeight()
      $(el).css
        "min-height": $(el).outerHeight()
        height: $wh

    else
      $(el).css "min-height": $(el).outerHeight()
  ).filter(".finances").css
    height: "auto"
    "min-height": ""

PBH.scrollbutton = ->
  $(".scroll-down").on clickevt, (e) ->
    e.preventDefault()
    os = $("#vision-scene").offset()
    $("body,html").animate(scrollTop: os.top).trigger "scroll", true

PBH.scrolltosection = ->
  scrollResponder = (doitnow) ->
    PBH.scrollcount = PBH.scrollcount + 1
    clearTimeout PBH.scrolltimeout
    if PBH.scrollcount > 16 or doitnow
      sTop = $w.scrollTop()
      PBH.scrollcount = 0
      
      # add in-view class to section on scroll
      s = $.grep(sections, (el, i) ->
        $(el).offset().top - sTop < $wh - $wh / 3
      )
      $(s).not(".in-view").addClass "in-view"
    if isscrolling or $w.width() < 800 or (secmax > $wh)
      return
    else
      sTop = $w.scrollTop()
      clearTimeout PBH.scrolltimeout
      PBH.scrolltimeout = setTimeout(scrollToSection, 800)
    
    
  scrollToSection = ->
    targ = $.grep($("section"), (el, i) ->
      Math.abs($(el).offset().top - sTop) < ($(el).outerHeight() / 2)
    )[0]
    return false  if $(targ).is(".instagram")
    t = $(targ).offset().top
    isscrolling = true
    $("html,body").animate
      scrollTop: t
    , 200, ->
      isscrolling = false

    s = $.grep(sections, (el, i) ->
      $(el).offset().top - sTop < $wh - $wh / 3
    )
    $(s).addClass "in-view"
    scrollResponder()
  secmax = 0
  sections = $("section")
  sTop = 0
  isscrolling = false
  PBH.scrollcount = 0
  sections.each (i, el) ->
    secmax = Math.max($(el).outerHeight(), secmax)
    
  $w.on "scroll", scrollResponder

PBH.clicktonext = ->
  $(".go-to-next").on clickevt, (e) ->
    e.preventDefault()
    currpos = $w.scrollTop()
    
    # find out what section is next
    curr = $.grep($("section"), (el, i) ->
      $(el).offset().top <= currpos and $(el).next("section").length and $(el).next("section").offset().top > currpos
    )
    next = $(curr).next()
    if next.length
      lessthan = 0
      if next.is(".instagram")
        lessthan = 130
        if currpos >= $(".instagram").offset().top - lessthan
          next = next.next("section")
          lessthan = 0
      $("html,body").animate scrollTop: next.offset().top - lessthan
    else
      $("html,body").animate scrollTop: $("#footer").offset().top

PBH.parallax = ->
  scrolled = $(window).scrollTop()
  $(".parallax").css "top", -(scrolled * 0.2) + "px"

PBH.homeSlider = ->
  $("#full-width-slider").royalSlider
    arrowsNav: true
    loop: true
    keyboardNavEnabled: true
    controlsInside: false
    imageScaleMode: "fill"
    arrowsNavAutoHide: false
    autoScaleSliderHeight: 520
    controlNavigation: "bullets"
    thumbsFitInViewport: false
    navigateByClick: true
    startSlideId: 0
    autoPlay:
      # autoplay options go gere
      enabled: true
      pauseOnHover: true
      delay: 4000

    transitionType: "move"
    globalCaption: true
    deeplinking:
      enabled: true
      change: false
    # size of all images http://help.dimsemenov.com/kb/royalslider-jquery-plugin-faq/adding-width-and-height-properties-to-images

PBH.sizeslider = ->
  # get slider instance
  slider = $("#full-width-slider").data("royalSlider")

  # change scale mode
  slider.st.imageScaleMode = "fill"

  # force updating size by adding "true" to updateSliderSize method
  slider.updateSliderSize true
  
  slider.ev.on "rsAfterContentSet", (event) ->
    banner = $("#full-width-slider .section-banner")
    content = $("#full-width-slider .infoBlock")
    bheight = banner.height()
    cheight = $(".infoBlock").height()
    sheight = $("#full-width-slider").outerHeight()
    b = (sheight - bheight) / 2
    c = (sheight - cheight) / 2
    banner.css marginTop: b - c
    content.css marginTop: c

PBH.projects = ->
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

PBH.global = ->
  Shadowbox.init
    autoplayMovies: true
  
  gotonext = $(".go-to-next").addClass("current")
  
  $w.on "scroll", ->
    PBH.parallax()
    PBH.navvars()
    if $w.scrollTop() > 100
      if (window.innerHeight + window.scrollY) >= (document.body.offsetHeight - 200)
        gotonext.filter(".show").removeClass "show"
      else
        gotonext.not(".show").addClass "show"
    else
      gotonext.filter(".show").removeClass "show"
    
  setTimeout (->
    $(window).trigger "scroll", true
  ), 200
  
PBH.subpages = ->
  PBH.projects()

PBH.init = ->
  PBH.global()
  
  unless $("body").hasClass("sub-page")
    PBH.scrolltosection()
    PBH.scrollbutton()
    PBH.clicktonext()
    PBH.homeSlider()
    $w.on "resize", ->
      clearTimeout PBH.resizeto
      PBH.resizeto = setTimeout(->
        $wh = $w.height()
        PBH.sectionheights()
        PBH.sizeslider()
      , 100)

    PBH.sizeonce()
    PBH.sectionheights()
    PBH.sizeslider()
  else
    PBH.subpages()

$ ->  
  PBH.init()