using UnityEngine;
using System.Collections;

public class playerhealthBar : MonoBehaviour {
    public float maxHealth;
    public GameObject tank;
    // Use this for initialization
    void Start () {
        tank = GameObject.Find("tank");
	}
	
	// Update is called once per frame
	void Update () {
        // transform.localPosition = new Vector3(-98 + 96 * [HEALTH] / maxHealth, 2f, 0f);
    }
    void OnCollisionEnter (Collision collision) {//碰撞發生時呼叫
        //碰撞後產生爆炸
        
        if (collision.gameObject.tag == "bullet") {
            maxHealth = maxHealth - 10;
            // healthslider.value = maxHealth;
        }
        if (maxHealth <= 0)
            Destroy (this.gameObject);
        
    }
}
