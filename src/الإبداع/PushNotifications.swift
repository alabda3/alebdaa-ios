import Foundation
import WebKit

// The PWABuilder Firebase values in the original project were placeholders.
// Keep the JavaScript bridge stable, but explicitly report unavailable notifications.
// This avoids registering for push capabilities that a free personal ID cannot sign.
private func notifyWebApp(_ event: String, value: String) {
    DispatchQueue.main.async {
        guard let view = الإبداع.webView else { return }
        // All values here are hardcoded, never interpolated from untrusted web messages.
        let script = "window.dispatchEvent(new CustomEvent('\(event)', { detail: '\(value)' }));"
        view.evaluateJavaScript(script, completionHandler: nil)
    }
}

func handleSubscribeTouch(message: WKScriptMessage) {
    // Push subscription unavailable in this free personal build.
}

func handlePushPermission() {
    notifyWebApp("push-permission-request", value: "denied")
}

func handlePushState() {
    notifyWebApp("push-permission-state", value: "denied")
}

func handleFCMToken() {
    notifyWebApp("push-token", value: "")
}
