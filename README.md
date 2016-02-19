docker-tinydns
===

A tiny tinydns docker image (it's based on alpine).

Quickstart
---

If you have the `data.cdb` file already, you can mount the
directory that contains it and start tinydns right away.

```sh
$ docker run -d --name tinydns \
  -v /path/to/tinydns:/etc/tinydns \
  -p 53:53/udp \
  hub.infoshift.co/tinydns
```

You can read more about [how to configure TinyDNS here](#configuration).

DNS Configuration<a name="configuration"></a>
---

The `data` file is the human-readable configuration file. This is what
we'll be using to configure tinydns.

```sh
cat > /path/to/tinydns/data <<EOF
Zexample.com:ns1.example.com.:support.example.com
&example.com::ns1.example.com
+example.com:192.168.1.1
EOF
```

Now, let's compile our `data` into `data.cdb`. This is the file that tinydns
reads for resolving dns queries.

```sh
$ docker run --rm -v /path/to/tinydns:/etc/tinydns hub.infoshift.co/tinydns tinydns-data
```

You can read more about TinyDNS configuration format here:
[AlpineLinux Wiki: TinyDNS Format](http://wiki.alpinelinux.org/wiki/TinyDNS_Format)

Limitations
---

This flavor of tinydns only current replies to UDP queries and does not support
TCP queries.

Links
---

- [AlpineLinux Wiki: TinyDNS Format](http://wiki.alpinelinux.org/wiki/TinyDNS_Format)
- [DJ Bernstein: How to Run a DNS Server](https://cr.yp.to/djbdns/run-server.html)
- [DJBDNSRocks.org](http://www.djbdnsrocks.org/)
