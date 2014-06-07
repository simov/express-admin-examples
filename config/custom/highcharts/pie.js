
exports.chart = function (month, rows, total) {
    return {
        chart: {
            renderTo: 'chart-pie',
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: '$'+total+' spend for goods in '+month
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage}%</b>',
            percentageDecimals: 1,
            formatter: 'all callback functions are defined in the browser!'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    formatter: 'all callback functions are defined in the browser!'
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Spend',
            data: pieData(rows, total)
        }]
    }
}

// generate the pie chart's data
function pieData (rows, total) {
    var ratio = parseFloat(total) / 100, // total / 100%
        data = [];

    for (var i=0; i < rows.length; i++) {
        var percentage = parseFloat(rows[i].total) / ratio;
        data.push({
            name: rows[i].name,
            y: parseFloat(percentage.toFixed(2)),
            total: parseInt(rows[i].total) // custom data
        });
    }
    return data;
}
