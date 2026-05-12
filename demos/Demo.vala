public class Demo : Gtk.Application {
    public Demo () {
        Object (application_id: "com.movingpicture.Demo");
    }

    public override void activate () {
        var window = new Gtk.ApplicationWindow (this) {
            title = "Basic GTK4 App",
            default_width = 400,
            default_height = 300
        };

        MovingPicture.Gif my_gif;

        try {
            my_gif = new MovingPicture.Gif ("dancing-banana.gif");            
        } catch (GLib.Error e) {
            error ("Could not find \"dancing-banana.gif\".\nMake sure that you are running the program in the same directory as \"dancing-banana.gif\"");
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
        var app = new Demo ();
        return app.run (args);
    }
}