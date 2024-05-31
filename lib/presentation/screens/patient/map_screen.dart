import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/presentation/components/modal_body_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../domain/entities/mapPoint.dart';
import '../../components/cluster_icon_pointer.dart';


class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final YandexMapController _mapController;
  var _mapZoom = 0.0;

  CameraPosition? _userLocation;

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
            icon: const Icon(Iconsax.arrow_left),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text("Nearest pharmacies", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),),
          centerTitle: true,
        ),
        body: YandexMap(
          onMapCreated: (controller) async {
            _mapController = controller;
            await _initLocationLayer();
          },
          mapObjects: [
            _getClusterizedCollection(
              placemarks: _getPlacemarkObjects(context),
            )
          ],
          onCameraPositionChanged: (cameraPosition, _, __) {
            setState(() {
              _mapZoom = cameraPosition.zoom;
            });
          },
          onUserLocationAdded: (view) async {
            // получаем местоположение пользователя
            _userLocation = await _mapController.getUserCameraPosition();
            // если местоположение найдено, центрируем карту относительно этой точки
            if (_userLocation != null) {
              await _mapController.moveCamera(
                CameraUpdate.newCameraPosition(
                  _userLocation!.copyWith(zoom: 10),
                ),
                animation: const MapAnimation(
                  type: MapAnimationType.linear,
                  duration: 0.3,
                ),
              );
            }
            // меняем внешний вид маркера - делаем его непрозрачным
            return view.copyWith(
              pin: view.pin.copyWith(
                opacity: 1,
              ),
            );
          },
        ),
      ),
    );
  }

  ClusterizedPlacemarkCollection _getClusterizedCollection({
    required List<PlacemarkMapObject> placemarks,
  }) {
    return ClusterizedPlacemarkCollection(
        mapId: const MapObjectId('clusterized-1'),
        placemarks: placemarks,
        radius: 30,
        minZoom: 12,
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

  Future<void> _initLocationLayer() async {
    final locationPermissionIsGranted = await Permission.location.request().isGranted;


    if (locationPermissionIsGranted) {
      await _mapController.toggleUserLayer(visible: true);
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Нет доступа к местоположению пользователя'),
          ),
        );
      });
    }
  }
}

List<MapPoint> _getMapPoints() {
  return const [
    MapPoint(name: 'EuroPharma', latitude: 51.169165, longitude: 71.413269),
    MapPoint(name: 'EuroPharma', latitude: 51.119507, longitude: 71.414026),
    MapPoint(name: 'EuroPharma', latitude: 51.172383, longitude: 71.404707),
    MapPoint(name: 'EuroPharma', latitude: 51.112141, longitude: 71.406288),
    MapPoint(name: 'EuroPharma', latitude: 51.121835, longitude: 71.420844),
    MapPoint(name: 'EuroPharma', latitude: 51.105108, longitude: 71.429395),
    MapPoint(name: 'EuroPharma', latitude: 51.101299, longitude: 71.428382),
  ];
}


/// Метод для генерации объектов маркеров для отображения на карте
List<PlacemarkMapObject> _getPlacemarkObjects(BuildContext context) {
  return _getMapPoints()
      .map(
        (point) => PlacemarkMapObject(
      mapId: MapObjectId('MapObject $point'),
      point: Point(latitude: point.latitude, longitude: point.longitude),
      opacity: 1,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
          image: BitmapDescriptor.fromAssetImage(
            "assets/icons/map_point.png",
          ),
          scale: 0.35,
        ),
      ),
      // icon: PlacemarkIcon.composite(
      //     [
      //
      //     ]
      // ),
      /*text: PlacemarkText(
          text: 'Pharmachy',
          style: PlacemarkTextStyle(

          )
      ),*/
      onTap: (_, __) => showModalBottomSheet(
        isScrollControlled: true,
          context: context,
          builder: (context) => ModalBodyView(point: point)
      ),
    ),
  ).toList();
}