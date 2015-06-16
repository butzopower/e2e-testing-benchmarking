var casper = require('casper').create();

casper.start("http://localhost:8080/uaa", function() {
    this.fillSelectors('form[action="/uaa/login.do"]', {
        "input[placeholder=Email]": "marissa",
        "input[placeholder=Password]": "koala"
    }, true);
});

casper.waitForText("Where to?", function() {
    this.click('.dropdown-trigger');
    this.clickLabel('Sign Out', 'a');
});

casper.waitForText("Welcome!")

casper.run();