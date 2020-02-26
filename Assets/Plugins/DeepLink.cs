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

using UnityEngine;
using UnityEngine.UI;
using System.Runtime.InteropServices;
using UnityEngine.Events;

public class DeepLink : MonoBehaviour
{

    public static string LastURL;
    [System.Serializable]
    public class StringEvent : UnityEvent<string> { }
    public StringEvent urlOpenedEvent;

#if !UNITY_EDITOR && (UNITY_IOS || UNITY_STANDALONE_OSX)

	[DllImport("__Internal")]
	static extern void DeepLink_Reset();

	[DllImport("__Internal")]
	static extern string DeepLink_GetURL();	

	[DllImport("__Internal")]
	static extern string DeepLink_GetSourceApplication();		


	void OnEnable()	
    {
        if (DeepLink_GetURL() == "") return;
		LastURL = DeepLink_GetURL();

        urlOpenedEvent.Invoke(url);

		DeepLink_Reset();


    }

#endif


}
