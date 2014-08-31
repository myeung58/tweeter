$(document).ready(function() {
  $('#nav_table td').hide()
  $('#nav_table th').click(function() {
    $('#nav_table td').fadeToggle('slow');
  });
});
