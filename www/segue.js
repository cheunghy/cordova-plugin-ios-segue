var segue = {
    performSegue: function (segueIdentifier) {
        var callback = function () {};
        cordova.exec(callback, callback, "segue", "performSegueWithUrlCommand", [segueIdentifier]);
    }
};