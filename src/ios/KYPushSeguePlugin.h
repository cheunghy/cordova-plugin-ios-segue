
#import <Cordova/CDV.h>

@interface KYPushSeguePlugin : CDVPlugin

@property (nonatomic, strong) NSString *senderCommand;

- (void)performSegueWithUrlCommand:(CDVInvokedUrlCommand *)urlCommand;

@end
