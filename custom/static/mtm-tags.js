
$(function () {
  // navigate to the Listview for the Controls table
  // note the different colors for each Many to Many label
  
  // set the background color for the Many to Many labels based on their content
  $('.x-table .label:contains("one two")').css({background: '#d43d3d'})
  $('.x-table .label:contains("three")').css({background: '#4654bb'})
  $('.x-table .label:contains("four five")').css({background: '#52b035'})
})
