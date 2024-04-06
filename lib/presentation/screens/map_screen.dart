import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medical_prescription/presentation/pages/home_page.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:iconsax/iconsax.dart';
import '../../data/models/map_point.dart';
import 'map/AppLatLang.dart';
import 'map/clusterized_icon_painter.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final YandexMapController _mapController;
  var _mapZoom = 0.0;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: const Border(
              bottom: BorderSide(color: Colors.black12, width: 1)
          ),
          leading: IconButton(
            onPressed: (){
              homePageIndex.value = 0;
            },
            icon: const Icon(Iconsax.arrow_left)),
          title: Text("Nearest pharmacies", style: Theme.of(context).textTheme.headlineSmall,),
          centerTitle: true,
        ),
        body: YandexMap(
          onMapCreated: (controller) async{
            _mapController = controller;
            await _mapController.moveCamera(
              CameraUpdate.newCameraPosition(
                 CameraPosition(
                  target: Point(latitude: AstanaLocation().lat, longitude: AstanaLocation().long),
                  zoom: 11,
                ),
              ),
            );
          },
          onCameraPositionChanged: (cameraPosition, _, __) {
            setState(() {
              _mapZoom = cameraPosition.zoom;
            });
          },
          mapObjects: [
            _getClusterizedCollection(
              placemarks: _getPlacemarkObjects(context),
            ),
          ],
        ),
      ),
    );
  }

  ClusterizedPlacemarkCollection _getClusterizedCollection({
    required List<PlacemarkMapObject> placemarks,}){
    return ClusterizedPlacemarkCollection(
      mapId: const MapObjectId('clusterized-1'),
      placemarks: placemarks,
      radius: 50,
      minZoom: 11,
      onClusterAdded: (self, cluster) async {
        return cluster.copyWith(
          appearance: cluster.appearance.copyWith(
            opacity: 1.0,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromBytes(
                  await ClusterIconPainter(cluster.size)
                      .getClusterIconBytes(),
                ),
              ),
            ),
          ),
        );
      },
      onClusterTap: (self, cluster) async {
        await _mapController.moveCamera(
          animation: const MapAnimation(
              type: MapAnimationType.linear, duration: 0.3),
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: cluster.placemarks.first.point,
              zoom: _mapZoom + 1,
            ),
          ),
        );
      });
  }

  List<MapPoint> _getMapPoints(){
    return const [
      MapPoint(name: "Europharma", lat: 51.160427, long: 71.409413),
      MapPoint(name: "Sante", lat: 51.161275, long: 71.411213),
      MapPoint(name: "So sklada", lat: 51.161318, long: 71.409346)
    ];
  }

  List<PlacemarkMapObject> _getPlacemarkObjects(BuildContext context){
    return _getMapPoints().map(
      (point) => PlacemarkMapObject(
        mapId: MapObjectId('MapObject $point'),
        point: Point(latitude: point.lat, longitude: point.long),
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage("assets/icons/pin.png"),
          scale: 1,
        ))
      )
    ).toList();
  }
}