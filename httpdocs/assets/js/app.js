// Generated by CoffeeScript 1.6.3
(function(){var e,t,n,r,i,s,o,u;s=Modernizr.touch?function(){$("section").each(function(e,t){return $(t).addClass("in-view")});return"touchstart"}:"click";i=i||{};n=$(window);r=n.height();e=$(document);t=e.height();o=void 0;u=void 0;i.navvars=function(){return setTimeout(function(){o=$("section.last-scene").offset().top+75;return u=$("section.last-scene").offset().top+75},325)};i.viewportmeta=document.querySelector&&document.querySelector('meta[name="viewport"]');i.ua=navigator.userAgent;i.scaleFix=function(){if(i.viewportmeta&&/iPhone|iPad|iPod/.test(i.ua)&&!/Opera Mini/.test(i.ua)){i.viewportmeta.content="width=device-width, minimum-scale=1.0, maximum-scale=1.0";return document.addEventListener("gesturestart",i.gestureStart,!1)}};i.gestureStart=function(){return i.viewportmeta.content="width=device-width, minimum-scale=0.25, maximum-scale=1.6"};i.sizeonce=function(){return $("section.full-height").each(function(e,t){return $(t).css({"min-height":$(t).outerHeight(),height:r})})};i.sectionheights=function(){return $("section.full-height").each(function(e,t){$(t).height("auto").css({"min-height":""});return r>$(t).outerHeight()?$(t).css({"min-height":$(t).outerHeight(),height:r}):$(t).css({"min-height":$(t).outerHeight()})})};i.scrollbutton=function(){return $(".scroll-down").on(s,function(e){var t;e.preventDefault();t=$("#vision-scene").offset();return $("body,html").animate({scrollTop:t.top}).trigger("scroll",!0)})};i.scrolltosection=function(){var e,t,s,o,u,a;s=function(t){var s,f;i.scrollcount=i.scrollcount+1;clearTimeout(i.scrolltimeout);if(i.scrollcount>16||t){f=n.scrollTop();i.scrollcount=0;s=$.grep(a,function(e,t){return $(e).offset().top-f<r-r/3});$(s).not(".in-view").addClass("in-view")}if(!(e||n.width()<800||u>r)){f=n.scrollTop();clearTimeout(i.scrolltimeout);return i.scrolltimeout=setTimeout(o,800)}};o=function(){var e,n,i,o;o=$.grep($("section"),function(e,n){return Math.abs($(e).offset().top-t)<$(e).outerHeight()/2})[0];if($(o).is(".instagram"))return!1;i=$(o).offset().top;e=!0;$("html,body").animate({scrollTop:i},200,function(){return e=!1});n=$.grep(a,function(e,n){return $(e).offset().top-t<r-r/3});$(n).addClass("in-view");return s()};u=0;a=$("section");t=0;e=!1;i.scrollcount=0;a.each(function(e,t){return u=Math.max($(t).outerHeight(),u)});return n.on("scroll",s)};i.clicktonext=function(){return $(".go-to-next").on(s,function(e){var t,r,i,s;e.preventDefault();r=n.scrollTop();t=$.grep($("section"),function(e,t){return $(e).offset().top<=r&&$(e).next("section").length&&$(e).next("section").offset().top>r});s=$(t).next();if(s.length){i=0;if(s.is(".instagram")){i=130;if(r>=$(".instagram").offset().top-i){s=s.next("section");i=0}}return $("html,body").animate({scrollTop:s.offset().top-i})}return $("html,body").animate({scrollTop:$("#footer").offset().top})})};i.parallax=function(){var e;e=$(window).scrollTop();return $(".parallax").css("top",-(e*.2)+"px")};i.homeSlider=function(){return $("#full-width-slider").royalSlider({arrowsNav:!0,loop:!0,keyboardNavEnabled:!0,controlsInside:!1,imageScaleMode:"fill",arrowsNavAutoHide:!1,autoScaleSliderHeight:520,controlNavigation:"bullets",thumbsFitInViewport:!1,navigateByClick:!0,startSlideId:0,autoPlay:{enabled:!0,pauseOnHover:!0,delay:4e3},transitionType:"move",globalCaption:!0,deeplinking:{enabled:!0,change:!1}})};i.sizeslider=function(){var e;e=$("#full-width-slider").data("royalSlider");e.st.imageScaleMode="fill";e.updateSliderSize(!0);return e.ev.on("rsAfterContentSet",function(e){var t,n,i,s,o,u,a;n=$("#full-width-slider .section-banner");u=$("#full-width-slider .infoBlock");i=n.height();o=$(".infoBlock").height();a=$("#full-width-slider").outerHeight();t=(a-i)/2;s=(a-o)/2;r<600?n.css({marginTop:(t-s)/2}):n.css({marginTop:t-s});return u.css({marginTop:s})})};i.projects=function(){var e,t,n;$("#projects #filter a").click(function(){var t;t=$(this).attr("data-filter");e.isotope({filter:t});return!1});e=$("#projects #container");e.isotope({itemSelector:".project",layoutMode:"cellsByRow",cellsByRow:{columnWidth:278,rowHeight:190}});n=$("#projects #options .option-set");t=n.find("a");return t.click(function(){var t,n,r,i,s;n=$(this);if(n.hasClass("selected"))return!1;t=n.parents(".option-set");t.find(".selected").removeClass("selected");n.addClass("selected");i={};r=t.attr("data-option-key");s=n.attr("data-option-value");s=s==="false"?!1:s;i[r]=s;r==="layoutMode"&&typeof changeLayoutMode=="function"?changeLayoutMode(n,i):e.isotope(i);return!1})};i.global=function(){$("html").addClass("js");return Shadowbox.init({autoplayMovies:!0})};i.homePage=function(){var e,t;e=new $.BigVideo;e.init();e.show("/assets/video/homepage-loop_dim_1200.mp4",{ambient:!0});t=$(".go-to-next").addClass("current");n.on("scroll",function(){i.parallax();i.navvars();return n.scrollTop()>100?window.innerHeight+window.scrollY>=document.body.offsetHeight-200?t.filter(".show").removeClass("show"):t.not(".show").addClass("show"):t.filter(".show").removeClass("show")});return setTimeout(function(){return $(window).trigger("scroll",!0)},200)};i.subpages=function(){$("#nav-sub").tinyNav({active:"active",header:"Navigation",label:""});return i.projects()};i.init=function(){i.global();if(!$("body").hasClass("sub-page")){i.scrollbutton();i.clicktonext();i.homePage();i.homeSlider();n.on("resize",function(){clearTimeout(i.resizeto);return i.resizeto=setTimeout(function(){r=n.height();i.sectionheights();return i.sizeslider()},100)});i.sizeonce();i.sectionheights();return i.sizeslider()}return i.subpages()};$(function(){return i.init()})}).call(this);