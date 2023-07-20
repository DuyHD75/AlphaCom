var dataString1 = $('#data-statistic').val();// this is the data of statistic current week
var dataString2 = $('#data-statistic2').val();// this is the data of statistic last week

console.log(dataString1);

// Remove the square brackets to get the content inside
var contentString1 = dataString1.substring(1, dataString1.length - 1);

var contentString2 = dataString2.substring(1, dataString2.length - 1);

// Split the content string using '}, ' as the delimiter
var objectStrings1 = contentString1.split('}, ');

var objectStrings2 = contentString2.split('}, ');

// Add back the closing curly brace '}' to each object string and remove the 'ManageOrder' prefix
objectStrings1 = objectStrings1.map(function (objString) {
    // Remove the 'ManageOrder' prefix
    objString = objString.replace('ManageOrder', '');

    // Remove the extra curly brace at the end if present
    if (objString.endsWith('}}')) {
        objString = objString.substring(0, objString.length - 1);
    }

    return objString;
});


objectStrings2 = objectStrings2.map(function (objString) {
    // Remove the 'ManageOrder' prefix
    objString = objString.replace('ManageOrder', '');

    // Remove the extra curly brace at the end if present
    if (objString.endsWith('}}')) {
        objString = objString.substring(0, objString.length - 1);
    }

    return objString;
});


function processObjectStrings(objectStrings) {
    var data = {};

    objectStrings.forEach(function (objString) {
        // Remove the curly braces
        var trimmedString = objString.slice(1, -1);

        // Split the string into key-value pairs
        var keyValuePairs = trimmedString.split(', ');

        // Create an empty object to hold the parsed data
        var obj = {};

        // Iterate over the key-value pairs
        keyValuePairs.forEach(function (keyValue) {
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

    return data;
}


if (objectStrings1.length > 0)
    var data = processObjectStrings(objectStrings1);

if (objectStrings1.length > 0)
    var data2 = processObjectStrings(objectStrings2);




// Get the chart canvas element
var chartCanvas = $('#js-chart-2');

var chartCanvas3 = $('#js-chart-3');


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
var chartOptions3 = chartCanvas3.attr('data-hs-chartjs-options');


var options = JSON.parse(chartOptions);
var options3 = JSON.parse(chartOptions3)
console.log(options)

for (var key in data) {
    if (data.hasOwnProperty(key)) {
        var idx = dayOfWeek[key]
        var item = data[key];
        console.log(item)
        // options.data.labels[idx] = item.orderDate;
        options3.data.datasets[0].data[idx] = item.totalProducts;
        options.data.datasets[0].data[idx] = item.revernues;
    }
}

for (var key in data2) {
    if (data.hasOwnProperty(key)) {
        var idx = dayOfWeek[key]
        var item = data2[key];
        console.log(item)
        // options.data.labels[idx] = item.orderDate;
        options3.data.datasets[1].data[idx] = item.totalProducts;
        options.data.datasets[1].data[idx] = item.revernues;
    }
}


var updatedOptions = JSON.stringify(options);
var updatedOptions3 = JSON.stringify(options3);
console.log(updatedOptions)

chartCanvas.attr('data-hs-chartjs-options', updatedOptions);
chartCanvas3.attr('data-hs-chartjs-options', updatedOptions3);


//==============================================
