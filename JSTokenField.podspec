#
#  Be sure to run `pod spec lint JSTokenField.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "JSTokenField"
  s.version      = "1.2"
  s.summary      = "Text field with tokenised keywords"
  s.description  = "idghsfdhsgfhjdsfhdsgfkdhjsbgdfhjkghvdghvjdfhjkvdhjv"
  s.homepage     = "https://github.com/Empora/JSTokenField"
  s.license      = { :type => "MIT", :file => "LICENSE.txt" }
  s.homepage     = "https://github.com/jasarien/JSTokenField"
  s.authors      = {"James Addyman"=> ""}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/Empora/JSTokenField.git",:tag => s.version.to_s}
  s.source_files = "JSTokenField/JSTokenField.{h,m}","JSTokenField/JSBackspaceReportingTextField.{h,m}","JSTokenField/JSTokenButton.{h,m}","JSTokenField/JSTokenField.{h,m}"
  s.resources    = "JSTokenField/*.png"

  s.framework    = "UIKit"

end
