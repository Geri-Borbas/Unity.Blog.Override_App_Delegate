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

-(void)applicationDidFinishLaunching:(NSNotification*) notification
{
    NSLog(@"[OverrideAppDelegate applicationDidFinishLaunching:%@]", notification);
    return [self _original_saved_by_Override_applicationDidFinishLaunching:notification];
}


#pragma mark Original implementation placeholders

-(void)_original_saved_by_Override_applicationDidFinishLaunching:(NSNotification*) notification
{ return; }


@end
