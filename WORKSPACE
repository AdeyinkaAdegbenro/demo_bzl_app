load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
http_archive(
    name = "aspect_rules_ts",
    sha256 = "7d964d57c6e9a54b0ce20f27e5ea84e5b42b6db2148ab7eb18d7110a082380de",
    strip_prefix = "rules_ts-1.2.4",
    url = "https://github.com/aspect-build/rules_ts/releases/download/v1.2.4/rules_ts-v1.2.4.tar.gz",
)

##################
# rules_ts setup #
##################
# Fetches the rules_ts dependencies.
# If you want to have a different version of some dependency,
# you should fetch it *before* calling this.
# Alternatively, you can skip calling this function, so long as you've
# already fetched all the dependencies.
load("@aspect_rules_ts//ts:repositories.bzl", "rules_ts_dependencies")

rules_ts_dependencies(
    # This keeps the TypeScript version in-sync with the editor, which is typically best.
    ts_version_from = "//:package.json",

    # Alternatively, you could pick a specific version, or use
    # load("@aspect_rules_ts//ts:repositories.bzl", "LATEST_VERSION")
    # ts_version = LATEST_VERSION
)

# Fetch and register node, if you haven't already
load("@rules_nodejs//nodejs:repositories.bzl", "DEFAULT_NODE_VERSION", "nodejs_register_toolchains")

nodejs_register_toolchains(
    name= "node",
    node_version = DEFAULT_NODE_VERSION,
)

# Register aspect_bazel_lib toolchains;
# If you use npm_translate_lock or npm_import from aspect_rules_js you can omit this block.
load("@aspect_bazel_lib//lib:repositories.bzl", "register_copy_directory_toolchains", "register_copy_to_directory_toolchains")

register_copy_directory_toolchains()

register_copy_to_directory_toolchains()

http_archive(
    name = "aspect_rules_jest",
    sha256 = "9f327ea58950c88274ea7243419256c74ae29a55399d2f5964eb7686c7a5660d",
    strip_prefix = "rules_jest-0.15.0",
    url = "https://github.com/aspect-build/rules_jest/archive/refs/tags/v0.15.0.tar.gz",
)

####################
# rules_jest setup #
####################
# Fetches the rules_jest dependencies.
# If you want to have a different version of some dependency,
# you should fetch it *before* calling this.
# Alternatively, you can skip calling this function, so long as you've
# already fetched all the dependencies.
load("@aspect_rules_jest//jest:dependencies.bzl", "rules_jest_dependencies")

rules_jest_dependencies()

# Fetches the npm packages for jest-cli.
load("@aspect_rules_jest//jest:repositories.bzl", "jest_repositories")

jest_repositories(name = "jest")

load("@jest//:npm_repositories.bzl", jest_npm_repositories = "npm_repositories")

jest_npm_repositories()

