unit_test_dependencies = [
    libmotionpicture_deps
]

unit_test_sources = [files('Test.vala'), config_file]

# Create executable for unit tests
test_exe = executable(
    LIBRARY_NAME + '-unit-tests',
    unit_test_sources,
    dependencies: unit_test_dependencies,
)

test(LIBRARY_NAME + '-unit-tests', test_exe)
