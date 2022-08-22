import 'package:flutter_network/data/model/data_model.dart';
import 'package:flutter_network/data/provider/http/http.dart';

class HttpRepo{
  late PostModel postModel;
  PostClient postClient = PostClient();
}