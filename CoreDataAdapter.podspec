#
# Be sure to run `pod lib lint CoreDataAdapter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CoreDataAdapter'
  s.version          = '0.1.0'
  s.summary          = 'A generic wrapper making work with CoreData easier.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A generic wrapper making work with CoreData easier. I took an inspiration to create this adapter while reading objc's book: CoreData.
                       DESC

  s.homepage         = 'https://github.com/adam-leitgeb/CoreDataAdapter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'adam-leitgeb' => 'leitgeb.a@icloud.com' }
  s.source           = { :git => 'https://github.com/adam-leitgeb/CoreDataAdapter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.swift_version = '4.2'
  s.source_files = 'Sources/**/*'
  
  # s.resource_bundles = {
  #   'CoreDataAdapter' => ['CoreDataAdapter/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Foundation', 'CoreData'
  # s.dependency 'AFNetworking', '~> 2.3'
end
