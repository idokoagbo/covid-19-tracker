
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

part 'article_page.dart';

class Article extends StatelessWidget {
  String title;

  Article(this.title);
  @override
  Widget build(BuildContext context) {
    return _ArticlePage(title: title);
  }
}
