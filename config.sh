# Define custom utilities
# Test for macOS with [ -n "$IS_OSX" ]

function pre_build {
    build_swig

    # sigh
    sed -i -e "s/sirkne at gmail dot com/sirkne@gmail.com/" $REPO_DIR/setup.py

    (cd $REPO_DIR && python setup.py build --force)
    pwd
}

function run_tests {
    # Runs tests on installed distribution from an empty directory
    python --version
    python -c 'import sys; import Box2D; print("Imported Box2D successfully")'
    pytest -vv --pyargs Box2D.tests
}
