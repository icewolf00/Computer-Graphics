using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class healthBar : MonoBehaviour {
    public static float maxHealth = 100;
	// public float currentHealth = maxHealth;
	public float currentHealth = maxHealth;
    public GameObject enemy;

	// Use this for initialization
	void Start () {
        enemy = GameObject.Find("enemy");
    }

	// Update is called once per frame
	void Update () {
		
        // transform.localPosition = new Vector3(-98 + 96 * currentHealth / maxHealth, 2f, 0f);
	}
	// void OnCollisionEnter (Collision collision) {//碰撞發生時呼叫
	// 	//碰撞後產生爆炸
	// 	GameObject enemyhp = GameObject.Find("enemyhp");
	// 	if (collision.gameObject.tag == "enemy") {
	// 		enemyhp.CurrentHealth = enemyhp.CurrentHealth - 10.0;
	// 	}
	// 	if (enemyhp.CurrentHealth <= 0){
	// 		Destroy (this.gameObject);
	// 	}
	// }
}
