#
# Be sure to run `pod lib lint StringPatternFormatter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StringPatternFormatter'
  s.version          = '0.1.0'
  s.summary          = 'A shorthand string pattern formatter.'

  s.description      = <<-DESC
This pod targets those who need to add custom string formatter to your app. With this pod, you can create custom patters (using regex rules) to create attributed strings given an set of patterns.
                       DESC

  s.homepage         = 'https://github.com/vitorsala/StringPatternFormatter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vitor Kawai Sala' => '' }
  s.source           = { :git => 'https://github.com/vitorsala/StringPatternFormatter', :tag => s.version.to_s }
  

  s.ios.deployment_target = '9.0'

  s.source_files = 'StringPatternFormatter/Classes/**/*'
end
