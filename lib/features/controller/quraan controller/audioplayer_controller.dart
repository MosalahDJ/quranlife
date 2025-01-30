import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioplayerController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    audioplayerinit();
    playerstatechanges();
  }

  late AudioPlayer player;
  final Rx<PlayerState> playerState = PlayerState.stopped.obs;
  final RxInt currentPlayingAyah = RxInt(-1);

  void audioplayerinit() {
    // Create the audio player.
    player = AudioPlayer();
    // Set the release mode to keep the source after playback has completed.
    player.setReleaseMode(ReleaseMode.stop);
  }

  playaudio(String ayahaudio, int ayahNumber) async {
    try {
      // If currently playing ayah is different, stop it first
      if (currentPlayingAyah.value != ayahNumber &&
          playerState.value == PlayerState.playing) {
        await player.stop();
      }
      currentPlayingAyah.value = ayahNumber;
      await player.play(UrlSource(ayahaudio));
    } catch (e) {
      // ignore: avoid_print
      print('error $e');
    }
  }

  playerstatechanges() {
    // Listen to player state changes
    player.onPlayerStateChanged.listen((state) {
      playerState.value = state == PlayerState.playing
          ? PlayerState.playing
          : PlayerState.stopped;
      if (state == PlayerState.stopped || state == PlayerState.completed) {
        currentPlayingAyah.value = -1;
      }
    });
  }

  @override
  void dispose() {
    // Release all sources and dispose the player.
    player.dispose();
    super.dispose();
  }
}
