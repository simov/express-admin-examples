
$(function () {
    // navigate to the Listview for the Controls table
    // see the different colors for each Many to Many label
    
    // set Many to Many label's background color based on its content
    $('.ex-table .label:contains("one two")').css({background: '#d43d3d'})
    $('.ex-table .label:contains("three")').css({background: '#4654bb'})
    $('.ex-table .label:contains("four five")').css({background: '#52b035'})
});
