#
#  Be sure to run `pod spec lint FQBaseKitSwift.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "FQBaseKitSwift"
  spec.version      = "0.0.1"
  spec.summary      = "FQBaseKit's Swift Version"
  spec.description  = " FQBaseKitSwift is a collection of useful Swift Categories extending iOS Frameworks such as Foundation,UIKit,QuartzCore "
  spec.homepage     = "https://github.com/fangqiu1991/FQBaseKit_Swift.git"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "fangqiu1991" => "519757546@qq.com" }
  spec.platform     = :ios
  spec.platform     = :ios, "10.0"
  spec.source       = { :git => "https://github.com/fangqiu1991/FQBaseKit_Swift.git", :tag => "#{spec.version}" }

  spec.source_files  = "FQBaseKit_Swift/FQBaseSwiftKit.swift"
spec.subspec 'FQBaseKit_SwiftFoundation' do |s|
    	s.source_files       = 'FQBaseKit_Swift/FQBaseKit_SwiftFoundation/*.{swift}'
	s.frameworks = 'Foundation','UIKit'

     end

     s.subspec 'FQBaseKit_SwiftHelper' do |s|
    	s.source_files       = 'FQBaseKit_Swift/FQBaseKit_SwiftHelper/*.{swift}'
	s.frameworks = 'Foundation','UIKit'

     end

     s.subspec 'FQBaseKit_SwiftTool' do |s|
    	s.source_files       = 'FQBaseKit_Swift/FQBaseKit_SwiftTool/*.{swift}'
	s.frameworks = 'Foundation','UIKit'

     end
     
     s.subspec 'FQBaseKit_SwiftUI' do |s|
    	s.source_files       = 'FQBaseKit_Swift/FQBaseKit_SwiftUI/*.{swift}'
	s.frameworks = 'Foundation','UIKit'

     end



  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
