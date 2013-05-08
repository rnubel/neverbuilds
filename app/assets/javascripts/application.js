//= require jquery
//= require bootstrap-modal
//= require bootstrap-transition
//= require_self
//= require_tree .

var nw = (function(nw, $) {
  $(function() {
    nw.ui.init();
  });
  return nw;
}(nw || {}, jQuery)); 
