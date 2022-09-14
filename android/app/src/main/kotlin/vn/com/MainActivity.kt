package vn.com.revup_provider

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import com.google.android.gms.maps.MapsInitializer
import com.google.android.gms.maps.MapsInitializer.Renderer
import com.google.android.gms.maps.OnMapsSdkInitializedCallback

class MainActivity: FlutterActivity(), OnMapsSdkInitializedCallback{
    override 
    fun onCreate(savedInstanceState: Bundle?){
        super.onCreate(savedInstanceState);
        MapsInitializer.initialize(applicationContext, Renderer.LATEST, this)
    }
    override
    fun onMapsSdkInitialized(renderer: MapsInitializer.Renderer) {
    }
}
