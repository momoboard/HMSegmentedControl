Pod::Spec.new do |s|
  s.name         = "HMSegmentedControl"
  s.version      = "1.4.0"
  s.summary      = "A drop-in replacement for UISegmentedControl mimicking the style of the one in Google Currents and various other Google products."
  s.homepage     = "https://github.com/HeshamMegid/HMSegmentedControl"
  s.license      = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author       = { "Hesham Abd-Elmegid" => "hesham.abdelmegid@gmail.com" }
  s.source       = { :git => "https://github.com/momoboard/HMSegmentedControl.git", :tag => "v1.3.0" }
  s.platform     = :ios, '5.0'
  s.requires_arc = true
  s.ios.dependency 'FontAwesome+iOS'
  s.source_files = 'HMSegmentedControl/*.{h,m}'
  s.framework  = 'QuartzCore'
end
