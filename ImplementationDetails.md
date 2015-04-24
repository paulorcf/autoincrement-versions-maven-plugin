# Introduction #

This page gives details about the changes to the 'versions-maven-plugin'.

# Details #

The code was forked from https://svn.codehaus.org/mojo/trunk/mojo/versions-maven-plugin at `r15873`

I have relied on existing Maven project functionality (notably the **maven-release-manager**, also used by the **maven-release-plugin**) to perform the version increment functionality.

A dependency on the **maven-release-manager** has been added to the versions-maven-plugin POM, and the code changes are localised to the following classes:
> `org.codehaus.mojo.versions.AbstractVersionsSetMojo` _(new)_

> `org.codehaus.mojo.versions.IncrementMojo` _(new)_

> `org.codehaus.mojo.versions.SetMojo` _(modified)_

The increment functionality lives in a new `IncrementMojo`. Since it shares a lot with the `SetMojo`, they now both extend a base class containing the common functionality.

# Patch file #

There is a patch file that you can apply to the plugin at the repository above to add this functionality.

See [autoincrement-versions-maven-plugin-patch-2.txt](http://code.google.com/p/autoincrement-versions-maven-plugin/source/browse/files/autoincrement-versions-maven-plugin-patch.txt)