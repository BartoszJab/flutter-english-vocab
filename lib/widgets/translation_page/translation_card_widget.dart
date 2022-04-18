import 'package:flutter/material.dart';

class TranslationCardWidget extends StatelessWidget {
  final String translatedPhrase;
  final String englishExample;
  final String translatedExample;
  final Color color;
  const TranslationCardWidget({
    Key? key,
    required this.translatedPhrase,
    required this.englishExample,
    required this.translatedExample,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              translatedPhrase,
              style: const TextStyle(
                fontSize: 24.0,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Divider(thickness: 1.0),
            const SizedBox(
              height: 10,
            ),
            BeautifiedExampleText(textExample: englishExample),
            const SizedBox(
              height: 10.0,
            ),
            BeautifiedExampleText(textExample: translatedExample),
          ],
        ),
      ),
    );
  }
}

class BeautifiedExampleText extends StatelessWidget {
  final String textExample;
  const BeautifiedExampleText({
    Key? key,
    required this.textExample,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return textExample.contains("<strong>")
        ? RichText(
            text: TextSpan(
                style: const TextStyle(
                  fontSize: 16.0,
                ),
                children: [
                  TextSpan(
                    text: textExample.substring(
                      0,
                      textExample.indexOf("<strong>"),
                    ),
                  ),
                  TextSpan(
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.green,
                    ),
                    text: textExample.substring(
                        textExample.indexOf("<strong>") + "<strong>".length,
                        textExample.indexOf("</strong>")),
                  ),
                  TextSpan(
                    text: textExample.substring(
                      textExample.indexOf("</strong>") + "</strong>".length,
                    ),
                  ),
                ]),
          )
        : Text(
            textExample,
            style: const TextStyle(fontSize: 16.0),
          );
  }
}
