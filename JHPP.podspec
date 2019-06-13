Pod::Spec.new do |s|
  s.name         = 'JHPP'
  s.summary      = 'Push & Present ViewController at any view, just so easy!'
  s.version      = '1.2.2'
  s.license      = { :type => 'MIT'}
  s.authors      = { 'Haocold' => 'xjh093@126.com' }
  s.homepage     = 'https://github.com/xjh093/JHPP'

  s.ios.deployment_target = '5.0'

  s.source       = { :git => 'https://github.com/xjh093/JHPP.git', :tag => s.version}
  
  s.source_files = 'JHPP/*.{h,m}'
  s.requires_arc = true

end