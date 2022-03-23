#import "EpsonEposPrinterPlugin.h"
#if __has_include(<epson_epos_printer/epson_epos_printer-Swift.h>)
#import <epson_epos_printer/epson_epos_printer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "epson_epos_printer-Swift.h"
#endif

@implementation EpsonEposPrinterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [EposDiscoveryPlugin registerWithRegistrar:registrar];
}
@end
