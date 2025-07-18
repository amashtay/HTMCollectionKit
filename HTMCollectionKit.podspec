Pod::Spec.new do |s|
  s.name             = 'HTMCollectionKit'
  s.version          = '0.0.1'
  s.summary          = 'A customizable UICollectionView layout engine for building complex horizontal and vertical lists.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'A customizable UICollectionView layout engine for building complex horizontal and vertical lists. You can use it with Compositional Layout. Designed by HTM GROUP'

  s.homepage         = 'https://github.com/amashtay/HTMCollectionKit.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Hulio Trabajo Montez' => 'amashtay@gmail.com' }
  s.source           = { :git => 'https://github.com/amashtay/HTMCollectionKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.swift_versions = ['5.9']
  s.ios.deployment_target = '15.0'

  s.source_files = 'HTMCollectionKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'HTMCollectionKit' => ['HTMCollectionKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
