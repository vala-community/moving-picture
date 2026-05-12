project('libmovingpicture', 'vala', 'c',
  version: '0.0.1',
  meson_version: '>= 1.1.0',
  default_options: [
    'warning_level=2',
    'werror=false',
  ],
)

LIBRARY_NAME = meson.project_name()
GIR_NAME = 'MovingPicture'
PROJECT_DESCRIPTION = 'GTK4 GIF Widget Library'
PROJECT_VERSION = meson.project_version()
API_VERSION = '0.1'

pkgconfig = import('pkgconfig')
PKGCONFIG_DEPS = ['glib-2.0', 'gobject-2.0']
OBJECT_PATH = '/movingpicture'

vapidir = get_option('datadir') / 'vala' / 'vapi'

g_ir_compiler = find_program('g-ir-compiler', required: false)

libmovingpicture_deps = [
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('gtk4'),
  dependency('cairo'),
]

config_data = configuration_data()
config_data.set('OBJECT_PATH', OBJECT_PATH)
config_file = configure_file(
  input: 'src/Config.vala.in',
  output: '@BASENAME@',
  configuration: config_data,
)

subdir('src')
subdir('tests')
subdir('docs')
subdir('demos')
