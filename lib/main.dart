//
// import 'package:flutter/material.dart';
// // import 'package:tap_google_pay_kit_flutter/models/model.dart';
// // import 'package:tap_google_pay_kit_flutter/tap_google_pay_kit_flutter.dart';
//
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   initGPay();
//   runApp(const MyApp());
// }
//
// initGPay(){
//   // TapGooglePayKitFlutter.configureSDK(
//   //   secretKey: "sk_test_xxxxxxxxxxxxxxxxxx",
//   //   bundleId: "com.example.gpay_integeration_poc",
//   //   countryCode: "US",
//   //   transactionCurrency: "USD",
//   //   sdkMode: SDKMode.Sandbox,
//   //   allowedMethods: AllowedMethods.ALL,
//   //   allowedCardNetworks: [AllowedCardNetworks.VISA.name],
//   //   gatewayID: "xxxxx",
//   //   gatewayMerchantID: "122xxxxx",
//   //   amount: "23",
//   //   // sdkCallbackMode: SDKCallbackMode.GetGooglePayToken,
//   // );
// }
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(width: double.maxFinite,),
//
//             Spacer(),
//             Text("Hello World"),
//             Spacer(),
//             // TapGooglePayKitFlutter.googlePayButton(
//             //   googlePayButtonType: GooglePayButtonType.NORMAL_GOOGLE_PAY,
//             //   onTap: () {
//             //     // Call available SDK Methods
//             //   },
//             // ),
//             Spacer(),
//             Spacer(),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class LimitedIndicator extends StatefulWidget {
//   const LimitedIndicator({
//     super.key,
//     required this.totalChildCount,
//     required this.currentIndex,
//     this.showChildCount = 6
//   });
//   final int totalChildCount;
//   final int currentIndex;
//   final int showChildCount;
//
//   @override
//   State<LimitedIndicator> createState() => _LimitedIndicatorState();
// }
//
// class _LimitedIndicatorState extends State<LimitedIndicator> {
//
//
//   int getCurrentIndex(){
//     if(widget.currentIndex < (widget.showChildCount-1)){
//       return widget.currentIndex;
//     }
//     else if(widget.currentIndex == widget.showChildCount){
//       return widget.currentIndex;
//     }
//     else {
//
//     }
//     return 0;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 150,
//       height: 50,
//       child: Row(
//         children: [
//           ...List.generate(
//             widget.showChildCount,
//             (index) => Container(
//               height: 8,
//               width: 8,
//               margin: const EdgeInsets.all(1.5),
//               decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.red,
//               ),
//             )
//           )
//         ],
//       )
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const platform = MethodChannel('com.example.app/native');

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter to Android Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _openSettingsActivity,
                child: const Text('Open MainActivity'),
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: _openMainActivity,
                child: const Text('Open MainActivity'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openMainActivity() async {
    try {
      await platform.invokeMethod('openMainActivity');
    } on PlatformException catch (e) {
      debugPrint("Failed to open MainActivity: '${e.message}'.");
    }
  }

  Future<void> _openSettingsActivity() async {
    try {
      await platform.invokeMethod('openSettingsActivity');
    } on PlatformException catch (e) {
      debugPrint("Failed to open MainActivity: '${e.message}'.");
    }
  }
}
