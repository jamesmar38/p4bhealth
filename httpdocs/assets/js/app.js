// Generated by CoffeeScript 1.6.3
(function(){jQuery(document).ready(function(e){return e("#full-width-slider").royalSlider({arrowsNav:!0,loop:!0,keyboardNavEnabled:!0,controlsInside:!1,imageScaleMode:"fill",arrowsNavAutoHide:!1,autoScaleSlider:!1,autoScaleSliderWidth:!1,autoScaleSliderHeight:!1,controlNavigation:"bullets",thumbsFitInViewport:!1,navigateByClick:!0,startSlideId:0,autoPlay:{enabled:!0,pauseOnHover:!1,delay:4e3},transitionType:"move",globalCaption:!0,deeplinking:{enabled:!0,change:!1}})});$(function(){var e,t,n;Shadowbox.init({autoplayMovies:!0});$("#filter a").click(function(){var t;t=$(this).attr("data-filter");e.isotope({filter:t});return!1});e=$("#container");e.isotope({itemSelector:".project",layoutMode:"cellsByRow",cellsByRow:{columnWidth:278,rowHeight:190}});n=$("#options .option-set");t=n.find("a");return t.click(function(){var t,n,r,i,s;n=$(this);if(n.hasClass("selected"))return!1;t=n.parents(".option-set");t.find(".selected").removeClass("selected");n.addClass("selected");i={};r=t.attr("data-option-key");s=n.attr("data-option-value");s=s==="false"?!1:s;i[r]=s;r==="layoutMode"&&typeof changeLayoutMode=="function"?changeLayoutMode(n,i):e.isotope(i);return!1})})}).call(this);