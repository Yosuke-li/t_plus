import 'package:flutter/material.dart';
import 'package:transaction_plus/global/dll_text.dart';
import 'package:transaction_plus/page/order/order_submit/view.dart';

class PageModel {
  String name;
  Widget pageUrl;
}

class GridComponentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GridComponentPageState();
}

class GridComponentPageState extends State<GridComponentPage> {
  List<PageModel> _page = [];

  void initState() {
    super.initState();
    _page = [
      PageModel()
        ..name = '下单'
        ..pageUrl = OrderSubmitPage(),
      PageModel()
        ..name = 'dll'
        ..pageUrl = DllTextPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: _page.length ?? 0,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => _page[index].pageUrl),
              );
            },
            child: Container(
              decoration: BoxDecoration(border: Border.all(width: 1)),
              alignment: Alignment.center,
              child: Text('${_page[index].name}'),
            ),
          );
        }),
      ),
    );
  }
}
