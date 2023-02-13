load("@aspect_rules_ts//ts:defs.bzl", "ts_project")

ts_project(
    name="transpile",
    srcs = ["src/index.ts"],
    tsconfig= "//:tsconfig.json",
    allow_js=True,
    resolve_json_module=True
)

load("@aspect_rules_jest//jest:defs.bzl", "jest_test")

jest_test(
    name = "test",
    config = "jest.config.js",
    data = [
        "src/index.ts", # dependency of the test file
        "tests/index.test.ts",
    ],
)

load("@aspect_rules_js//npm:defs.bzl", "npm_package")

npm_package(
    name="demo_bzl_app",
    srcs = [":transpile", "readme.md", "package.json"],
    package="demo_bzl_app",
)