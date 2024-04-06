package com.example.medical_prescription

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("0be2e38f-ada8-4f9e-b4d2-d6779485529b")
        super.configureFlutterEngine(flutterEngine)
    }
}
