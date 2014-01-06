
// this code is intended to be used inside the Listview
$(function () {
    // set many to many label's background color based on its content
    $('.ex-table .label:contains("one two")').css({background: '#d43d3d'})
    $('.ex-table .label:contains("three")').css({background: '#4654bb'})
    $('.ex-table .label:contains("four five")').css({background: '#52b035'})
});
