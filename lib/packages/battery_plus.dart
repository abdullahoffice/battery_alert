// // Copyright 2020 The Chromium Authors. All rights reserved.
// // Use of this source code is governed by a BSD-style license that can be
// // found in the LICENSE file.
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:battery_plus/battery_plus.dart';

// class BatteryPlus extends StatefulWidget {
//   const BatteryPlus({super.key});

//   @override
//   State<BatteryPlus> createState() => _BatteryPlusState();
// }

// class _BatteryPlusState extends State<BatteryPlus> {
//   final Battery _battery = Battery();

//   BatteryState? _batteryState;
//   StreamSubscription<BatteryState>? _batteryStateSubscription;

//   @override
//   void initState() {
//     super.initState();
//     _battery.batteryState.then(_updateBatteryState);
//     _batteryStateSubscription =
//         _battery.onBatteryStateChanged.listen(_updateBatteryState);
//   }

//   void _updateBatteryState(BatteryState state) {
//     if (_batteryState == state) return;
//     setState(() {
//       _batteryState = state;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Battery plus example app'),
//         elevation: 4,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               '${(_batteryState)} hh',
//               style: const TextStyle(fontSize: 24),
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () {
//                 _battery.batteryLevel.then(
//                   (batteryLevel) {
//                     showDialog<void>(
//                       context: context,
//                       builder: (_) => AlertDialog(
//                         content: Text('Battery: $batteryLevel%'),
//                         actions: <Widget>[
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: const Text('OK'),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//               child: const Text('Get battery level'),
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () {
//                 _battery.isInBatterySaveMode.then(
//                   (isInPowerSaveMode) {
//                     showDialog<void>(
//                       context: context,
//                       builder: (_) => AlertDialog(
//                         title: const Text(
//                           'Is in Battery Save mode?',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         content: Text(
//                           "$isInPowerSaveMode",
//                           style: const TextStyle(fontSize: 18),
//                         ),
//                         actions: <Widget>[
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: const Text('Close'),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//               child: const Text('Is in Battery Save mode?'),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     if (_batteryStateSubscription != null) {
//       _batteryStateSubscription!.cancel();
//     }
//   }
// }
