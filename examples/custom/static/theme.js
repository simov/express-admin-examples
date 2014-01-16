
$(function () {
    // choose a theme that will be pre-selected by default
    var theme = 'Default'; // Flatly, Cosmo ...

    // note that your default theme will be selected
    // only if the user haven't choosed any other theme yet
    if (!window.localStorage.getItem('theme'))
        $('#theme a:contains('+theme+')').trigger('click');
});
