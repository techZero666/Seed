package io.flutter.plugins;

import androidx.annotation.Keep;
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry;

/**
 * Generated file. Do not edit.
 * This file is generated by the Flutter tool based on the
 * plugins that support the Android platform.
 */
@Keep
public final class GeneratedPluginRegistrant {
  public static void registerWith(@NonNull FlutterEngine flutterEngine) {
    ShimPluginRegistry shimPluginRegistry = new ShimPluginRegistry(flutterEngine);
    flutterEngine.getPlugins().add(new io.flutter.plugins.connectivity.ConnectivityPlugin());
    flutterEngine.getPlugins().add(new com.example.flutternativeimage.FlutterNativeImagePlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.flutter_plugin_android_lifecycle.FlutterAndroidLifecyclePlugin());
    flutterEngine.getPlugins().add(new io.github.ponnamkarthik.toast.fluttertoast.FlutterToastPlugin());
      com.example.imagegallerysaver.ImageGallerySaverPlugin.registerWith(shimPluginRegistry.registrarFor("com.example.imagegallerysaver.ImageGallerySaverPlugin"));
    flutterEngine.getPlugins().add(new io.flutter.plugins.imagepicker.ImagePickerPlugin());
      io.flutter.plugins.pathprovider.PathProviderPlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.pathprovider.PathProviderPlugin"));
    flutterEngine.getPlugins().add(new com.baseflow.permissionhandler.PermissionHandlerPlugin());
      io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin.registerWith(shimPluginRegistry.registrarFor("io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin"));
    flutterEngine.getPlugins().add(new com.tekartik.sqflite.SqflitePlugin());
    flutterEngine.getPlugins().add(new io.flutter.plugins.urllauncher.UrlLauncherPlugin());
  }
}
