#
# Be sure to run `pod lib lint XHTagsContainer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XHTagsContainer'
  s.version          = '0.1.1'
  s.summary          = '自定义标签选择,支持多选和单选'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/AssassinrKiller/XHTagsContainer'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AssassinrKiller' => 'ios_service@126.com' }
  s.source           = { :git => 'https://github.com/AssassinrKiller/XHTagsContainer.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'XHTagsContainer/Classes/**/*'
  
  #s.resources = ['XHTagsContainer/Assets/Resource/*']
  
  s.resource_bundles = {
    'XHTagsContainer' => ['XHTagsContainer/Assets/Resource/*']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
