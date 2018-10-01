
Pod::Spec.new do |s|
  s.name             = 'AADialogs'
  s.version          = '1.0'
  s.summary          = 'AADialogs - An easy way to handle your custom dialogs using storyboard'

  s.description      = <<-DESC
With AADialogs, you can show your custom dialogs using storyboard view controllers, show with custom animations using AAViewAnimator library. This library is so simple you can call it from in any class or from any view controller to show custom dialog.
                       DESC

  s.homepage         = 'https://github.com/EngrAhsanAli/AADialogs'
  s.screenshots     = 'https://raw.githubusercontent.com/EngrAhsanAli/AADialogs/master/Screenshots/AADialogs.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ahsan Ali' => 'hafiz.m.ahsan.ali@gmail.com' }
  s.source           = { :git => 'https://github.com/EngrAhsanAli/AADialogs.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'AADialogs/Classes/**/*'
  s.dependency 'AAViewAnimator', '~> 1.0'

end
