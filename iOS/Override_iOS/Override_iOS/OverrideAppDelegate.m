//
// Copyright (c) 2016 eppz! mobile, Gergely Borbás (SP)
//
// http://www.twitter.com/_eppz
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
// PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
// OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "OverrideAppDelegate.h"


@implementation OverrideAppDelegate


#pragma mark Override implementations

-(BOOL)application:(UIApplication*) application didFinishLaunchingWithOptions:(NSDictionary*) launchOptions
{
    NSLog(@"[OverrideAppDelegate application:%@ didFinishLaunchingWithOptions:%@]", application, launchOptions);
    return [self _original_saved_by_Override_application:application
                           didFinishLaunchingWithOptions:launchOptions];
}

-(BOOL)application:(UIApplication*) application
           openURL:(NSURL*) url
           options:(NSDictionary<NSString*, id>*) options
{
    NSLog(@"[OverrideAppDelegate application:%@ openURL:%@ options:%@]", application, url, options);
    [DeepLink instance].URL = url.absoluteString;
    [DeepLink instance].sourceAppliaction = options[UIApplicationOpenURLOptionsSourceApplicationKey];
    [DeepLink instance].annotation = options[UIApplicationOpenURLOptionsAnnotationKey];
    return [self _original_saved_by_Override_application:application
                                                 openURL:url
                                                 options:options];
}

-(BOOL)application:(UIApplication*) application
           openURL:(NSURL*) url
 sourceApplication:(NSString*) sourceApplication
        annotation:(id) annotation
{
    NSLog(@"[OverrideAppDelegate application:%@ openURL:%@ sourceApplication:%@ annotation:%@]", application, url, sourceApplication, annotation);
    [DeepLink instance].URL = url.absoluteString;
    [DeepLink instance].sourceAppliaction = sourceApplication;
    [DeepLink instance].annotation = annotation;
    return [self _original_saved_by_Override_application:application
                                                 openURL:url
                                       sourceApplication:sourceApplication
                                              annotation:(annotation) ? annotation : [NSDictionary new]];
}


#pragma mark Original implementation placeholders

-(BOOL)_original_saved_by_Override_application:(UIApplication*) application
                 didFinishLaunchingWithOptions:(NSDictionary*) launchOptions
{ return YES; }


-(BOOL)_original_saved_by_Override_application:(UIApplication*) application
                                       openURL:(NSURL*) url
                                       options:(NSDictionary<NSString*, id>*) options
{ return YES; }


-(BOOL)_original_saved_by_Override_application:(UIApplication*) application
                                       openURL:(NSURL*) url
                             sourceApplication:(NSString*) sourceApplication
                                    annotation:(id) annotation
{ return YES; }


@end
