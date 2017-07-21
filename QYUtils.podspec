#
# Be sure to run `pod lib lint QYUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QYUtils'
  s.version          = '1.1.0'
  s.summary          = 'Utils Fundamentals'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '这个库是一些常用工具类的封装，包括一些常用类的扩展'

  s.homepage         = 'https://github.com/stoneqi2007/QYUtils'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'stoneqi2007' => 'stoneqi2007@163.com' }
  s.source           = { :git => 'https://github.com/stoneqi2007/QYUtils.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'QYUtils/Classes/**/*'

  # s.resource_bundles = {
  #   'QYUtils' => ['QYUtils/Assets/*.png']
  # }
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
  s.requires_arc = true
  s.dependency "ReactiveObjC"
  s.dependency "Masonry"
end
