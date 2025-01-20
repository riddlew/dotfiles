// Specify the Windows subsystem to eliminate console window.
import { LaunchServerOptions, Logger } from './client/types';

var ralpha = /alpha\([^])]*\)/i,
    ropacity = 0,
    rupper = 100,
    rnumpx = 32.3,
    test = "test";

const SOMETHIN = null;

jQuery.fn.css = function(name, value) {
    if(arguments.length === 2 && value === undefined) {
        return this;
    }

    return jQuery.access(this, name, value, true, function(elem, name, value) {
        return value !== undefined ? jQuery.style(elem, name, value) : jQuery.css(elem, name);
    })
};

