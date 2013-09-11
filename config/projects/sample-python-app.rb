
name "sample-python-app"
maintainer "CHANGE ME"
homepage "CHANGEME.com"

replaces        "sample-python-app"
install_path    "/opt/sample-python-app"
build_version   Omnibus::BuildVersion.new.semver
build_iteration 1

# creates required build directories
dependency "preparation"

# sample-python-app dependencies/components
dependency "zlib"
dependency "curl"
dependency "openssl"
dependency "python"
dependency "pycrypto"
dependency "pyopenssl"
dependency "python-readline"
dependency "requests"
dependency "virtualenv"
dependency "virtualenvwrapper"


# version manifest file
dependency "version-manifest"

exclude "\.git*"
exclude "bundler\/git"
