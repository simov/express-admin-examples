
$(function () {
    if (!$('.x-filter').length) return;
    var index = $('.x-table th').index($('.x-table th:contains(binary)'));
    if (index != -1) {
        $('.x-table tr:gt(0)').each(function (idx) {
            var blob = $('td', this).eq(index),
                base64 = blob.text();
                
            blob.html('<img src="'+base64+'" />');
        });
    }
});
