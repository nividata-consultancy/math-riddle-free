import 'package:flutter/material.dart';
import 'package:math_riddle/data/audio/audio_controller.dart';
import 'package:math_riddle/data/audio/sounds.dart';
import 'package:provider/provider.dart';

class CommonScaffoldView extends StatelessWidget {
  final Widget title;
  final Widget body;
  final List<Widget> actions;
  final bool showLanding;

  const CommonScaffoldView({
    required this.title,
    required this.body,
    this.actions = const <Widget>[],
    this.showLanding = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: actions,
        leading: showLanding
            ? InkWell(
                onTap: () {
                  final audioController = context.read<AudioController>();
                  audioController.playSfx(SfxType.buttonTap);
                  Navigator.pop(context);
                },
                customBorder: const CircleBorder(),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back_ios_new),
                ),
              )
            : null,
      ),
      body: body,
    );
  }
}
