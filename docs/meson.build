if get_option('enable_valadoc')
  valadoc = find_program('valadoc')

  lib_docs = custom_target(
    '@0@_docs.'.format(LIBRARY_NAME),
    input: sources,
    output: LIBRARY_NAME,
    command: [
      valadoc,
      # @OUTPUT@ points to 'build/docs/'
      '-o', '@OUTPUT@', 
      '--package-name=@0@'.format(LIBRARY_NAME),
      '--package-version=@0@'.format(PROJECT_VERSION),
      '--doclet', 'devhelp',
      '@INPUT@',
      '--force'
    ],
    install: true,
    install_dir: get_option('datadir') / 'devhelp' / 'books',
    build_by_default: true
  )
endif
