# Preserve generic signatures (needed for Gson TypeToken)
-keepattributes Signature
-keepattributes *Annotation*

# Keep TypeToken and subclasses
-keep,allowobfuscation,allowshrinking class com.google.gson.reflect.TypeToken
-keep,allowobfuscation,allowshrinking class * extends com.google.gson.reflect.TypeToken

# Keep Gson core (safe and avoids odd reflection issues)
-keep class com.google.gson.** { *; }
-keep class sun.misc.Unsafe { *; }

# Keep the plugin’s classes used by Gson (models, requests, etc.)
# Adjust the package if your fork changed it
-keep class com.dexterous.flutterlocalnotifications.** { *; }
