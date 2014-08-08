import 'package:cube/cube.dart';
import 'dart:async';

void main() {
  String fourFlip = "M' U' M' U' M' U' M' U'";
  String algoStr = "$fourFlip x' z' $fourFlip x' z' $fourFlip x' z'";
  //String algoStr = "F B' D2 L2 R B F L' R2 B2 D'";
  WcaAlgorithm wcaAlgo = new WcaAlgorithm.fromString(algoStr);
  StickerAlgorithm a = new StickerAlgorithm.fromWca(3, wcaAlgo);
  solveEOLine(a.toState()).listen((algo) {
    print('algo $algo');
  });
}

Stream<StickerAlgorithm> solveEOLine(StickerState state) {
  return new StickerEOLineSolver(state).stream;
}