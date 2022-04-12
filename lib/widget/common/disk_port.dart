import 'package:flutter/material.dart';
import 'package:transaction_plus/model/user.dart';
import 'package:transaction_plus/utils/screen.dart';

class DiskPortDetailPage extends StatefulWidget {
  @override
  _DiskPortDetailState createState() => _DiskPortDetailState();
}

class DiskPortDetail {
  String? name;
  String? code;
  String? value;

  DiskPortDetail({this.name, this.value, this.code});
}

class _DiskPortDetailState extends State<DiskPortDetailPage> {
  List<DiskPortDetail> disk = [];
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    disk = [
      DiskPortDetail()
        ..code = '146190'
        ..name = '卖五'
        ..value = '2',
      DiskPortDetail()
        ..code = '146190'
        ..name = '卖五'
        ..value = '4',
      DiskPortDetail()
        ..code = '146190'
        ..name = '卖五'
        ..value = '15',
      DiskPortDetail()
        ..code = '146190'
        ..name = '卖五'
        ..value = '10',
      DiskPortDetail()
        ..code = '146190'
        ..name = '卖五'
        ..value = '15',
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepaintBoundary(
        child: SingleChildScrollView(
          controller: _controller,
          child: Container(
            alignment: Alignment.center,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 200, minWidth: 150),
              child: Column(
                children: [
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: disk.map((e) {
                      return Container(
                        margin: EdgeInsets.only(
                            right: screenUtil.adaptive(15),
                            left: screenUtil.adaptive(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${e.name}'),
                            Text(
                              '${e.code}',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text('${e.value}'),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: screenUtil.adaptive(10),
                        bottom: screenUtil.adaptive(10)),
                    width: MediaQuery.of(context).size.width,
                    height: 0.5,
                    color: Colors.white,
                  ),
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: disk.map((e) {
                      return Container(
                        margin: EdgeInsets.only(
                            right: screenUtil.adaptive(15),
                            left: screenUtil.adaptive(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${e.name}'),
                            Text(
                              '${e.code}',
                              style: TextStyle(color: Colors.red),
                            ),
                            Text('${e.value}'),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: screenUtil.adaptive(10),
                        bottom: screenUtil.adaptive(10)),
                    width: MediaQuery.of(context).size.width,
                    height: 0.5,
                    color: Colors.white,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: screenUtil.adaptive(15),
                        left: screenUtil.adaptive(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('涨停'),
                        Text(
                          '155121',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: screenUtil.adaptive(15),
                        left: screenUtil.adaptive(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('跌停'),
                        Text(
                          '155121',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: screenUtil.adaptive(10),
                        bottom: screenUtil.adaptive(10)),
                    width: MediaQuery.of(context).size.width,
                    height: 0.5,
                    color: Colors.white,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: screenUtil.adaptive(15),
                        left: screenUtil.adaptive(15),
                        bottom: screenUtil.adaptive(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('昨收'),
                        Text(
                          '155121',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
