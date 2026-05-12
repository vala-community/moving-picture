public class DemoWithStream : Gtk.Application {
    const string GIF_URL = "https://media1.tenor.com/m/T2JK6SuvMYgAAAAC/dancing-banana-gif.gif";

    public Gtk.Box root_box { get; private set; }
    public DemoWithStream () {
        Object (application_id: "com.movingpicture.DemoWithStream");
    }

    public override void activate () {
        var window = new Gtk.ApplicationWindow (this) {
            title = "Basic GTK4 App",
            default_width = 400,
            default_height = 300
        };

        root_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 4);
        root_box.hexpand = true;
        root_box.vexpand = true;


        window.child = root_box;
        window.show.connect (window_presented);
        window.present ();
    }

    public async void window_presented (Gtk.Widget widget) {
        MovingPicture.Gif my_gif;

        try {
            var session = new Soup.Session ();
            var message = new Soup.Message ("GET", GIF_URL);
            print ("Created file GIF URL\n");
            
            var bytes = yield session.send_and_read_async (message, Priority.DEFAULT_IDLE, null);
            var gif_file_stream = new MemoryInputStream.from_bytes (bytes);
            print ("Created file stream for GIF\n");

            my_gif = yield new MovingPicture.Gif.from_stream_async (
                gif_file_stream, 
                null
            );

            print ("Creating GIF From stream\n");
        } catch (GLib.Error e) {
            error ("Error: %s", e.message);
        }

        my_gif.halign = Gtk.Align.CENTER;
        my_gif.valign = Gtk.Align.CENTER;
        root_box.append (my_gif);
    }

    public async static int main (string[] args) {
        var app = new DemoWithStream ();
        return app.run (args);
    }

}