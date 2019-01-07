using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Time : MonoBehaviour {

	public Text ClockText;

	// Use this for initialization
	void Start () { }

	// Update is called once per frame
	void Update () {
		ClockText.text = DateTime.Now.ToString ("HH:mm:ss");
	}
}