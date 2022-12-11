# Import third party config rules.
load("@bazel_skylib//lib:versions.bzl", "versions")

# Toolchains & platforms required by Tensorflow to build.
def _zc_toolchains():
    pass

def _initialize_third_party():
    pass

def _zc_repositories():
    pass

def zcrt_dependencies():
    pass

def workspace():
    # Check the bazel version before executing any repository rules, in case
    # those rules rely on the version we require here.
    versions.check("1.0.0")

    # Initialize toolchains and platforms.
    _zc_toolchains()

    # Import third party repositories according to go/tfbr-thirdparty.
    _initialize_third_party()

    # Import all other repositories. This should happen before initializing
    # any external repositories, because those come with their own
    # dependencies. Those recursive dependencies will only be imported if they
    # don't already exist (at least if the external repository macros were
    # written according to common practice to query native.existing_rule()).
    _zc_repositories()
    zcrt_dependencies()

zc_workspace2 = workspace