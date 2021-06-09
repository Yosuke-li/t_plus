import 'package:get/get.dart';
import 'package:transaction_plus/model/img_model.dart';

import 'state.dart';

class IndexLogic extends GetxController {
  final state = IndexState();

  @override
  void onReady() {
    _setImages();
    super.onReady();
  }

  void _setImages() {
    final List<ImageModel> _images = [
      ImageModel()
        ..image =
            'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201311%2F17%2F174124tp3sa6vvckc25oc8.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625624528&t=f27d73f1455c17f3fc1c4296f0e11957',
      ImageModel()
        ..image =
            'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201311%2F17%2F174124tp3sa6vvckc25oc8.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625624528&t=f27d73f1455c17f3fc1c4296f0e11957',
      ImageModel()
        ..image =
            'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201311%2F17%2F174124tp3sa6vvckc25oc8.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1625624528&t=f27d73f1455c17f3fc1c4296f0e11957',
    ];

    state.imgs.value = _images;
  }
}
