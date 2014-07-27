
$(function () {
    // show all images inside the ListView
    $('.x-table tbody tr').each(function (index) {
        // the image column is second
        var td =  $('td:eq(1)', this);
        // get the image url
        var url = td.text().trim();

        // skip on missing url
        if (!url) return;
        // by default all uploads go to express-admin/public/upload
        if (!url.match(/^http/)) url = '/upload/' + url;

        // add image to this table cell
        td.html('<img src="'+url+'" style="width:100px" />');
    });

    // show all images inside the EditView
    $('.x-table [type=file]').each(function (index) {
        var holder = $(this).parent().prev();
        // get the image url
        var url = holder.find('[type=text]').val();

        // skip on missing url
        if (!url) return;
        // by default all uploads go to express-admin/public/upload
        if (!url.match(/^http/)) url = '/upload/' + url;

        // add image to this table cell
        holder.append('<img src="'+url+'" style="margin-top:10px" />');
    });

    // Hint: you can use some jQuery plugin here
});
