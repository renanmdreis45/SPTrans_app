import 'package:flutter/material.dart';
import 'package:flutter_application_2/presentation/bloc/bus_line/bus_line_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusPage extends StatefulWidget {
  const BusPage({Key? key}) : super(key: key);

  @override
  State<BusPage> createState() => _BusPageState();
}

class _BusPageState extends State<BusPage> {
  ScrollPhysics? physics;
  String? query;

  @override
  void initState() {
    super.initState();
    setState(() {
      query = '';
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onChange(String value) {
    setState(() {
      query = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            SearchBar(
              onChanged: onChange,
            ),
            SizedBox(
              height: 30,
            ),
              ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      color: Colors.blueGrey,
                      child: Column(
                        children: [
                          Text('teste'),
                        ],
                      ),
                    );
                  }),
          ],
        ),
      ),
    );
  }
}
