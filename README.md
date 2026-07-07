# TextGrab

Select and copy text from any image on de-googled Android (GrapheneOS,
CalyxOS, LineageOS, ...). Works like iOS Live Text or the text selection on
Pixel phones, but fully local and without Google Play services.

## How to use

**Main workflow, from anything on your screen to copied text in seconds:**

1. Take a screenshot (Power + Volume down)
2. Swipe down and tap the **OCR screenshot** tile
3. Tap or drag over the text, then copy

One-time setup: open quick settings, tap the edit (pencil) button and drag
the **OCR screenshot** tile into your tiles.

**Second workflow, for existing images:**

Share any image from any app (gallery, browser, messenger) to **TextGrab**
and the text is selectable. Opening image files with TextGrab from a file
manager works too, as does picking an image from the app's home screen.

## Screenshots

| Tap a word | Long-press and drag | Full text view |
|---|---|---|
| ![Select a word](screenshots/select_word.png) | ![Sweep selection](screenshots/sweep_selection.png) | ![Text view](screenshots/text_view.png) |

## How it works

The app bundles Google's ML Kit **on-device** text recognizer, the same class
of neural model that powers Pixel Live Text. The model is packaged inside the
APK, so recognition:

- runs entirely on the device. The app has **no internet permission**.
- needs **no Google Play services** and works on GrapheneOS out of the box.
- is fast: typically well under a second per screenshot on real hardware.

## Supported languages

All Latin-script languages, including:

English, German, French, Spanish, Italian, Portuguese, Dutch, Polish, Czech,
Danish, Swedish, Norwegian, Finnish, Hungarian, Romanian, Turkish, Croatian,
Slovak, Slovenian, Estonian, Latvian, Lithuanian, Albanian, Catalan, Basque,
Galician, Icelandic, Irish, Maltese, Swahili, Tagalog, Vietnamese (partial,
some diacritics may be missed) and more, plus digits and common punctuation.

Chinese, Japanese, Korean and Devanagari need separate ML Kit model packs
(roughly 20 MB each). They are not included yet but are easy to add. Open an
issue if you want one of them.

## Building

```sh
./gradlew assembleRelease
```

Output: `app/build/outputs/apk/release/app-release.apk`.

To build a signed release, create a keystore and put its credentials in
`keystore/keystore.properties` (this directory is gitignored):

```properties
storeFile=keystore/your-release.jks
storePassword=...
keyAlias=...
keyPassword=...
```

Without that file the release build is unsigned. Keep your keystore safe:
updates must be signed with the same key.

## Notes

- `minSdk 26` (Android 8.0), `targetSdk 36`.
- The APK is ~43 MB; ~30 MB of that is the bundled recognition model.
- Photo permission is only requested for the "latest screenshot" feature.
  Images opened via share or the picker need no permission at all.

## License

The app source code is licensed under the [MIT License](LICENSE).

The bundled ML Kit text recognition SDK and its model are proprietary Google
software, used and redistributed under the
[ML Kit Terms of Service](https://developers.google.com/ml-kit/terms). They
are pulled from Google's Maven repository at build time and are not part of
this repository.
