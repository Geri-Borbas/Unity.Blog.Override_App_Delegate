//
// Copyright (c) 2017 eppz! mobile, Gergely Borbás (SP)
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

#import "Override_iOS.h"


__strong Override_iOS *_instance;



@implementation Override_iOS


+(void)load
{
    NSLog(@"[Override_iOS load]");
    [self swizzle];
    
    _instance = [Override_iOS new];
    _instance.URL = @"Greetings from iOS!";
}

+(Override_iOS*)instance
{ return _instance; }

+(void)swizzle
{
    NSLog(@"[Override_iOS swizzle]");
    
    [self replaceAppDelegateMethod:@selector(application:didFinishLaunchingWithOptions:)
                         fromClass:OverrideAppDelegate.class
                  savingOriginalTo:@selector(_original_saved_by_Override_application:didFinishLaunchingWithOptions:)];
    
    [self replaceAppDelegateMethod:@selector(application:openURL:options:)
                         fromClass:OverrideAppDelegate.class
                  savingOriginalTo:@selector(_original_saved_by_Override_application:openURL:options:)];
    
    [self replaceAppDelegateMethod:@selector(application:openURL:sourceApplication:annotation:)
                         fromClass:OverrideAppDelegate.class
                  savingOriginalTo:@selector(_original_saved_by_Override_application:openURL:sourceApplication:annotation:)];
}

+(void)replaceAppDelegateMethod:(SEL) unitySelector
                      fromClass:(Class) overrideAppDelegate
               savingOriginalTo:(SEL) savingOriginalSelector
{
    // The Unity base app controller class (the class name stored in `AppControllerClassName`).
    Class unityAppDelegate = NSClassFromString(@"UnityAppController");
    
    // See log messages for the sake of this tutorial.
    [EPPZSwizzler setLogging:YES];
    
    // Add empty placholder to Unity app delegate.
    [EPPZSwizzler addInstanceMethod:savingOriginalSelector
                            toClass:unityAppDelegate
                          fromClass:overrideAppDelegate];
    
    // Save the original Unity app delegate implementation into.
    [EPPZSwizzler swapInstanceMethod:savingOriginalSelector
                  withInstanceMethod:unitySelector
                             ofClass:unityAppDelegate];
    
    // Replace Unity app delegate with ours.
    [EPPZSwizzler replaceInstanceMethod:unitySelector
                                ofClass:unityAppDelegate
                              fromClass:overrideAppDelegate];
}


@end
