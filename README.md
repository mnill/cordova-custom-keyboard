Custom Keyboards For iOS
======

Description
-------------------
This plugin for open any native iOS keyboard in cordova app.

Installation
-------
~~~
cordova plugin add https://github.com/mnill/cordova-custom-keyboard
~~~

Methods
-------

- CustomKeyboard.open(startedValue, keyboardType, changedCb, finishedCb);
- CustomKeyboard.change(newValue);

Description.
-------
Our plugin creating invisible textview and you need to call 'change' if you want to correct user input;

Available keyboards:
-------
1 =  UIKeyboardTypeDefault;  
2 =  UIKeyboardTypeASCIICapable;  
3 = UIKeyboardTypeNumbersAndPunctuation;  
4 =  UIKeyboardTypeURL;  
5 =  UIKeyboardTypeNumberPad;  
6 =  UIKeyboardTypePhonePad;  
7 =  UIKeyboardTypeNamePhonePad;  
8 =  UIKeyboardTypeEmailAddress;  
9 =  UIKeyboardTypeDecimalPad;  
10 =  UIKeyboardTypeTwitter;  
11 =  UIKeyboardTypeWebSearch;  


Quick Example
-------------
~~~
document.getElementById('decimal').onclick = function() {
  CustomKeyboard.open(document.getElementById('decimal').value, 9, function (value) {
    //fired every time when value changed
      document.getElementById('decimal').value = value;
    }, function (value) {
      alert('Editing ended with ' + value);
      fired once when user finished editing.
    })
}
~~~

Supported Platforms
-------------------

- iOS


License
-------------------

MIT
