// maps
import 'dart:async';
import 'dart:collection';
import 'package:airlo_google_map/filterDialogBox.dart';
import 'package:airlo_google_map/select_list_controller.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: MapSample(),
  ));
}

//filter Dialogbox List
List<String> defaultList = [
  'Distance',
  'Area',
  'Business Type',
  'Vehicle Type'
];
//filter Dialogbox List

Set<Polygon> _polygons = HashSet<Polygon>();

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(17.2823567, 78.5387200),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(17.2823567, 78.5387200),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        polygons: _polygons,
        onTap: (data) {

        },
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('Take me to Hostel!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}

//filters page

class MyHomePage extends StatelessWidget {
  var controller = Get.put(SelectedListContoller());
// void openFilterDialog(context) async {
//       await FilterListDialog.display<String>(context,
//           listData: defaultList,
//           selectedListData: controller.getSelectedList(),
//           headlineText: 'Your Filters',
//           //closeIconColor: Colors.grey,
//           choiceChipLabel: (item) => item,
//           validateSelectedItem: (list, val) => list!.contains(val),
//           onItemSearch: (list, text) {
//             if (list!.any((element) =>
//                 element.toLowerCase().contains(text.toLowerCase()))) {
//               return list
//                   .where((element) =>
//                       element.toLowercase().contains(text.toLowerCase()))
//                   .toList();
//             } else
//                   return [];
//           },
//           onApplyButtonClick: (list) {
//             controller.setSelectedList(List<String>.from(list!));
//             Navigator.of(context).pop();
//           },
//     }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FilterBox()));
        },
      ),
    ));
  }
}
