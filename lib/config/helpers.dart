import 'package:flutter/cupertino.dart';

double getImageLoadingProgress(ImageChunkEvent loadingProgress) {
  return loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1);
}
