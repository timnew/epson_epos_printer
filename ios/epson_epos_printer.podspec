#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint epson_epos_printer.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'epson_epos_printer'
  s.version          = '0.0.1'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<~DESC
    A new flutter plugin project.
  DESC
  s.homepage         = 'http://github.com/timnew/epson_epos_printer'
  s.license          = { file: '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { path: '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # External Accessory is required by libepos2.a for USB and so
  s.framework = 'ExternalAccessory'
  s.library = 'xml2'
  # libepos2.h will be included autommatically as public header
  s.vendored_libraries = 'Libraries/libepos2.a'
end
