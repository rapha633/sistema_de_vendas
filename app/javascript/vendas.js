// vendas.js
document.addEventListener('turbolinks:load', function() {
    $('form').on('click', '.add_fields', function(event) {
      var fields = $(this).data('fields');
      var regexp = new RegExp(fields, 'g');
      var time = new Date().getTime();
      $(this).before(fields.replace(regexp, time));
      event.preventDefault();
    });
  
    $('form').on('click', '.remove_fields', function(event) {
      $(this).prev('input[type=hidden]').val('1');
      $(this).closest('.nested-fields').hide();
      event.preventDefault();
    });
  });