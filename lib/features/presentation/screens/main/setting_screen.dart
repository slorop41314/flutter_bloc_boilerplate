import 'package:flu_bloc_boilerplate/features/presentation/components/shared/shared.dart';
import 'package:flu_bloc_boilerplate/features/presentation/utils/common.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    print("Init state SEtting screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        "Settings",
        trailing: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            _createSection("Account", [1, 2]),
          ],
        ),
      ),
    );
  }

  Column _createSection(
    String sectionTitle,
    List data,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: headerTextStyle,
        ),
        SizedBox(
          height: 8,
        ),
        Column(
          children: data
              .map((e) => InkWell(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Example $e"),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ))
              .toList(),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
