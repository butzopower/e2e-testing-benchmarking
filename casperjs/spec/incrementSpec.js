var casper = require('casper').create();

casper.start("http://localhost:8081/button_test.html");

casper.then(function() {
    for(var i=0; i<1000; i++) {
        this.clickLabel('Increment', 'button');
    }
});

casper.waitForText("1000");

casper.run();