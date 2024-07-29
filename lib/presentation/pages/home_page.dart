import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/models/position.dart';
import 'package:flutter_application_2/presentation/bloc/position/position_bloc.dart';
import 'package:flutter_application_2/presentation/bloc/position/position_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollPhysics? physics;
  late GoogleMapController mapController;
  late PositionBloc _positionBloc;
  List<L>? positions;
  final Set<Marker> _markers = {};
  String? stopQuery = "";

  final LatLng _center = const LatLng(-23.562941, -46.654262);

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _addPositionsMarkers(List<V> positions) {
    List<Marker> newPositions = positions.map((e) {
      return Marker(
          markerId: MarkerId(e.p.toString()),
          position: LatLng(e.py, e.px),
          icon: BitmapDescriptor.defaultMarker);
    }).toList();

    setState(() {
      newPositions.forEach((element) {
        _markers.add(element);
      });
    });
  }

  void onChangeSearchStop(String value) {
    setState(() {
      stopQuery = value;
    });
  }

  void searchStop(String value) {
    
    setState(() {
      stopQuery = value;
    });
  }

  void _clearMarkers() {
    setState(() {
      _markers.clear();
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(target: _center, zoom: 11),
          onMapCreated: _onMapCreated,
          markers: _markers,
        ),
        BlocBuilder(builder: (context, state) {
          return SearchBar(
            onTap: () {},
            onChanged: onChangeSearchStop,
          );
        }),
        Container(
          padding: const EdgeInsets.only(top: 104, right: 12),
          alignment: Alignment.topRight,
          child: Column(
            children: [
              BlocBuilder<PositionBloc, PositionState>(
                builder: (context, state) {
                  if (state is PositionDone) {
                    return FloatingActionButton(
                      onPressed: () {
                        if (_markers.isEmpty) {
                          if (state.position!.l.isNotEmpty) {
                            state.position!.l.forEach((element) {
                              if (element.vs.isNotEmpty) {
                                _addPositionsMarkers(element.vs);
                              }
                            });
                          }
                        } else {
                          _clearMarkers();
                        }
                      },
                      backgroundColor: Colors.blue,
                      child: const Icon(
                        Icons.bus_alert_sharp,
                      ),
                    );
                  }
                  return const SizedBox(
                    height: 20,
                  );
                },
              ),
            ],
          ),
        )
      ]),
    );
  }
}