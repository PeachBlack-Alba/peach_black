// Web-specific implementation for DOOM iframe
import 'dart:html' as html;
// ignore: avoid_web_libraries_in_flutter
import 'dart:ui_web' as ui_web;

void registerDoomIframe(String viewId) {
  // Register the iframe view factory
  ui_web.platformViewRegistry.registerViewFactory(
    viewId,
    (int viewId) {
      final iframe = html.IFrameElement()
        ..src = 'doom/index.html'
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%'
        ..allow = 'autoplay; fullscreen'
        ..setAttribute('allowfullscreen', 'true');
      
      return iframe;
    },
  );
}

