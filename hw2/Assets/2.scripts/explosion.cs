using UnityEngine;
using System.Collections;

public class explosion : MonoBehaviour {
	public GameObject effect;//特效
	public GameObject dead;

	void Start () {
        Destroy(gameObject, 3);
    }	
	void Update () {
    }

	void OnCollisionEnter (Collision collision) {//碰撞發生時呼叫
		//碰撞後產生爆炸
			
		if(collision.gameObject.tag == "enemy"){//當撞到的collider具有enemy tag時
			Instantiate (effect, transform.position, transform.rotation);
			Destroy(gameObject);//刪除砲彈
			GameObject enemyhp = GameObject.Find("enemyhp");
			enemyhp.transform.Translate(-30,0,0);
			// Debug.Log(enemyhp.transform.position.x);
			if (enemyhp.transform.position.x <= -100){
				GameObject enemytank = GameObject.Find("enemy");
				Instantiate (dead, enemytank.transform.position, enemytank.transform.rotation);
				Destroy(enemytank);
				// Destroy(enemyhp);
			}
		}
		if(collision.gameObject.tag == "enemy2"){//當撞到的collider具有enemy tag時
			Instantiate (effect, transform.position, transform.rotation);
			Destroy(gameObject);//刪除砲彈
			GameObject enemy2hp = GameObject.Find("enemy2hp");
			enemy2hp.transform.Translate(-30,0,0);
			// Debug.Log(enemy2hp.transform.position.x);
			if (enemy2hp.transform.position.x <= -100){
				GameObject enemy2tank = GameObject.Find("enemy2");
				Instantiate (dead, enemy2tank.transform.position, enemy2tank.transform.rotation);
				Destroy(enemy2tank);
				// Destroy(enemyhp);
			}
		}
		if(collision.gameObject.tag == "Player"){//當撞到的collider具有tank tag時
			Instantiate (effect, transform.position, transform.rotation);
			Destroy(gameObject);//刪除砲彈
			GameObject playerhp = GameObject.Find("playerhp");
			GameObject enemyhp = GameObject.Find("enemyhp");
			GameObject enemy2hp = GameObject.Find("enemy2hp");

			Debug.Log(playerhp.transform.position.x);
			// Debug.Log(enemyhp.transform.position.x*0.1);
			// Vector3 haha = new Vector3(30-enemyhp.transform.position.x*0.1, 0, 0);
			playerhp.transform.Translate(30+(198-enemyhp.transform.position.x)/10,0,0);
			// playerhp.transform.Translate(30+(198-enemyhp.transform.position.x)/20+(198-enemy2hp.transform.position.x)/20,0,0);

			playerhp.transform.Translate(20,0,0);
			
			// Debug.Log(playerhp.transform.position.x);
			if (playerhp.transform.position.x >= 970){
				GameObject playertank = GameObject.Find("tank");
				Instantiate (dead, playertank.transform.position, playertank.transform.rotation);
				Destroy(playertank);
			}
		}
		
		if(collision.gameObject.tag == "bullet"){
			Instantiate (effect, transform.position, transform.rotation);
			Destroy(gameObject);
		}
	}
}
