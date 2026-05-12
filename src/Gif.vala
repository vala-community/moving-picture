public class MovingPicture.Gif : Gtk.Widget {
    public MovingPicture.GIFPaintable paintable { private get; construct; }
    private Gtk.Picture _picture;

    class construct {
        set_layout_manager_type (typeof (Gtk.BinLayout));
    }

    construct {
        _picture = new Gtk.Picture.for_paintable (paintable);
        _picture.set_parent (this);
    }

    public MovingPicture.Gif.from_path (string path) throws Error {
        Object (
            paintable: new MovingPicture.GIFPaintable.from_path (path)
        );
    }

    public MovingPicture.Gif.from_stream (GLib.InputStream stream, GLib.Cancellable? cancellable) throws Error {

        Object (
            paintable: new MovingPicture.GIFPaintable.from_stream (stream, cancellable)
        );
    }

    public async MovingPicture.Gif.from_stream_async (GLib.InputStream stream, GLib.Cancellable? cancellable) throws Error {
        Object (
            paintable: yield new MovingPicture.GIFPaintable.from_stream_async (stream, cancellable)
        );
    }

    ~Gif () {
        if (_picture != null) {
            _picture.unparent ();
        }
    }
   
}