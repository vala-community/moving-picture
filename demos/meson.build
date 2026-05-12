if get_option('enable_demo')
  demo_dependencies = [
      libmovingpicture_dep,
      dependency('gtk4'),
      dependency('libsoup-3.0'),
  ]

  path_demo_sources = [files('DemoWithPath.vala')]
  stream_demo_sources = [files('DemoWithStream.vala')]

  # Create exectuables for demos
  path_demo_exe = executable(
      LIBRARY_NAME + '-demo-with-path',
      path_demo_sources,
      dependencies: demo_dependencies,
  )

  stream_demo_exe = executable(
      LIBRARY_NAME + '-demo-with-stream',
      stream_demo_sources,
      dependencies: demo_dependencies,
  )

  fs.copyfile('dancing-banana.gif')
endif