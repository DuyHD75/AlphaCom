
var dataString = $('#data-statistic').val();

// var dataString = "[ManageOrder{orderDate=2023-06-23, dayOfWeek='Friday', totalOrders=3, totalProducts=15, revernues=1080.2}, ManageOrder{orderDate=2023-06-24, dayOfWeek='Saturday', totalOrders=3, totalProducts=11, revernues=1295.5}]";

// Remove the square brackets to get the content inside
var contentString = dataString.substring(1, dataString.length - 1);

// Split the content string using '}, ' as the delimiter
var objectStrings = contentString.split('}, ');

// Add back the closing curly brace '}' to each object string and remove the 'ManageOrder' prefix
objectStrings = objectStrings.map(function(objString) {
    // Remove the 'ManageOrder' prefix
    objString = objString.replace('ManageOrder', '');

    // Remove the extra curly brace at the end if present
    if (objString.endsWith('}}')) {
        objString = objString.substring(0, objString.length - 1);
    }

    return objString;
});



var data = {};
var data2 = {};

objectStrings.forEach(function(objString) {
    // Remove the curly braces
    var trimmedString = objString.slice(1, -1);

    // Split the string into key-value pairs
    var keyValuePairs = trimmedString.split(', ');

    // Create an empty object to hold the parsed data
    var obj = {};

    // Iterate over the key-value pairs
    keyValuePairs.forEach(function(keyValue) {
        // Split each key-value pair into key and value
        var parts = keyValue.split('=');
        var key = parts[0].trim();
        var value = parts[1].trim().replace(/'/g, ''); // Remove single quotes if present

        // Set the key-value pair in the object
        obj[key] = value;
    });

    // Extract the day of the week from the 'dayOfWeek' property
    var dayOfWeek = obj.dayOfWeek;

    // Remove the 'dayOfWeek' property from the object
    delete obj.dayOfWeek;

    // Add the object to the 'data' object using the day of the week as the key
    data[dayOfWeek] = obj;
});

console.log(data)

// Get the chart canvas element
var chartCanvas = $('#js-chart-1');

var dayOfWeek = {
    Monday: 0,
    Tuesday: 1,
    Wednesday: 2,
    Thursday: 3,
    Friday: 4,
    Saturday: 5,
    Sunday: 6
};


var chartOptions = chartCanvas.attr('data-hs-chartjs-options');

var options = JSON.parse(chartOptions);

for (var key in data) {
    if (data.hasOwnProperty(key)) {
        var idx = dayOfWeek[key]
        var item = data[key];
        console.log(item)
        options.data.labels[idx] = item.orderDate;
        options.data.datasets[0].data[idx] = item.totalProducts;
        options.data.datasets[1].data[idx] = item.revernues;
    }
}


var updatedOptions = JSON.stringify(options);

chartCanvas.attr('data-hs-chartjs-options', updatedOptions);

//==============================================
