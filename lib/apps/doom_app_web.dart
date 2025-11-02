// Web-specific implementation for DOOM iframe
import 'dart:html' as html;
import 'dart:ui' as ui;

void registerDoomIframe(String viewId) {
  // Register the iframe view factory
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
    viewId,
    (int viewId) {
      final iframe = html.IFrameElement()
        ..src = 'doom/index.html'  // Updated to correct path
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%'
        ..allow = 'autoplay; fullscreen'
        ..setAttribute('allowfullscreen', 'true');
      
      return iframe;
    },
  );
}

