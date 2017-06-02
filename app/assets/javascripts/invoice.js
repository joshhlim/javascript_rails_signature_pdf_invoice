var ready = function() {

    $(document).on("click", "td[data-link]", function() {
        window.location = $(this).data('link');
    });

    $(document).on("change", "#hi", function() {
      // console.log($(this).attr('action'))
      var object = $(this).serialize()
      // console.log($(this).serialize())
      window.location = $(this).attr('action') + '?' + object
    });

};


$(document).ready(ready)
$(document).on("turbolinks:load", ready)
