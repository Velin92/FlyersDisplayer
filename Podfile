#Podfile
use_frameworks!

platform :ios, "11.0"

## I use this to share pods between more targets whenever I need it
def sharedPods
	pod 'Alamofire', '~> 5.2'
	pod 'Kingfisher', '~> 5.0'
	pod 'ReachabilitySwift'
end

target 'FlyersDisplayer' do
    sharedPods
end
