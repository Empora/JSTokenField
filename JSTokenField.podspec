   Pod::Spec.new do |s|
  s.name     = 'JSTokenField'
  s.version  = '1.0'
  s.source   = { :git => 'https://github.com/jasarien/JSTokenField.git', :commit => '560d3d68868e12bc7e1e7c0082a27c770e09f4b8'}
  s.source_files = 'JSTokenField/JS*.{h,m}'
  s.resources    = 'JSTokenField/*.png'
  s.summary = 'An iOS token field based on the behaviour and functionality provided by Mail.app\'s email recipient field.'
  s.homepage = 'https://github.com/jasarien/JSTokenField'
  s.authors = {'James Addyman' => ''}
  s.license = {'Simplified BSD' => 'README.mdown'}
  s.platform = :ios,'5.0'
end
