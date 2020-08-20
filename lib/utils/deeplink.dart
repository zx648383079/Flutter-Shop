import 'package:flutter/material.dart';
import 'package:flutter_shop/models/search.dart';

void openLink(BuildContext context, String link) {
  if (link.isEmpty ||
      link.indexOf('#') == 0 ||
      link.indexOf('javascript:') == 0) {
    return;
  }
  var uri = Uri.parse(link);
  if (uri.scheme == 'http' || uri.scheme == 'https') {
    Navigator.pushNamed(
      context,
      '/browser',
      arguments: {'url': link},
    );
    return;
  }
  if (uri.scheme != 'deeplink') {
    return;
  }
  if (uri.host == 'search') {
    Navigator.pushNamed(
      context,
      '/search/result',
      arguments: SearchForm(1, keywords: uri.queryParameters['keywords']),
    );
    return;
  }
  if (uri.host != 'goto') {
    return;
  }
  if (uri.path == 'index') {
    Navigator.pushNamed(
      context,
      '/',
    );
    return;
  }
  if (uri.path == 'cart') {
    Navigator.pushNamed(
      context,
      '/cart',
    );
    return;
  }
  if (uri.path == 'category') {
    Navigator.pushNamed(
      context,
      '/category',
    );
    return;
  }
  if (uri.path == 'home') {
    Navigator.pushNamed(
      context,
      '/member',
    );
    return;
  }
  if (uri.path == 'order') {
    Navigator.pushNamed(
      context,
      '/order',
    );
    return;
  }
  if (uri.pathSegments[0] == 'product') {
    if (uri.pathSegments.length > 1) {
      Navigator.pushNamed(
        context,
        '/goods',
        arguments: {
          'id': int.parse(uri.pathSegments[1]),
        },
      );
    }
    return;
  }
}
