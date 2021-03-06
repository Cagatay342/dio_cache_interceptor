import 'dart:io';

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor/src/store/file_cache_store.dart';
import 'package:test/test.dart';

import 'common_store_testing.dart';

void main() {
  late BackupCacheStore store;

  setUp(() async {
    store = BackupCacheStore(
      primary: MemCacheStore(),
      secondary: FileCacheStore('${Directory.current.path}/test/data'),
    );
    await store.clean();
  });

  tearDown(() async => await store.close());

  test('Empty by default', () async => await emptyByDefault(store));
  test('Add item', () async => await addItem(store));
  test('Get item', () async => await getItem(store));
  test('Delete item', () async => await deleteItem(store));
  test('Clean', () async => await clean(store));
  test('Expires', () async => await expires(store));
  test('LastModified', () async => await lastModified(store));
  test('Staled', () async => await staled(store));
}
