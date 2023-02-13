#!/bin/bash

echo "Removing old Bazel outputs"
bazel clean

echo "Running tests"
bazel run //:test

echo "Building files"
bazel build //:demo_bzl_app

echo "moving to output dir"
cd bazel-out/darwin-fastbuild/bin/demo_bzl_app

while true; do
    read -p "Do you wish to publish to NPM now? " yn
    case $yn in
        [Yy]* ) echo "Publishing package to NPM";
         npm publish; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "Done!"