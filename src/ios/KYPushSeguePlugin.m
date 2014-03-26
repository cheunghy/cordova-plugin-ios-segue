

#import "KYPushSeguePlugin.h"

@implementation KYPushSeguePlugin

- (void)performSegueWithUrlCommand:(CDVInvokedUrlCommand *)urlCommand
{
    CDVPluginResult* pluginResult = nil;
    
    if (![urlCommand.arguments firstObject] || [urlCommand.arguments count] > 2) {
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        
    } else {
        if ([urlCommand.arguments firstObject] != [urlCommand.arguments lastObject]) {
            self.senderCommand = urlCommand.arguments[1];
        } else {
            self.senderCommand = nil;
        }
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        NSString *segueIdentifier = [urlCommand.arguments firstObject];
        if (self.viewController.storyboard) {
            [self.viewController performSegueWithIdentifier:segueIdentifier sender:self];
        } else if (self.viewController.parentViewController) {
            [self.viewController.parentViewController performSegueWithIdentifier:segueIdentifier sender:self];
        }
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:urlCommand.callbackId];
    
}

@end
