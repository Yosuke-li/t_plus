import 'package:get/get.dart';
import 'package:transaction_plus/model/img_model.dart';

class IndexState {
  RxList<ImageModel> imgs;

  IndexState() {
    imgs = <ImageModel>[].obs;
  }
}
