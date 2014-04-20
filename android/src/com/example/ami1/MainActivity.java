package com.example.ami1;

import android.os.Bundle;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.app.Activity;
import android.content.Intent;

public class MainActivity extends Activity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
	final Button click=(Button)findViewById(R.id.button1);
		click.setOnClickListener(new View.OnClickListener() {
			
			 
public void onClick(View v) {
	Intent myIntent=new Intent(MainActivity.this,DescriptionActivity.class);
	startActivity(myIntent);
	
}
		});
		final Button click1=(Button)findViewById(R.id.button2);
		click1.setOnClickListener(new View.OnClickListener() {
			
			 
public void onClick(View v) {
	Intent myIntent=new Intent(MainActivity.this,CheckActivity.class);
	startActivity(myIntent);
	
}
		});
	}
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

}
