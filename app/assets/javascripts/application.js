//= require jquery
//= require jquery_ujs
//= require bootstrap-modal
//= require bootstrap-transition
//= require_self
//= require_tree .

var nw = (function(nw, $) {
  $(function() {
    nw.ui.init();
    nw.race_picker.init();
  });
  return nw;
}(nw || {}, jQuery)); 
