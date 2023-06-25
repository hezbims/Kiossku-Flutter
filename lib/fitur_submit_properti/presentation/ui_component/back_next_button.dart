import 'package:flutter/material.dart';
import 'package:kiossku_flutter/theme/kiossku_theme.dart';

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
            style: ButtonStyle(
              padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(vertical: 16)
              ),
              foregroundColor: const MaterialStatePropertyAll(Color(0xFF605B57)),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                    width: 0.5,
                    color: Color(0xFF605B57),
                  ),
                )
              )
            ),
              child: Text(_backText),
          ),
        ),

        const SizedBox(width: 16,),

        Expanded(
          child: FilledButton(
              onPressed: _onNext,
              style: ButtonStyle(
                padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 16),
                ),
                backgroundColor: const MaterialStatePropertyAll(KiosskuColors.primary),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  )
                )
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_nextText),
                ],
              ),
          ),
        )
      ],
    );
  }
}