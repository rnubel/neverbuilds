nw.race_picker = function() {
  var init = function() {  
    $('#picker').modal({show: true, 
                        keyboard: false, 
                        backdrop: 'static'});

    // choose a race
    $('.race-picker a').on('click', function() {
      $('#race').val($(this).attr('rel'));
      $('.picked-race').html($(this).find('.race').html());
      $('.race').hide();
      $('.class').show();
      return false;
    });

    // go back to race-picker
    $('.class .go-back').on('click', function() {
      $('#class, #race').val("");
      $('.class').hide();
      $('.race').show();
      return false;
    });

    // choose a class
    $('.class-picker a').on('click', function(e) {
      e.preventDefault();
      $('#class').val($(this).attr('rel'));
      $.ajax({
        headers: {
          'X-Transaction': 'POST Example',
          'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        },  
        type: "post",
        url: "/builds/pick",
        data: {"race": $('#race').val(), "class": $('#class').val()},
        success: function(json){
          $('#picker').modal('hide');
        },
        dataType: "json"
      }); 
    });
  };

  return {
    init: init
  };
}();
 
