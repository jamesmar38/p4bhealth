# setup mronline namespace to segregate our stuff
mronline = mronline or {}
AKAMAI_MEDIA_ANALYTICS_CONFIG_FILE_PATH = "/streams/config/beacon-1920.xml"

#
#* countdown is the visible countdown timer - counts down to the service start time
#
mronline.countdown = (($) ->
  
  # wrap in return to expose these properties and functions
  
  # show the countdown inside the $container (jQuery object) and using the details of the given service
  show: ($container, service) ->
    if not $container or not $container.jquery
      
      # how to handle the exception
      mronline.logger.debug "countdown.show - container is null or not jQuery"
      return
    mronline.logger.debug "countdown.show: service(" + service.id + ") video start in " + service.seconds_until_next_instance + " and service " + service.secs_until_start + " after that"
    
    # validate $container is a jq object
    $container.fadeIn(1000).countdown
      # until: service.seconds_until_next_instance + service.secs_until_start
      until: service.seconds_until_next_instance
      compact: true
      layout: $("#countdownlayout").html()

    $("#countdownWrapper,#countdownLabel").fadeIn 1000

  hide: ($container, callback) ->
    if not $container or not $container.jquery
      
      # how to handle the exception
      mronline.logger.debug "countdown.hide - container is null or not jQuery"
      return
    mronline.logger.debug "countdown.hide"
    $container.countdown("destroy").fadeOut 1000
    mronline.logger.debug "countdown.destroy"
    if callback
      $("#countdownWrapper,#countdownLabel").fadeOut 1000, callback
    else
      $("#countdownWrapper,#countdownLabel").fadeOut 1000
)(jQuery)

# ios = false
#
#* flash video player
#
mronline.player = (($) ->
  flashvars =
    baseurl: "/streams/"
    autostart: "true"
    themeColor: "0395d3"
    mode: "sidebyside"
    scaleMode: "fit"
    frameColor: "000000"
    fontColor: "cccccc"
    link: ""
    embed: ""
    akamai_config_path: "/streams/config/beacon-1920.xml" # config path
    akamai_swf_plugin_path: "http://79423.analytics.edgesuite.net/csma/plugin/csma.swf"
    retry_attempts: 7
    retry_second_span: 4

  service = `undefined`
  quality = `undefined`
  
  # map the bitrates to the quality for both sim and live
  bitrates = new Array()
  bitrates["SIM"] = new Array()
  bitrates["SIM"]["low"] = 300000
  bitrates["SIM"]["med"] = 650000
  bitrates["SIM"]["high"] = 1600000
  bitrates["SIM"]["auto"] = -1
  bitrates["LIVE"] = new Array()
  bitrates["LIVE"]["low"] = 300000
  bitrates["LIVE"]["med"] = 900000
  bitrates["LIVE"]["high"] = 1300000
  bitrates["LIVE"]["auto"] = -1
  
  #	var params = {allowFullScreen: 'true'};
  #	var attributes = {id: 'akamaiPlayer',name: 'akamaiPlayer'};
  params =
    allowFullScreen: "true"
    wmode: "transparent"

  attributes =
    id: "akamaiPlayer"
    name: "akamaiPlayer"

  isShowing = false
  show: ($container, svc) ->
    if not $container or not $container.jquery
      
      # how to handle the exception
      mronline.logger.debug "player.show - container is null or not jQuery"
      return
    service = svc
    quality = "auto"  if quality is `undefined`
    mronline.logger.debug "player.show: schedid=" + service.id + ",  type=" + service.type + ", quality=" + quality
    $container.fadeIn 1000
    $("#playerWindow").html "<div id=\"playerContainer\"><div id=\"live_player\"></div></div>"
    
    # Show quality controls in case they were hidden 
    $("#rightControls").fadeIn(500).find(".quality").show().removeClass("active").bind "click", mronline.player.change
    $("#rightControls").find("a#" + quality).addClass "active"
    flashvars["schedid"] = service.id
    
    # TODO - only pass start time && stream if we are doing a test 
    flashvars["simliveteststarttime"] = service.next_instance_date  if service.type is "SIM"
    
    #flashvars['teststream'] = -1; // service.streams[3].source_stream; ?? is [3] the right one? different if sim or live; iOS?
    flashvars["servicetype"] = service.type
    swfobject.embedSWF "/includes/swf/AkamaiFlashPlayer.swf", "playerContainer", "660", "409", "9.0.0", "/includes/swf/expressInstall.swf", flashvars, params, attributes
    isShowing = true

  hide: ($container, callback) ->
    if not $container or not $container.jquery
      
      # how to handle the exception
      mronline.logger.debug "player.hide - container is null or not jQuery"
      return
    mronline.logger.debug "player.hide"
    $container.fadeOut 1000, callback
    $container.find("#playerWindow").html ""
    isShowing = false

  change: ->
    quality = $(this).attr("id")
    br = bitrates[service.type][quality]
    mronline.logger.debug "set the quality to " + quality + " with a bitrate of " + br
    stream = -1
    i = 0
    while i < service.streams.length
      s = service.streams[i]
      if s.bitrate is br
        stream = s.source_stream
        break
      i++
    flashvars["teststream"] = stream
    mronline.logger.debug "the stream is " + stream
    $("#playerWindow").html "<div id=\"playerContainer\"><div id=\"live_player\"></div></div>"
    $("#rightControls").find(".quality").removeClass "active"
    $("#rightControls").find("a#" + quality).addClass "active"
    
    #if (quality == 'audio') flashvars['audioonly'] = true;
    swfobject.embedSWF "/includes/swf/AkamaiFlashPlayer.swf", "playerContainer", "660", "409", "9.0.0", "/includes/swf/expressInstall.swf", flashvars, params, attributes

  showing: ->
    isShowing
)(jQuery)

#
#* Past Messages
#
mronline.messages = (($) ->
  isPlaying = false
  show: ($container, $sliderContainer, $playerContainer, part) ->
    if not $container or not $container.jquery
      
      # how to handle the exception
      mronline.logger.debug "messages.show - container is null or not jQuery"
      return
    mronline.logger.debug "messages.show"
    mronline.slider.hide $sliderContainer
    mronline.player.hide $playerContainer  if mronline.player.showing()
    $("#message-video").remove()
    $("#video").html($("<div>").attr("id", "message-video")).append $("<div>").attr("id", "message-info")
    $("#message-video").css
      height: "380px"
      width: "660px"

    mediaUrl = "mp4:" + part.VideoFile
    videoPath = "rtmp://streaming.northpointministries.org/ondemand/flash/fcs.northpointcc/" + part.InitialLocation + "/Sunday_Sermons/" + part.SeriesDir + "/"
    msgInfo = "<p><img width=\"47px\" style=\"margin:0 10px; float: left;\"; src=\"http://northpointministries.org/images/messages/album_covers/" + part.Image + "\"><h4 style=\"line-height: 16px;\">" + part.SeriesTitle + "</h4><h5 style=\"line-height: 16px;\">" + part.MessageTitle + "</h5><h6 style=\"line-height: 16px;\"><em>" + part.Speaker + "</em></h6></p>"
    $("#message-info").html msgInfo
    flowplayer "message-video",
      src: "/includes/swf/flowplayer.commercial-3.2.6.swf"
      wmode: "transparent"
    ,
      key: "#$985e8c718816aa9afcd"
      logo: null
      clip:
        url: mediaUrl
        provider: "akamai"
        autoBuffering: true

      plugins:
        akamai:
          url: "/includes/swf/flowplayer.rtmp-3.2.3.swf"
          netConnectionUrl: videoPath

        akamaiAnalytics:
          url: "/includes/swf/analytics-plugin-flowplayer-loader.swf"
          csmaPluginPath: "http://79423.analytics.edgesuite.net/csma/plugin/csma.swf"
          csmaConfigPath: AKAMAI_MEDIA_ANALYTICS_CONFIG_FILE_PATH
          eventName: mediaUrl # custom data should go here - look at page 8 & 9 of the flowplayer document to get the valid key names
          show: "On Demand Flash"

        controls:
          url: "/includes/swf/flowplayer.controls-3.2.4.swf"

    $container.fadeIn 2000
    isPlaying = true
    console.log "messages.play - is playing is " + ((if isPlaying then "true" else "false"))
    # show watch link - when we start using the counter for its stated purpose we'll have to redesign this
    mronline.timer.show_service_live()  if mronline.timer.service_running()

  hide: ($container, callback) ->
    if not $container or not $container.jquery
      
      # how to handle the exception
      mronline.logger.debug "messages.hide - container is null or not jQuery"
      return
    mronline.logger.debug "messages.hide"
    $container.fadeOut 1000, callback
    $container.find("#message-video,#message-info").remove()
    isPlaying = false

  watching: ->
    isPlaying
)(jQuery)

#
#* slider
#
mronline.slider = (($) ->
  show: ($container) ->
    if not $container or not $container.jquery
      
      # how to handle the exception
      mronline.logger.debug "slider.show - container is null or not jQuery"
      return
    mronline.logger.debug "slider.show"
    $container.fadeIn(1000).load "/live/slider", null, ->
      
      # Listen for the ready event for any vimeo video players on the page
      #
      #		var vimeoPlayers = $('iframe[id*=player_]'),
      #			player;
      #
      #		for (var i = 0, length = vimeoPlayers.length; i < length; i++) {
      #			player = vimeoPlayers[i];
      #			$f(player).addEvent('ready', ready);
      #		}
      #		
      addEvent = (element, eventName, callback) ->
        if element.addEventListener
          element.addEventListener eventName, callback, false
        else
          element.attachEvent eventName, callback, false
      
      ###
      Utility function for adding an event. Handles the inconsistencies
      between the W3C method for adding events (addEventListener) and
      IE's (attachEvent).
      ###
      addEvent = (element, eventName, callback) ->
        if element.addEventListener
          element.addEventListener eventName, callback, false
        else
          element.attachEvent eventName, callback, false
      
      ###
      Called once a vimeo player is loaded and ready to receive
      commands. You can add events and make api calls only after this
      function has been called.
      ###
      ready = (player_id) ->
        
        # Keep a reference to Froogaloop for this player
        
        ###
        Adds listeners for the events that are checked. Adding an event
        through Froogaloop requires the event name and the callback method
        that is called once the event fires.
        ###
        setupEventListeners = ->
          onPlay = ->
            froogaloop.addEvent "play", (data) ->
              
              #alert('play event');
              $("#slides .slide:eq(0)").trigger "mouseover"

          onPause = ->
            froogaloop.addEvent "pause", (data) ->
              $("#slides .slide:eq(0)").trigger "mouseleave"

          onFinish = ->
            froogaloop.addEvent "finish", (data) ->
              $("#slides .slide:eq(0)").trigger "mouseleave"

          onPlayProgress = ->
            froogaloop.addEvent "playProgress", (data) ->
              
              #alert('test');
              $("#slides .slide:eq(0)").trigger "mouseover"

          onPlay()
          onPause()
          onFinish()
          onPlayProgress()
        container = document.getElementById(player_id).parentNode.parentNode
        froogaloop = $froogalop(player_id)
        setupEventListeners()
      $(this).find("#slides").slides
        preload: true
        preloadImage: "images/loading.gif"
        effect: "slide, fade"
        slideSpeed: 350
        fadeSpeed: 500
        generatePagination: false
        play: 5000
        pause: 1000
        hoverPause: true
        width: 660
        animationComplete: ->
          $("iframe[id*=player_]").each ->
            $froogalop(this).api "pause"


      $("iframe[id*=player_]").each ->
        $froogalop(this).addEvent "ready", ready



  hide: ($container, callback) ->
    if not $container or not $container.jquery
      
      # how to handle the exception
      mronline.logger.debug "slider.hide - container is null or not jQuery"
      return
    mronline.logger.debug "slider.hide"
    $container.fadeOut 1000, callback
)(jQuery)

#
#* counter
#
mronline.counter = (($) ->
  $counterHtml = undefined
  show: ($container) ->
    if not $container or not $container.jquery
      
      # how to handle the exception
      mronline.logger.debug "counter.show - container is null or not jQuery"
      return
    mronline.logger.debug "counter.show"
    mronline.logger.debug "we're watching a message here! and now the countdown is hidden"
    $a = $("<a>").attr(
      href: "/live"
      id: "watch_svc"
    ).html("Watch Service Now &raquo;")
    # $a.bind "click", mronline.timer.watch_service
    $container.html("<div id=\"watch_box\"><div id=\"watch_link\"></div></div>").css("text-indent", 0).fadeIn 1000
    $("#watch_link").append $a

  hide: ($container, callback) ->
    if not $container or not $container.jquery
      
      # how to handle the exception
      mronline.logger.debug "counter.hide - container is null or not jQuery"
      return
    mronline.logger.debug "counter.hide"
    $counterHtml = $container.html()
    $container.fadeOut 1000, callback
)(jQuery)

#
#* timer is the master timer where the logic goes to show/hide all of the page elements based on when services stop or start
#
mronline.timer = (($) ->
  currentService = undefined
  nextService = undefined
  $playerContainer = undefined
  $sliderContainer = undefined
  $messagesContainer = undefined
  $countdownContainer = undefined
  $counterContainer = undefined
  
  # wrap in return to expose these properties and functions
  init: (service, $playerDiv, $sliderDiv, $messagesDiv, $countdownDiv, $counterDiv) ->
    return  unless service
    currentService = service
    $playerContainer = $playerDiv
    $sliderContainer = $sliderDiv
    $messagesContainer = $messagesDiv
    $countdownContainer = $countdownDiv
    $counterContainer = $counterDiv
    mronline.logger.debug "timer initialized with service object: " + service.start_time + ", video will start in " + service.seconds_until_next_instance + " seconds"
    if currentService.seconds_until_next_instance > 15 # grace period
      mronline.slider.show $sliderContainer
      mronline.countdown.show $countdownContainer, currentService
      
      # since the countdown is showing we need to set a timer on the video start	
      setTimeout "mronline.timer.video_start()", currentService.seconds_until_next_instance * 1000
      currentService.isRunning = false
    else
      mronline.logger.debug "hide countdown and show player"
      mronline.timer.video_start true

  service_running: ->
    currentService.isRunning

  show_service_live: -> # puts up a link indicating that the service is currently live - this is if the user is watching an on-demand message
    mronline.counter.show $counterContainer

  watch_service: (evt) ->
    evt.preventDefault()
    mronline.messages.hide $messagesContainer, ->
      mronline.counter.hide $counterContainer
      mronline.timer.video_start()


  video_start: (showOnLoad) ->
    mronline.logger.debug "mronline.timer.video_start, watching a msg? " + ((if mronline.messages.watching() then "Yep" else "Nope"))
    currentService.isRunning = true
    
    # if mronline.messages.watching()
    #   mronline.countdown.hide $countdownContainer, ->
    #     mronline.counter.show $counterContainer

    # else
    #   mronline.slider.hide $sliderContainer, ->
    #     $.getJSON "/ajax/streams/" + currentService.id, (json) ->
    #       currentService.streams = json
    #       mronline.logger.debug "gonna set a timeout until the service starts in " + currentService.secs_until_start + " seconds"
    #       if showOnLoad # go ahead and do the service start, else set the timer to wait
    #         mronline.timer.service_start()
    #         mronline.player.show $playerContainer, currentService
    #       else
    #         setTimeout "mronline.timer.service_start()", currentService.secs_until_start * 1000
    #         mronline.player.show $playerContainer, currentService
    
    mronline.countdown.hide $countdownContainer, ->
      mronline.counter.show $counterContainer
    mronline.slider.hide $sliderContainer, ->
      $.getJSON "/ajax/streams/" + currentService.id, (json) ->
        currentService.streams = json
        mronline.logger.debug "gonna set a timeout until the service starts in " + currentService.secs_until_start + " seconds"
        if showOnLoad # go ahead and do the service start, else set the timer to wait
          mronline.timer.service_start()
          mronline.player.show $playerContainer, currentService
        else
          setTimeout "mronline.timer.service_start()", currentService.secs_until_start * 1000
          mronline.player.show $playerContainer, currentService


      
      # todo - add people counter
      
      # have to take into account when this is called after the service time has started:
      #  - if so, use the seconds_until_next_instance_end that was set on the server
      #  - if not, then we counted down and just use the video length
      secs = (if (showOnLoad) then currentService.seconds_until_next_instance_end else currentService.video_length)
      setTimeout "mronline.timer.video_end()", secs * 1000
      
      # set a random timer between now and the video end to go fetch the next service from the server
      min = 1
      max = secs - 20 # don't want to be right up at the video end -- TODO - make it 60
      secs2wait = Math.floor(Math.random() * (max - min + 1)) + min
      mronline.logger.debug "waiting " + secs2wait + " seconds until getting next service & starting countdown"
      setTimeout "mronline.timer.get_next_service()", secs2wait * 1000

  service_start: ->
    mronline.logger.debug "inside service_start"
    mronline.countdown.hide $countdownContainer, ->


  
  # for future
  #mronline.counter.show($counterContainer,currentService);	
  video_end: ->
    mronline.logger.debug "mronline.timer.video_end: now we need to hide the player, show the gallery, and countdown to the NEXT service after [" + currentService.id + "]"
    mronline.counter.hide $counterContainer, ->

    mronline.player.hide $playerContainer, ->
      
      # go fetch it
      mronline.timer.get_next_service()  unless nextService
      currentService = nextService
      currentService.isRunning = (currentService.seconds_until_next_instance < 15)
      if mronline.messages.watching()
        mronline.counter.hide $counterContainer, ->
          mronline.countdown.show $countdownContainer, currentService

      else
        mronline.slider.show $sliderContainer
        mronline.countdown.show $countdownContainer, currentService
      setTimeout "mronline.timer.video_start()", currentService.seconds_until_next_instance * 1000


  
  #
  #			// randomize how quickly this happens so server doesn't get pegged all at once
  #			var min = 1;
  #			var max = 20; // TODO - set this for live
  #			var secs2wait = Math.floor(Math.random() * (max - min + 1)) + min;
  #			mronline.logger.debug("waiting "+secs2wait+" seconds until getting next service & starting countdown");
  #			setTimeout("mronline.timer.get_next_service()", secs2wait * 1000 );
  #			
  get_next_service: ->
    $.getJSON "/ajax/nextService?current=" + currentService.id, (json) ->
      try
        nextService = json
        mronline.logger.debug "timer.get_next_service: got the next one[" + nextService.id + "] on " + nextService.weekday + " @ " + nextService.start_time + ", has " + nextService.streams.length + " streams"
      catch e
        mronline.logger.debug "Exception parsing JSON: " + e

)(jQuery)

#
#* custom logger 
#
mronline.logger = (($) ->
  
  # wrap in return to expose these properties and functions
  # WARNING: older browsers don't have console, and the following if statements don't hide it very well either; so comment out that line for production
  debug: (msg) ->
    console.log msg
    return
)(jQuery)

# defines a console for IE, to prevent errors
# @console = log: ->  if typeof console is "undefined"
window.console ?=
    log:-> #patch so console.log() never causes error even in IE.


$.validator.setDefaults
  errorPlacement: (error, element) ->
    true

  highlight: (element, errorClass, validClass) ->
    $element = undefined
    if element.type is "radio"
      $element = @findByName(element.name)
    else
      $element = $(element)
    $element.addClass(errorClass).removeClass validClass
    $element.parents("div.control-group").addClass "error"

  unhighlight: (element, errorClass, validClass) ->
    $element = undefined
    if element.type is "radio"
      $element = @findByName(element.name)
    else
      $element = $(element)
    $element.removeClass(errorClass).addClass validClass
    $element.parents("div.control-group").removeClass "error"

  showErrors: (errorMap, errorList) ->
    $.each @successList, (index, value) ->
      $(value).popover "hide"

    $.each errorList, (index, value) ->
      pop = $(value.element).popover(
        trigger: "manual"
        content: value.message
        template: "<div class=\"popover\"><div class=\"arrow\"></div><div class=\"popover-inner\"><div class=\"popover-content\"><p></p></div></div></div>"
      )
      pop.data("popover").options.content = value.message
      $(value.element).popover "show"

    @defaultShowErrors()


$ ->
  $("input[placeholder], textarea[placeholder]").placeholder()
  $("#subForm input").focus ->
    $("#subscribe").addClass "active"

  $("#subForm").submit (e) ->
    e.preventDefault()
    $.getJSON @action + "?callback=?", $(this).serialize(), (data) ->
      if data.Status is 400
        $("#subResponse").addClass("error").text "Please double check your email address"
      else
        $("#subForm label,#subForm input,#subForm #subscribe").hide()
        $("#subResponse").addClass("success").text "Thanks. You're all set to receive our newsletter."

  
  $(".lightbox").fancybox()
  $(".form-horizontal").validate()
  $(".fancybox-opened .form-horizontal").validate()
  $("#connectForm").validate()
  $("#connectForm").validate submitHandler: (form) ->
    $(form).find(":submit").attr("disabled", true).attr("value",
    "Submitting...");
    form.submit();
    
    connectForm = document.getElementById("connectForm")
    connectForm.onsubmit = ->
      w = window.open("about:blank", "Popup_Window", "toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=400,height=300,left = 312,top = 234")
      @target = "Popup_Window"
  
  $("#phone_number").mask("(999) 999-9999")
  
  # UNCOMMENT THE LINE YOU WANT BELOW IF YOU WANT IE8 SUPPORT AND ARE USING .block-grids
  # $('.block-grid.two-up>li:nth-child(2n+1)').css({clear: 'left'});
  # $('.block-grid.three-up>li:nth-child(3n+1)').css({clear: 'left'});
  # $('.block-grid.four-up>li:nth-child(4n+1)').css({clear: 'left'});
  # $('.block-grid.five-up>li:nth-child(5n+1)').css({clear: 'left'});
  $(".scroll").click (e) ->
    $("html, body").animate
      scrollTop: 0
    , 500
    e.preventDefault()

emailNotes = ->
  document.getElementById("notesEmailer").style.display = ""
  document.getElementById("notesContainer").style.display = "none"
emailSent = ->
  document.getElementById("notesEmailer").style.display = "none"
  document.getElementById("notesContainer").style.display = ""

#notes in tabs
emailNotes2 = ->
  document.getElementById("notesEmailer2").style.display = ""
  document.getElementById("notesContainer2").style.display = "none"

#notes in tabs return
emailSent2 = ->
  document.getElementById("notesEmailer2").style.display = "none"
  document.getElementById("notesContainer2").style.display = ""