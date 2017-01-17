using UnityEngine;
using System.Collections;

public class Obstacle : MonoBehaviour {
    public float speed;

	// Use this for initialization
	void Start () {
        Destroy(this.gameObject, 2f);
	}
	
	// Update is called once per frame
	void Update () {
        transform.Translate(speed, 0, 0);
	}

    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "bullet" || other.gameObject.tag == "Player")
        {
            Destroy(other.gameObject);
            Destroy(this.gameObject);
        }
    }
}
