(function($){
  $.fn.outside = function(ename, cb){
    return this.each(function(){
      var $this = $(this),
          self = this;

      $(document).bind(ename, function tempo(e){
        if(e.target !== self && !$.contains(self, e.target)){
          cb.apply(self, [e]);
          if(!self.parentNode) $(document.body).unbind(ename, tempo);
        }
      });
    });
  };
}(jQuery));

//@codekit-append "vendor/bootstrap3/affix.js"
//@codekit-append "vendor/bootstrap3/button.js"
//@codekit-append "vendor/bootstrap3/carousel.js"
//@codekit-append "vendor/bootstrap3/collapse.js"
//@codekit-append "vendor/bootstrap3/dropdown.js"
//@codekit-append "vendor/bootstrap3/modal.js"
//@codekit-append "vendor/bootstrap3/transition.js"
//@codekit-append "vendor/tinynav.min.js"
//@codekit-append "vendor/shadowbox.js"
//@codekit-append "vendor/jquery.reveal.js"
//@codekit-append "vendor/jquery.isotope.js"
//@codekit-append "vendor/jquery.royalslider.custom.min.js"
