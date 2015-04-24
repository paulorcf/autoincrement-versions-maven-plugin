# Introduction #

Here are some steps to get you started using the plugin.

**NOTE:** As this plugin is based on the existing 'versions-maven-plugin' (http://mojo.codehaus.org/versions-maven-plugin/), please see its documentation for details of its supported goals, usage etc.

# Details #

You can add the plugin to your POM as follows:

```
<plugin>
	<groupId>org.codehaus.mojo</groupId>
	<artifactId>autoincrement-versions-maven-plugin</artifactId>
	<version>2.0-SNAPSHOT</version>
	<executions>
		<execution>
			<id>update-pom-versions</id>
			<goals>
				<goal>increment</goal>
				<goal>commit</goal>
			</goals>
			<phase>compile</phase>
			<configuration>
				<autoIncrementVersion>true</autoIncrementVersion>
			</configuration>
		</execution>
	</executions>
</plugin>
```

Notice the use of the `increment` goal.

You can, of course, bind the plugin execution to the phase of your choice. Here we are using `compile` as an example.

## Repository ##
Unless you've grabbed the plugin source and installed it into your local repository, you're going to want to add a repository entry to your POM file too:

```
<pluginRepositories>
    <pluginRepository>
        <id>autoincrement-versions-maven-plugin</id>
        <name>autoincrement-versions-maven-plugin</name>
        <url>http://autoincrement-versions-maven-plugin.googlecode.com/svn/repo</url>
        <snapshots>
            <enabled>true</enabled>
        </snapshots>
    </pluginRepository>
</pluginRepositories>
```

# Example #
Using the settings above, if you were then to run the following command:

```
mvn compile
```

...on a project like this:
```
<project ... >
    <groupId>com.example</groupId>
    <artifactId>my-project</artifactId>
    <version>1.0.1</version>
...
```

You would see output like this:

```
...
[INFO] 
[INFO] --- autoincrement-versions-maven-plugin:2.0-SNAPSHOT:increment (update-pom-versions) @ my-project ---
[INFO] Searching for local aggregator root...
[INFO] Local aggregation root: /Users/developer/Development/workspace/example
[INFO] Processing com.example:my-project
[INFO]     Updating project com.example:my-project
[INFO]         from version 1.0.1 to 1.0.2
[INFO]
...
```

Sure enough, your project POM's version has been updated.

```
<project ... >
    <groupId>com.example</groupId>
    <artifactId>my-project</artifactId>
    <version>1.0.2</version>
...
```

That's it!

# Multiple child projects #
You can run this on a multi-module Maven project and as each artifact's version is incremented, any projects referring to it in the same build will have their corresponding references updated too.

So, in this example, if we had two other projects in this build that used to refer to the old **com.example:my-project:1.0.1** their dependencies will have been automatically updated to point to **com.example:my-project:1.0.2**!