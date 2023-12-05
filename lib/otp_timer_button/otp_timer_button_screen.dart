import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpTimerButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Text text;
  final int duration;

  OtpTimerButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.duration,
  }) : super(key: key);

  @override
  _OtpTimerButtonState createState() => _OtpTimerButtonState();
}

class _OtpTimerButtonState extends State<OtpTimerButton> {
  late Timer _timer;
  late int _remainingSeconds;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.duration;
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          _timer.cancel();
          _isLoading = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CircularProgressIndicator()
        : ElevatedButton(
      onPressed: () {
        setState(() {
          _isLoading = true;
        });
        widget.onPressed();
        _startTimer();
      },
      child: Text(
        _isLoading ? 'Loading...' : widget.text.data! + ' $_remainingSeconds seconds',
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
