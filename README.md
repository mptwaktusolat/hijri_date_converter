# hijri_date_converter

To manually determine the offset value for hijri date in Malaysia by comparing with Jakim website. Which later set to Firebase Remote Config to be consume by [Malaysia Prayer Time app](https://play.google.com/store/apps/details?id=live.iqfareez.waktusolatmalaysia).

## Problem statement

The [hijri](https://pub.dev/packages/hijri) package is not reliable enough to convert miladi date to hijri date (atleast in Malaysia). An offset would be needed to correct them.

## App

https://mpt-hijri-converter.web.app/#/
