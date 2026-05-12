# moving-picture

GTK 4 GIF Widget Library

## Build Instructions

### Dependencies

- [meson](https://mesonbuild.com/)
- [ninja](https://ninja-build.org/)
- glib-2.0
- gobject-2.0

### Build Commands

First, set up the build directory by running the following command in the project root:

```sh
meson setup build --prefix=/usr
```

Build moving-picture (you need to run this in the project root):

```sh
meson compile -C build
```

To install moving-picture (you need to run this in the project root):

```sh
meson install -C build
```

## Testing

After setting up the build directory, you will be able to run tests.

To run tests (you need to run this in the project root), run this command:

```sh
meson test -C build
```

## Documentation

By default, documentation is built by default using [`valadoc`](https://docs.vala.dev/developer-guides/documentation/valadoc-guide.html)

If you would not like to generate documentation for this project, pass the additional `-Denable_valadoc=false` flag to meson.

If you haven't created the build directory, in the project root run:

```sh
meson setup build --prefix=/usr -Denable_valadoc=false
```

However, if you have already created the build directory, you can run the following command from the project root.

```sh
meson configure -Denable_valadoc=false build
```

To enable valadoc documentation generation again, perform the same commands again but replace `false` in `-Denable_valadoc=` with `true`.

---

Project generated using [vala-lib-starter-kit
](https://github.com/vala-community/vala-lib-starter-kit) template via [valdo](https://github.com/vala-lang/valdo)
