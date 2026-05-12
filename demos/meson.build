if get_option('enable_demo')
  demo_dependencies = [
      libmovingpicture_deps,
      dependency('gtk4')
  ]

  demo_sources = [files('Demo.vala'), config_file]

  # Create executable for unit tests
  demo_exe = executable(
      LIBRARY_NAME + '-demo',
      demo_sources,
      dependencies: demo_dependencies,
  )
endif