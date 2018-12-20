Pod::Spec.new do |s|
  s.name             = 'BubbleHeader'
  s.version          = '1.0.0'
  s.summary          = 'BubbleHeader is a animated top menu for UITableView / UICollectionView / UIScrollView that mimics Instagram's header, this project was inspired in Persei project check them out https://github.com/Yalantis/Persei'

  s.homepage         = 'https://github.com/ramonvasc/BubbleHeader'
  s.screenshots      = 'https://github.com/ramonvasc/BubbleHeader/blob/master/BubbleHeader.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = Ramon Vasconcelos
  s.source           = { :git => 'https://github.com/ramonvasc/BubbleHeader.git', :tag => s.version.to_s }

  s.platform = :ios, '9.0'
  s.ios.deployment_target = '9.0'
  s.source_files = 'BubbleHeader/Classes/**/*'
  s.requires_arc = true
  
end
