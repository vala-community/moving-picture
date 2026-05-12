void add_foo_tests () {
    Test.add_func (@"$(MovingPicture.Constants.OBJECT_PATH)/test", () => {
        assert ("foo" + "bar" == "foobar");
    });
}

void main (string[] args) {
    Test.init (ref args);
    add_foo_tests ();
    Test.run ();
}
