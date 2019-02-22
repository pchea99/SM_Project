package com.sm.smapp;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    if (rationaleJustShown) {
      ActivityCompat.requestPermissions(this,
              new String[]{Manifest.permission.READ_CONTACTS},
              GET_CONTACTS_PERMISSION_REQUEST_ID);
    } else {
      if (ContextCompat.checkSelfPermission(this,
              Manifest.permission.READ_CONTACTS)
              != PackageManager.PERMISSION_GRANTED) {

        // Should we show an explanation?
        if (ActivityCompat.shouldShowRequestPermissionRationale(this,
                Manifest.permission.READ_CONTACTS)) {

          getContactsPermissionCallback.showRationale();

        } else {

          // No explanation needed, we can request the permission.

          ActivityCompat.requestPermissions(this,
                  new String[]{Manifest.permission.READ_CONTACTS},
                  GET_CONTACTS_PERMISSION_REQUEST_ID);
        }

      } else {
        getContactsPermissionCallback.granted();
      }
    }
  }
}
