
$(function () {
    if (!$('.x-filter').length) return;
    var index = $('.ex-table th').index($('.ex-table th:contains(binary)'));
    if (index != -1) {
        $('.ex-table tr:gt(0)').each(function (idx) {
            var blob = $('td', this).eq(index),
                base64 = blob.text();
                
            blob.html('<img src="'+base64+'" />');
        });
    }
});
