
sub vcl_init {
    new lb = directors.random();
    lb.add_backend(server1.backend(), 10.0);
    lb.add_backend(server2.backend(), 5.0);
}

sub vcl_recv {
    set req.backend_hint = lb.backend();
}
