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

#import "UnityString_C++.mm"
#import "DeepLink.h"


extern "C"
{
    

    void DeepLink_Reset()
    { return [[DeepLink instance] reset]; }
    
    const char* DeepLink_GetURL()
    { return UnityStringFromNSString([[DeepLink instance] URL]); }
    
    const char* DeepLink_GetSourceApplication()
    { return UnityStringFromNSString([[DeepLink instance] sourceAppliaction]); }
    
    
}

