import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yandex_maps_mapkit/mapkit.dart';
import 'package:yandex_maps_mapkit/yandex_map.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapWindow _mapWindow;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shape: const Border(
              bottom: BorderSide(color: Colors.black12, width: 1)
          ),
          leading: IconButton(
            icon: const Icon(Iconsax.arrow_left),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text("Nearest pharmacies", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700),),
          centerTitle: true,
        ),
        body: YandexMap(
          onMapCreated: (mapWindow) {
            _mapWindow = mapWindow;
            // _mapWindow?.map.move(
            //     const CameraPosition(
            //         Point(latitude: 55.751225, longitude: 37.629540),
            //         zoom: 17.0,
            //         azimuth: 150.0,
            //         tilt: 30.0
            //     )
            // );
            },
        ),
      ),
    );
  }

  /*ClusterizedPlacemarkCollection _getClusterizedCollection({
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
  }*/
}