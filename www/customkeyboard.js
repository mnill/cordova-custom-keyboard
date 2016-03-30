var argscheck = require('cordova/argscheck'),
    utils = require('cordova/utils'),
    exec = require('cordova/exec');
   
var CustomKeyboard = function() {
};

//keyboard pattern;
// 1 =  UIKeyboardTypeDefault;              
// 2 =  UIKeyboardTypeASCIICapable;       
// 3 = UIKeyboardTypeNumbersAndPunctuation;
// 4 =  UIKeyboardTypeURL;                 
// 5 =  UIKeyboardTypeNumberPad;      
// 6 =  UIKeyboardTypePhonePad;  
// 7 =  UIKeyboardTypeNamePhonePad;
// 8 =  UIKeyboardTypeEmailAddress; 
// 9 =  UIKeyboardTypeDecimalPad;
// 10 =  UIKeyboardTypeTwitter;
// 11 =  UIKeyboardTypeWebSearch;

CustomKeyboard.open = function(value, keyboard, onChange, onFinished) {
    !keyboard && (keyboard = 1);
    !value && (value = '');
    value = '' + value;
    exec(onChange, onFinished, "CustomKeyboard", "open", [value, keyboard]);
};

CustomKeyboard.change = function(value) {
    !value && (value = '');
    value = '' + value;
    exec(null, null, "CustomKeyboard", "change", [value]);
};
module.exports = CustomKeyboard;
