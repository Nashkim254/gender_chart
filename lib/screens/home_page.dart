import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gender_chart/constants/constants.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String men;
  String women;
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      'Men': double.parse(men ?? '60'),
      'Women': double.parse(women ?? '40')
    };
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: kPrimaryColor,
        leading: Icon(
          Icons.arrow_back_ios,
          color: kIconColor,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            SizedBox(height: 210.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      'Men',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      'Women',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          men = value;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'Input value',
                          enabledBorder: OutlineInputBorder()),
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          women = value;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'Input value',
                          enabledBorder: OutlineInputBorder()),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              color: kContainerColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Gender:',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: PieChart(
                      dataMap: dataMap,
                      colorList: colorList,
                      legendOptions: LegendOptions(
                          legendPosition: LegendPosition.bottom,
                          showLegendsInRow: true,
                          legendShape: BoxShape.rectangle),
                      chartRadius: MediaQuery.of(context).size.width / 2,
                      chartValuesOptions: ChartValuesOptions(
                          showChartValueBackground: false,
                          showChartValuesInPercentage: true),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DotsIndicator(
                dotsCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
