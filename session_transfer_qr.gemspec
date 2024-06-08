# session_transfer_qr.gemspec
Gem::Specification.new do |spec|
  spec.name          = "session_transfer_qr"
  spec.version       = "0.1.0"
  spec.authors       = ["Abhilash Reddy"]
  spec.email         = ["abhilashmv@outlook.com"]
  spec.summary       = "A gem for transferring sessions via QR code in Rails apps"
  spec.description   = "This gem allows users to transfer their session between devices using a QR code."
  spec.homepage      = "https://github.com/abhionlyone/session_transfer_qr"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*", "README.md", "LICENSE.txt"]
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 6.0"
  spec.add_dependency "rqrcode", "~> 1.1"
  spec.add_dependency "jwt", "~> 2.2"
end