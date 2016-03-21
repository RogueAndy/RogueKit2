Pod::Spec.new do |s|
s.name             = "RogueKit2"
s.version          = "0.1.2"
s.summary          = "A marquee view used on iOS."
s.description      = <<-DESC
It is a marquee view used on iOS, which implement by Objective-C.
DESC
s.homepage         = "https://github.com/RogueAndy/RogueKit2"
# s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
s.license          = 'MIT'
s.author           = { "RogueAndy" => "619455850@qq.com" }
s.source           = { :git => "https://github.com/RogueAndy/RogueKit2.git", :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/NAME'

s.platform     = :ios, '6.0'
# s.ios.deployment_target = '7.0'
# s.osx.deployment_target = '10.7'
s.requires_arc = true

s.source_files = 'RogueKit/*'
# s.resources = 'Assets'

# s.ios.exclude_files = 'Classes/osx'
# s.osx.exclude_files = 'Classes/ios'
# s.public_header_files = 'Classes/**/*.h'
s.frameworks = 'Foundation', 'UIKit', 'ImageIO'
s.dependency 'MBProgressHUD'


end
