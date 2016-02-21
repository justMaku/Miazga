Pod::Spec.new do |spec|
  spec.name         = 'Miazga'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/justMaku/Miazga'
  spec.authors      = { 'Michał "Maku" Kałużny' => 'maku@justmaku.org' }
  spec.summary      = 'Simple Swift Library for working with binary streams.'
  spec.source       = { :git => 'https://github.com/justMaku/Miazga.git', :tag => 'v1.0.0' }
  spec.source_files = 'Miazga/**/*.swift'
	spec.ios.deployment_target = "8.0"
	spec.osx.deployment_target = "10.10"
	spec.watchos.deployment_target = "2.0"
	spec.tvos.deployment_target = "9.0"
end
