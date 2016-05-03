#import <Cordova/CDVPlugin.h>

@interface CDVCustomKeyboard : CDVPlugin {
}
@property (nonatomic, copy) NSString* callbackId;
@property (nonatomic, copy) NSString* inputId;
@property (nonatomic) UIKeyboardType keyboardType;

- (void)open:(CDVInvokedUrlCommand*)command;
- (void)close:(CDVInvokedUrlCommand*)command;
- (void)change:(CDVInvokedUrlCommand*)command;

@end
