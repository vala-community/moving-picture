public class MovingPicture.GIFPaintable : Object, Gdk.Paintable {
	public  Gdk.PixbufAnimation anim { get; construct; }
	private Gdk.PixbufAnimationIter iter;
	private uint timeout_id = 0;

	construct {
		iter = anim.get_iter (null);
		start_animation ();
	}

	public GIFPaintable.from_path (string path) throws Error {
		Object (
			anim: new Gdk.PixbufAnimation.from_file (path)
		);

	}

	public GIFPaintable.from_stream (GLib.InputStream stream, GLib.Cancellable? cancellable) throws Error {
		Object (
			anim: new Gdk.PixbufAnimation.from_stream (stream, cancellable)
		);
		
	}

	public async GIFPaintable.from_stream_async (GLib.InputStream stream, GLib.Cancellable? cancellable) throws Error {
		Object (
			anim: yield new Gdk.PixbufAnimation.from_stream_async (stream, cancellable)
		);
	}

	private void start_animation () {
		// Use internal delay time for precise timing
		int delay = iter.get_delay_time ();
		if (delay < 0) {
			delay = 100; // For static images
		}

		timeout_id = GLib.Timeout.add (delay, () => {
			if (iter.advance (null)) {
				this.invalidate_contents ();
			}

			start_animation ();
			return false;
		});
	}

	public void snapshot (Gdk.Snapshot snapshot, double width, double height) {
		var pixbuf = iter.get_pixbuf ();

		var texture = new Gdk.MemoryTexture (
			pixbuf.width,
			pixbuf.height,
			pixbuf.has_alpha ? Gdk.MemoryFormat.R8G8B8A8 : Gdk.MemoryFormat.R8G8B8,
			pixbuf.read_pixel_bytes (),
			pixbuf.rowstride
		);

		// Draw the texture to the snapshot
		texture.snapshot (snapshot, width, height);
	}

	public int get_intrinsic_width () {
		return anim.get_width ();
	}

	public int get_intrinsic_height () {
		return anim.get_height ();
	}

	public Gdk.PaintableFlags get_flags() {
		return Gdk.PaintableFlags.STATIC_SIZE;
	}
}