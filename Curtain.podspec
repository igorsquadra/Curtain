#
# Be sure to run `pod lib lint Curtain.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Curtain'
  s.version          = '1.0'
  s.summary          = 'A nice customizable background animation with timer'
  s.swift_version    = '5.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Curtain is a swift pod that helps you implementing a nice background animation for your timer.
Super easy to implement, use the available options to customize the background color, the background filling direction, and the exit animation.
                       DESC

  s.homepage         = 'https://github.com/igorsquadra/Curtain'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'igorsquadra' => 'me@igorsquadra.com' }
  s.source           = { :git => 'https://github.com/igorsquadra/Curtain.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'Curtain/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Curtain' => ['Curtain/Assets/*.png']
  # }
end
