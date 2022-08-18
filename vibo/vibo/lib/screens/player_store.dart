import 'package:carousel_slider/carousel_controller.dart';
import 'package:mobx/mobx.dart';

part 'player_store.g.dart';

class PlayerStore = _PlayerStoreBase with _$PlayerStore;

abstract class _PlayerStoreBase with Store {
  _PlayerStoreBase() {
    autorun((_) async {
      if (videoIsFinished == true) {
        carouselController.nextPage();
        this.autoPlay = true;
      }
      ;
    });
  }
  @observable
  CarouselController carouselController = CarouselController();
  @observable
  int position = -1;
  @observable
  int duration = 0;
  Duration time = Duration(seconds: 12);
  bool autoPlay = true;

  @action
  void setPosition({required int position}) {
    this.position = position;
    this.autoPlay = false;
  }

  @action
  void setDuration({required int duration}) {
    this.duration = duration;
  }

  @computed
  bool get videoIsFinished {
    return (this.position == this.duration &&
        (this.duration != 0 && this.position != 0));
  }
}
