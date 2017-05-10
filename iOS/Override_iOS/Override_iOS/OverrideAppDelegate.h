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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Override_iOS.h"
#import "DeepLink.h"


@interface OverrideAppDelegate : NSObject


-(BOOL)application:(UIApplication*) application didFinishLaunchingWithOptions:(NSDictionary*) launchOptions;
-(BOOL)application:(UIApplication*) application
           openURL:(NSURL*) url
           options:(NSDictionary<NSString*, id>*) options;
-(BOOL)application:(UIApplication*) application
           openURL:(NSURL*) url
 sourceApplication:(NSString*) sourceApplication
        annotation:(id) annotation;

-(BOOL)_original_saved_by_Override_application:(UIApplication*) application
                 didFinishLaunchingWithOptions:(NSDictionary*) launchOptions;
-(BOOL)_original_saved_by_Override_application:(UIApplication*) application
                                       openURL:(NSURL*) url
                                       options:(NSDictionary<NSString*, id>*) options;
-(BOOL)_original_saved_by_Override_application:(UIApplication*) application
                                       openURL:(NSURL*) url
                             sourceApplication:(NSString*) sourceApplication
                                    annotation:(id) annotation;


@end
