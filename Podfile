platform :ios, '12.0'
inhibit_all_warnings!

target 'NEWS' do

  use_frameworks!

  # Rx
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxDataSources'

  # Utils
  pod 'Alamofire'
  pod 'AlamofireNetworkActivityLogger'
  pod 'SnapKit'
  pod 'Kingfisher'
  pod 'Then'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    end
  end
end