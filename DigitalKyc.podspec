
version = "2.6.5"

Pod::Spec.new do |spec|

  spec.name         = "DigitalKyc"
  spec.version      = version
  spec.summary      = "A short description of DigitalKyc."
  spec.description  = <<-DESC
                    IdNext
                   DESC

  spec.homepage     = "https://example.com/DigitalKyc"
  spec.license      = "Proprietary"
  spec.authors      = {'Kivanc Ersoy' => 'kivanc.ersoy@param.com.tr'}

  # Built with 15.6, compatible with 15.0 and above.
  spec.platform     = :ios, "15.6"

  spec.source = {
  :http => "https://packages.param.com.tr/repository/DigitalKyc-iOS-sdk/DigitalKyc/#{version}/DigitalKyc-#{version}.zip"
}

  spec.static_framework = true
  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }


  spec.module_name = 'DigitalKyc'
  spec.default_subspecs = 'Core'

  # Core functionality
  spec.subspec "Core" do |core|
    core.vendored_frameworks = "DigitalKyc-iOS-sdk/Sources/Default/DigitalKyc.xcframework" 
    core.resource_bundles = { "DigitalKycAssets" => ["DigitalKyc-iOS-sdk/Resources/**/*"] } 

    core.dependency "GoogleMLKit/FaceDetection", "8.0.0"
    core.dependency "OpenSSL-Universal", "~> 1.1.1900"
  end

  # Optional VideoKYC functionality
  spec.subspec "VideoKyc" do |videokyc|
    videokyc.vendored_frameworks = "DigitalKyc-iOS-sdk/Sources/Video/DigitalKyc.xcframework"  
    videokyc.resource_bundles = { "DigitalKycAssets" => ["DigitalKyc-iOS-sdk/Resources/**/*"] }

    videokyc.dependency "GoogleMLKit/FaceDetection", "8.0.0"
    videokyc.dependency "OpenSSL-Universal", "~> 1.1.1900"
    videokyc.dependency "JitsiMeetSDK", "11.1.4"
  end

end
