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

        var my_gif = new MovingPicture.Gif ("dancing-banana.gif");

        var root_box = new Gtk.Box (Gtk.Orientation.VERTICAL, 4);
        root_box.append (my_gif);


        window.child = root_box;
        window.present ();
    }

    public static int main (string[] args) {
        var app = new Demo ();
        return app.run (args);
    }
}