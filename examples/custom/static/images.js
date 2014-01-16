
$(function () {
    // show all imgur urls as images inside the Listview
    $('.ex-table td:contains(imgur)').each(function (index) {
        $(this).html('<img src="'+$(this).text().trim()+'" style="width:100px" />')
    });

    // show all imgur urls as images inside the Editview
    $('.ex-table [type=text]').each(function (index) {
        if ($(this).val().match(/.*imgur.*/)) {
            $(this).parent().append('<img src="'+$(this).val()+'" style="margin-top:10px" />')
        }
    });

    // Hint: you can add only a link to the image and hook a jQuery plugin to it
    // that opens up the image in a modal popup with faded background for example
});
