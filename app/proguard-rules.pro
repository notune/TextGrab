# ML Kit text recognition keeps its own rules via consumer proguard files.
# Keep native JNI entry points used by the bundled recognizer just in case.
-keep class com.google.mlkit.** { *; }
-keep class com.google.android.gms.internal.mlkit_vision_text_common.** { *; }
-dontwarn com.google.android.gms.**
