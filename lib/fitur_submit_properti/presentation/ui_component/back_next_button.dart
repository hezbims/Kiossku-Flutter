import 'package:flutter/material.dart';

class BackNextButton extends StatelessWidget{
  final void Function() _onNext;
  final void Function() _onBack;
  final String _nextText;
  final String _backText;

  const BackNextButton({
    super.key,
    required void Function() clickNext,
    required void Function() clickBack,
    String nextText = "Lanjut",
    String backText = "Kembali"
  }) : _onNext = clickNext,
        _onBack = clickBack ,
        _nextText = nextText,
        _backText = backText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: OutlinedButton(
              onPressed: _onBack,
              child: Text(_backText)
          ),
        ),
        Expanded(
          child: FilledButton(
              onPressed: _onNext,
              child: Text(_nextText)
          ),
        )
      ],
    );
  }
}