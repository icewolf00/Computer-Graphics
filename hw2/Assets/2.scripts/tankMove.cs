using UnityEngine;
using System.Collections;

public class tankMove : MonoBehaviour {

	public float mSpeed = 50;
	public float rSpeed = 10;

	public Camera cam1;
	public Camera cam2;
	// Use this for initialization
	void Start () {
		// Destroy(gameObject, 10);
	}

	// Update is called once per frame
	void Update () {
		float h = Input.GetAxis ("Horizontal");//獲取水平軸向按鍵
		float v = Input.GetAxis ("Vertical");//獲取垂直軸向按鍵
		transform.Translate(0,0,-mSpeed * v);//根據垂直軸向按鍵來前進或後退
        transform.Rotate(0,rSpeed * h,0);//根據水平軸向按鍵來旋轉
        if (Input.GetKeyDown (KeyCode.C)) {
			cam1.enabled = !cam1.enabled;
			cam2.enabled = !cam2.enabled;
		}
    }
}
