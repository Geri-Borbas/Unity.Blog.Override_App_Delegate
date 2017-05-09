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
    
    // The Unity base app controller class (the class name stored in `AppControllerClassName`).
    Class unityAppDelegate = NSClassFromString(@"UnityAppController");
    Class overrideAppDelegate = OverrideAppDelegate.class;
    
    // See log messages for the sake of this tutorial.
    [EPPZSwizzler setLogging:YES];
    
    // Add empty placholder to Unity app delegate.
    [EPPZSwizzler addInstanceMethod:@selector(_original_saved_by_Override_application:didFinishLaunchingWithOptions:)
                            toClass:unityAppDelegate
                          fromClass:overrideAppDelegate];
    
    // Save the original Unity app delegate implementation into.
    [EPPZSwizzler swapInstanceMethod:@selector(_original_saved_by_Override_application:didFinishLaunchingWithOptions:)
                  withInstanceMethod:@selector(application:didFinishLaunchingWithOptions:)
                             ofClass:unityAppDelegate];
    
    // Replace Unity app delegate with ours.
    [EPPZSwizzler replaceInstanceMethod:@selector(application:didFinishLaunchingWithOptions:)
                                ofClass:unityAppDelegate
                              fromClass:overrideAppDelegate];
}


@end
