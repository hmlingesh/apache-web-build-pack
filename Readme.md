---

# A buildpack for hosting static HTML websites on Cloud Foundry using apache


## Using this buildpack as-is

Ensure that your app's root folder has an `index.html` or `index.htm` or `Default.htm` file (which will be served as the default page).

Run:

```
cf push --buildpack https://github.com/cloudfoundry-community/nginx-buildpack.git
```

## Custom configuration files

You can customise the configuration by adding a `httpd.conf` to your root folder.

If the buildpack detects this file it will be used in place of the built-in `httpd.conf`, and run through the
same erb processor.  An example of the most basic `httpd.conf` (this is the one included in the build pack's `conf` directory):

```
