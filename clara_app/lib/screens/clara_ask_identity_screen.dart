import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ClaraAskIdentityScreen extends StatefulWidget {
  const ClaraAskIdentityScreen({super.key});

  @override
  State<ClaraAskIdentityScreen> createState() => _ClaraAskIdentityScreenState();
}

class _ClaraAskIdentityScreenState extends State<ClaraAskIdentityScreen> {
  final FlutterTts flutterTts = FlutterTts();
  final stt.SpeechToText speech = stt.SpeechToText();
  bool isListening = false;
  String userAnswer = '';
  bool ttsDone = false;

  @override
  void initState() {
    super.initState();
    _speakAndListen();
  }

  Future<void> _speakAndListen() async {
    await flutterTts.setLanguage("id-ID");
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.9);
    await flutterTts.speak("Halo, boleh tahu nama kamu siapa?");
    flutterTts.setCompletionHandler(() async {
      setState(() {
        ttsDone = true;
      });
      await _startListening();
    });
  }

  Future<void> _startListening() async {
    bool available = await speech.initialize(
      onStatus: (status) {
        if (status == 'done' || status == 'notListening') {
          setState(() {
            isListening = false;
          });
        }
      },
      onError: (error) {
        setState(() {
          isListening = false;
        });
      },
    );
    if (available) {
      setState(() {
        isListening = true;
      });
      speech.listen(
        localeId: "id_ID",
        onResult: (result) {
          setState(() {
            userAnswer = result.recognizedWords;
          });
        },
      );
    }
  }

  @override
  void dispose() {
    flutterTts.stop();
    speech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E9),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Bubble chat Clara + kucing di atas
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  padding: const EdgeInsets.all(24),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xFFD9A074), width: 4),
                  ),
                  child: const Text(
                    'Halo, boleh tahu nama kamu siapa?',
                    style: TextStyle(fontSize: 20, color: Color(0xFF333333)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Image.asset('assets/clara/concerned.png', width: 80),
                ),
              ],
            ),
            // Tampilkan hasil rekaman user jika ada
            if (userAnswer.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Jawaban kamu: $userAnswer',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.deepOrange,
                  ),
                ),
              ),
            const Spacer(),
            // Gambar Clara
            Image.asset('assets/clara/talk.png', width: 200, height: 200),
            const Spacer(),
            // Tombol mikrofon
            GestureDetector(
              onTap: () async {
                if (!isListening) {
                  await _startListening();
                } else {
                  await speech.stop();
                  setState(() {
                    isListening = false;
                  });
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isListening ? Colors.orange[200] : Colors.white,
                  border: Border.all(color: Color(0xFFD9A074), width: 4),
                ),
                padding: const EdgeInsets.all(24),
                child: Icon(
                  Icons.mic,
                  size: 48,
                  color: isListening ? Colors.deepOrange : Colors.grey[800],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
