package com.exemplo.nutriscan

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
}
package com.exemplo.nutriscan

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.exemplo.nutriscan/platform" // Nome do canal para comunicação

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "getAndroidVersion") {
                val androidVersion = android.os.Build.VERSION.RELEASE
                result.success(androidVersion)
            } else {
                result.notImplemented()
            }
        }
    }
}