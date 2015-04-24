A fork of the 'versions-maven-plugin' (http://mojo.codehaus.org/versions-maven-plugin/), with the ability to automatically increment Maven POM version numbers in multi-module builds.

The ultimate aim is to merge the features in this project into the 'versions-maven-plugin' trunk. See the plugin's JIRA http://jira.codehaus.org/browse/MVERSIONS-176 for details.

# Summary #
Let's say you have a POM with the following version:

```
<project ... >
    <groupId>com.example</groupId>
    <artifactId>my-project</artifactId>
    <version>1.0.1</version>
...
```

If you run the plugin, the project's version number will be automatically incremented to **1.0.2**.

```
<project ... >
    <groupId>com.example</groupId>
    <artifactId>my-project</artifactId>
    <version>1.0.2</version>
...
```

Simple!

## Getting started ##
Looking for more detail? See GettingStarted.

# Multi-module projects #
You can run this on a multi-module Maven project and as each artifact's version is incremented, any projects referring to it in the same build will have their corresponding references updated too.

So, in this example, if we had two other projects in this build that used to refer to the old **com.example:my-project:1.0.1** their dependencies will have been automatically updated to point to **com.example:my-project:1.0.2**!

# Use case #
In a multi-module project, you might have a number of child projects for which you would like to increment the version number. The version numbers of the child projects are not the same, so a single static 'newVersion' won't do.

Functionally-speaking, this is a variant of the standard use case for the 'set' goal (http://mojo.codehaus.org/versions-maven-plugin/set-mojo.html), however, the 'newVersion' property does not have to be specified, and the plugin attempts to automatically increment the 'oldVersion' found in a POM it is going to change.

You just need to use the 'increment' goal, instead of 'set'.

Check out ImplementationDetails or GettingStarted for further information.