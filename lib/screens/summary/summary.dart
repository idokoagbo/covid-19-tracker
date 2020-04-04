import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'package:sliclone/model/model.dart';
import 'package:sliclone/screens/screens.dart';
import 'package:sliclone/util/util.dart';


import 'summary_screen_presenter.dart';
part 'summary_page.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _SummaryPage();
  }
}
