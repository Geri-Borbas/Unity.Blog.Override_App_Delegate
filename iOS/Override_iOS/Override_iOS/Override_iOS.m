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
    _instance = [Override_iOS new];
    _instance.URL = @"Greetings from iOS!";
    [[NSNotificationCenter defaultCenter] addObserver:_instance
                                             selector:@selector(applicationDidFinishLaunching:)
                                                 name:UIApplicationDidFinishLaunchingNotification
                                               object:nil];

}

+(Override_iOS*)instance
{ return _instance; }

-(void)applicationDidFinishLaunching:(NSNotification*) notification
{
    NSLog(@"[Override_iOS applicationDidFinishLaunching:%@]", notification);
    
    // Store URL, if any.
    if (notification.userInfo == nil) return;
    if ([notification.userInfo.allKeys containsObject:UIApplicationLaunchOptionsURLKey] == NO) return;
    self.URL = [[notification.userInfo objectForKey:UIApplicationLaunchOptionsURLKey] absoluteString];
}


@end
