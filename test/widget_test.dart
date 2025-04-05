// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:book_app/common/data/repositories/common_repositories_impl.dart';
import 'package:book_app/common/domain/repositories/common_repositories.dart';
import 'package:book_app/common/domain/usecase/feature_get.dart';
import 'package:book_app/features/bookshelf/data/datasources/local/book_local_datasource.dart';
import 'package:book_app/features/bookshelf/data/datasources/remote/book_remote_datasource.dart';
import 'package:book_app/features/bookshelf/data/repositories/book_repository_impl.dart';
import 'package:book_app/injection.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // await RemoteDatasourceImpl().getTrendingBook();
  final resp = await FeatureGet(CommonRepositoriesImpl());

  print(resp);

  // resp.fold(
  //   (l) {
  //     print(l.message);
  //   },
  //   (r) {
  //     print(r);
  //   },
  // );
}
