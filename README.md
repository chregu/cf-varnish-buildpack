Deploy varnish to Cloud Foundry
-----------------------------------------------

Need Varnish on Cloud Foundry? It is now easy to have that.

You need to create your Varnish configuration file(s) in the directory _etc/_ and call the "master" file _default.vcl_. Then do


```
cf push my-varnish -m 128M -b https://github.com/chregu/varnish-buildpack.git
```

and it should soon be available on Cloud Foundry.

Configuration
=============

## Changing the memory size used by varnish

By default, this varnish uses _-s malloc,$MEMORY_LIMIT_, where $MEMORY_LIMIT is the memory limit applied to this app. you can overwrite that in the manifest.yml with

```
  env:
    VARNISH_MEMORY_LIMIT: 256m
```

The default values used for starting varnishd can be seen in [boot.sh](https://github.com/chregu/varnish-buildpack/blob/master/bin/boot.sh). If you want to change those, you can copy _boot.sh_ to your app root dir and set new values. (Maybe we'll make those adjustable via env variable later as well)


Administrator Upload
====================

Everyone can automatically use this buildpack if your Cloud Foundry Administrator uploads it.


### To create/upload from source repository

```
zip -r ../varnish-buildpack.zip *
cf create-buildpack varnish_buildpack ../varnish-buildpack.zip 10
```

Subsequently, update the buildpack with:

```
zip -r ../varnish-buildpack.zip *
cf update-buildpack varnish_buildpack -p ../varnish-buildpack.zip
```

Test that it correctly detects the buildpack:

```
cf push varnishtest -p test/fixtures/varnish
...
Staging failed: An application could not be detected by any available buildpack
```


Building Varnish
==============

We use docker for building varnish.

```
./bin/build_varnish
```

Varnish will be stuffed into a tarball in the `vendor/` folder.


Acknowledgements
================

This buildpack is based heavily upon Cloud Foundry's [staticfile-buildpack](https://github.com/cloudfoundry-incubator/staticfile-buildpack) (which is heavily based on Jordon Bedwell's Heroku buildpack and the modifications by David Laing for Cloud Foundry [nginx-buildpack](https://github.com/cloudfoundry-community/nginx-buildpack)). Thanks for the buildpack, Cloud Foundry!!
