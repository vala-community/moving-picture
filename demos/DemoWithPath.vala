public class DemoWithPath : Gtk.Application {
    public DemoWithPath () {
        Object (application_id: "com.movingpicture.DemoWithPath");
    }

    public override void activate () {
        var window = new Gtk.ApplicationWindow (this) {
            title = "Basic GTK4 App",
            default_width = 400,
            default_height = 300
        };

        MovingPicture.Gif my_gif;

        try {
            my_gif = new MovingPicture.Gif.from_path ("dancing-banana.gif");
        } catch (GLib.Error e) {
            error ("Make sure that you are running the program in the same directory as \"dancing-banana.gif\"\nError: %s", e.message);
        }

        my_gif.halign = Gtk.Align.CENTER;
        my_gif.valign = Gtk.Align.CENTER;

        var root_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 4);
        root_box.hexpand = true;
        root_box.vexpand = true;
        root_box.append (my_gif);

        window.child = root_box;
        window.present ();
    }

    public static int main (string[] args) {
        var app = new DemoWithPath ();
        return app.run (args);
    }
}