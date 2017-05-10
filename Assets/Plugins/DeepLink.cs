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


public class DeepLink : MonoBehaviour
{


	public Text label;


#if !UNITY_EDITOR && UNITY_IOS

	[DllImport("__Internal")]
	static extern void DeepLink_Reset();

	[DllImport("__Internal")]
	static extern string DeepLink_GetURL();	

	[DllImport("__Internal")]
	static extern string DeepLink_GetSourceApplication();		


	void OnApplicationFocus(bool focused)	
    {
		if (focused == false) return; // Only if application has focused
        if (DeepLink_GetURL() == "") return; // Only having any URL passed

		label.text = DeepLink_GetURL().Replace("override://", ""); // Expose to UI
		DeepLink_Reset(); // Mark the data consumed
    }

#endif


}
