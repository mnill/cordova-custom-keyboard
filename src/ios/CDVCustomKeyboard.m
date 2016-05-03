#import "CDVCustomKeyboard.h"

@interface CDVCustomKeyboard ()<UITextViewDelegate>

@property (nonatomic, readwrite, assign) BOOL keyboardIsVisible;

@end

@implementation CDVCustomKeyboard

UITextView *hiddenTextView;

- (void)pluginInitialize
{
    if (hiddenTextView == NULL) {
        hiddenTextView = [[UITextView alloc] init];
        hiddenTextView.alpha = 0;
        hiddenTextView.autocorrectionType = UITextAutocorrectionTypeNo;
        hiddenTextView.bounds = CGRectMake(0, 0, 0, 0);
        hiddenTextView.keyboardType = UIKeyboardTypeDecimalPad;
        hiddenTextView.delegate = self;
        [self.viewController.view addSubview:hiddenTextView];
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    NSString *text = textView.text;
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:text];
    [pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult  callbackId:self.callbackId];
}

- (void) textViewDidEndEditing:(UITextView *)textView {
    NSString *text = textView.text;
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:text];
    [self.commandDelegate sendPluginResult:pluginResult  callbackId:self.callbackId];
}

- (void)open:(CDVInvokedUrlCommand*)command
{
    self.callbackId = command.callbackId;
    NSString *startedValue = [command argumentAtIndex:0];
    NSInteger keyBoardTypeInt = [[command argumentAtIndex:1] integerValue];
    
    switch (keyBoardTypeInt) {
        case 1:
            self.keyboardType =  UIKeyboardTypeDefault;                // Default type for the current input method.
            break;
        case 2:
            self.keyboardType =  UIKeyboardTypeASCIICapable;                // Default type for the current input method.
            break;
        case 3:
            self.keyboardType =  UIKeyboardTypeNumbersAndPunctuation;                // Default type for the current input method.
            break;
        case 4:
            self.keyboardType =  UIKeyboardTypeURL;                // Default type for the current input method.
            break;
        case 5:
            self.keyboardType =  UIKeyboardTypeNumberPad;                // Default type for the current input method.
            break;
        case 6:
            self.keyboardType =  UIKeyboardTypePhonePad;                // Default type for the current input method.
            break;
        case 7:
            self.keyboardType =  UIKeyboardTypeNamePhonePad;                // Default type for the current input method.
            break;
        case 8:
            self.keyboardType =  UIKeyboardTypeEmailAddress;                // Default type for the current input method.
            break;
        case 9:
            self.keyboardType =  UIKeyboardTypeDecimalPad;                // Default type for the current input method.
            break;
        case 10:
            self.keyboardType =  UIKeyboardTypeTwitter;                // Default type for the current input method.
            break;
        case 11:
            self.keyboardType =  UIKeyboardTypeWebSearch;                // Default type for the current input method.
            break;
        default:
            self.keyboardType =  keyBoardTypeInt;
            break;
    }
    hiddenTextView.keyboardType = self.keyboardType;
    hiddenTextView.text = startedValue;
    [hiddenTextView becomeFirstResponder];
}

- (void)close:(CDVInvokedUrlCommand*)command
{
    [self.webView becomeFirstResponder];
    [hiddenTextView resignFirstResponder];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK]  callbackId:command.callbackId];
}

- (void)change:(CDVInvokedUrlCommand*)command
{
    NSString *value = [command argumentAtIndex:0];
    hiddenTextView.text = value;
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


@end
