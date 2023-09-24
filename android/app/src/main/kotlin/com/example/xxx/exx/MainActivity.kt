package com.example.xxx.exx
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.UUID

class MainActivity: FlutterActivity() {
    private val channelName = "GETID"
    override fun configureFlutterEngine(flutterEngine : FlutterEngine){
        super.configureFlutterEngine(flutterEngine)

        var channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,channelName)
        channel.setMethodCallHandler{ call,result->
            var deviceUuidFactory = DeviceUuidFactory(this);
            var id  = deviceUuidFactory.deviceUuid
            var idstr = id.toString()
            if (call.method == "getid"){
                result.success(idstr);
            }
        }
    }
}
