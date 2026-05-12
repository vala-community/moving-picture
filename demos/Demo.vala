public class Demo : Gtk.Application {
    public Demo () {
        Object (application_id: "com.movingpicture.Demo");
    }

    public override void activate () {
        var window = new Gtk.ApplicationWindow (this) {
            title = "Basic GTK4 App"
        };

        
        var button = new Gtk.Button.with_label ("Click me!");
        button.clicked.connect (() => {
            button.label = "Thank you";
        });

        window.child = button;
        window.present ();
    }

    public static int main (string[] args) {
        var app = new Demo ();
        return app.run (args);
    }
}