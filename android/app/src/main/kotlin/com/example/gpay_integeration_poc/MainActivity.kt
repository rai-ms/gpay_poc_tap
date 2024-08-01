package com.example.gpay_integeration_poc

import android.content.Intent
import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.app/native"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "openMainActivity") {
                openMainActivity()
                result.success(null)
            } else if (call.method == "openSettingsActivity") {
                openSettingsActivity()
                result.success(null)
            }
            else {
                result.notImplemented()
            }
        }
    }

    private fun openMainActivity() {
        val intent = Intent(this, MainActivity2::class.java)
        startActivity(intent)
    }
    private fun openSettingsActivity() {
        val intent = Intent(this, SettingsActivity::class.java)
        startActivity(intent)
    }

}
