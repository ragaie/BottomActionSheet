
Pod::Spec.new do |s|
  s.platform = :ios
  s.name             = 'ChtarBottomSheet'
  s.version          = '0.4'
  s.summary          = ' like keyBoard animated view in for any picker data and any custom view component for iOS '
 
  s.description      = <<-DESC
date picker and any data picker ,and any view you can put it in this animateied view, this view like keyboard view 
                       DESC
 
  s.homepage         = 'https://github.com/ragaie/BottomActionSheet'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ragaie Alfy' => 'eng.ragaie@gmail.com' }
  s.source           = { :git => 'https://github.com/ragaie/BottomActionSheet.git', :tag => s.version.to_s }
 
  s.framework = "UIKit","Foundation"
  s.ios.deployment_target = '8.0'

  s.source_files = 'Library files/*.swift'
  s.resources = 'Library files/*.xib'
  s.resource_bundle = {'ChtarBottomSheet' => ['Library files/DatePicker.xib','Library files/PickerList.xib']}

  
end