package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.beyongx.flutter_umeng_share.UmengSharePlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    UmengSharePlugin.registerWith(registry.registrarFor("com.beyongx.flutter_umeng_share.UmengSharePlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
