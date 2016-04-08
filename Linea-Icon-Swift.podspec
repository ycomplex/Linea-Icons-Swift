Pod::Spec.new do |s|
  s.name = 'Linea-Icon-Swift'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'Linea Icons swift library for iOS.'
  s.homepage = 'https://github.com/YComplex/Linea-Icons-Swift'
  # s.screenshots = "https://raw.githubusercontent.com/YComplex/Linea-Icons-Swift/master/resources/image1.png"
  s.social_media_url = 'http://twitter.com/akshayr'
  s.authors = { "Akshay Rangnekar" => "akshay@ycomplex.com" }
  s.source = { :git => 'https://github.com/ycomplex/Linea-Icons-Swift.git', :tag => s.version }
  
  s.ios.deployment_target = '8.0'
  s.source_files   = 'Source/LineaIcon.swift'
  s.resource_bundle = { 'Linea-Icon-Swift' => 'Source/*.ttf' }
  s.frameworks = 'UIKit', 'CoreText'
  s.requires_arc = true
end
