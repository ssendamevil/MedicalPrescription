package com.example.medical_prescription

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("58a89df6-4587-471d-8ddd-c8470e7f980a")
        super.configureFlutterEngine(flutterEngine)
    }
}
