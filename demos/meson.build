if get_option('enable_demo')
  demo_dependencies = [
      libmovingpicture_dep,
      dependency('gtk4')
  ]

  demo_sources = [files('Demo.vala')]

  # Create executable for unit tests
  demo_exe = executable(
      LIBRARY_NAME + '-demo',
      demo_sources,
      dependencies: demo_dependencies,
  )

  fs.copyfile('dancing-banana.gif')
endif