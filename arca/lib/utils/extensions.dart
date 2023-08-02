import 'dart:math';

extension ZoomLG on num {
  double get zoomLG =>
      130000000.0 / pow(2, this); // Formula to match zoom of GMap with LG
}