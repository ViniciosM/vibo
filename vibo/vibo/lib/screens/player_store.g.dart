// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlayerStore on _PlayerStoreBase, Store {
  Computed<bool>? _$videoIsFinishedComputed;

  @override
  bool get videoIsFinished =>
      (_$videoIsFinishedComputed ??= Computed<bool>(() => super.videoIsFinished,
              name: '_PlayerStoreBase.videoIsFinished'))
          .value;

  final _$carouselControllerAtom =
      Atom(name: '_PlayerStoreBase.carouselController');

  @override
  CarouselController get carouselController {
    _$carouselControllerAtom.reportRead();
    return super.carouselController;
  }

  @override
  set carouselController(CarouselController value) {
    _$carouselControllerAtom.reportWrite(value, super.carouselController, () {
      super.carouselController = value;
    });
  }

  final _$positionAtom = Atom(name: '_PlayerStoreBase.position');

  @override
  int get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(int value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  final _$durationAtom = Atom(name: '_PlayerStoreBase.duration');

  @override
  int get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(int value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  final _$_PlayerStoreBaseActionController =
      ActionController(name: '_PlayerStoreBase');

  @override
  void setPosition({required int position}) {
    final _$actionInfo = _$_PlayerStoreBaseActionController.startAction(
        name: '_PlayerStoreBase.setPosition');
    try {
      return super.setPosition(position: position);
    } finally {
      _$_PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDuration({required int duration}) {
    final _$actionInfo = _$_PlayerStoreBaseActionController.startAction(
        name: '_PlayerStoreBase.setDuration');
    try {
      return super.setDuration(duration: duration);
    } finally {
      _$_PlayerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carouselController: ${carouselController},
position: ${position},
duration: ${duration},
videoIsFinished: ${videoIsFinished}
    ''';
  }
}
