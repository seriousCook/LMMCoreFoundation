#
# Be sure to run `pod lib lint LMMCoreFoundation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LMMCoreFoundation'
  s.version          = '0.0.1'
  s.summary          = '建设常用基础库'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    常用基础库
                       DESC

  s.homepage         = 'https://github.com/seriousCook/LMMCoreFoundation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '马敬龙' => 'mjinglong@126.com' }
  s.source           = { :git => 'git@github.com:seriousCook/LMMCoreFoundation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LMMCoreFoundation/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LMMCoreFoundation' => ['LMMCoreFoundation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  
  s.dependency 'Masonry'
  s.dependency 'AFNetworking'
end
