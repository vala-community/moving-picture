sources = [
  files([
    'Gif.vala'
  ]),
  config_file
]

libmovingpicture = library(
  LIBRARY_NAME + '-' + API_VERSION,
  sources,
  vala_header: LIBRARY_NAME + '.h',
  vala_vapi: LIBRARY_NAME + '-' + API_VERSION + '.vapi',
  vala_gir: GIR_NAME + '-' + API_VERSION + '.gir',
  soversion: API_VERSION,
  dependencies : libmovingpicture_deps,
  vala_args: [
    '--abi-stability'
    ],
  install: true,
  install_dir: [
    true,
    get_option('includedir') / LIBRARY_NAME + '-' + API_VERSION / LIBRARY_NAME,
    vapidir,
    g_ir_compiler.found()
  ]
)

libmovingpicture_dep = declare_dependency(
  link_with: libmovingpicture,
  include_directories: '.',
  dependencies: libmovingpicture_deps
)

if g_ir_compiler.found()
  custom_target(
    LIBRARY_NAME + '-typelib',
    command: [
      g_ir_compiler,
      '--shared-library', LIBRARY_NAME + '-@0@.so'.format (API_VERSION),
      '--output', '@OUTPUT@',
      meson.current_build_dir() / GIR_NAME + '-' + API_VERSION + '.gir'
    ],
    output: GIR_NAME + '-' + API_VERSION + '.typelib',
    depends: libmovingpicture,
    install: true,
    install_dir: join_paths(get_option('libdir'), 'girepository-1.0')
  )
endif

pkgconfig.generate(
  libmovingpicture,
  version: API_VERSION,
  name: LIBRARY_NAME,
  filebase: LIBRARY_NAME + '-' + API_VERSION,
  subdirs: LIBRARY_NAME + '-' + API_VERSION,
  requires: PKGCONFIG_DEPS,
  description: PROJECT_DESCRIPTION
)
