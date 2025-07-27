Pod::Spec.new do |s|
  s.name             = 'HTMCollectionKit'
  s.version          = '0.0.8'
  s.summary          = 'A customizable UICollectionView layout engine for building complex horizontal and vertical lists.'
  s.description      = 'A customizable UICollectionView layout engine for building complex horizontal and vertical lists. You can use it with Compositional Layout. Designed by HTM GROUP'
  s.homepage         = 'https://github.com/amashtay/HTMCollectionKit.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Hulio Trabajo Montez' => 'amashtay@gmail.com' }
  s.source           = { :git => 'https://github.com/amashtay/HTMCollectionKit.git', :tag => s.version.to_s }

  s.swift_versions = ['5.9']
  s.ios.deployment_target = '15.0'

  s.source_files = 'Sources/HTMCollectionKit/Classes/**/*'
end
