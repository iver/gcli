# Gcli

The Googlon command line interface is designed as a Challenge and now you can download the latest version build on Mac OS from http://iver.mx/gcli

```
$ wget http://iver.mx/gcli
```

You can view Googlon full description on the googlon library site (https://github.com/iver/googlon#description).

## INSTALLATION

* You need to install [Elixir](https://elixir-lang.org/install.html).
* Is highly recommended to add Elixir’s bin path to your PATH environment variable to ease development.
* On Windows, [there are instructions](http://www.computerhope.com/issues/ch000549.htm) for different versions explaining the process.
* On Unix systems, you need to find your shell profile file, and then add to the end of this file the following line reflecting the path to your Elixir installation:

   ```
    export PATH="$PATH:/path/to/elixir/bin"
   ```

### Checking the installed version of Elixir

Once you have Elixir installed, you can check its version by running

```
$ elixir --version
```

## Clone Project

If you wish to develop, test or run the project it is necessary to clone the project:

```
$ git clone git@github.com:iver/gcli.git ~/Workspace/gcli
```

## Build then

If you have `gcc` on your machine, probably don't need to install nothing else. But if you need it and you are on Linux, the best way to run is using `make`, then with the follow command could install make dependencies:

```
$ sudo apt-get install gcc-multilib
```

On mac there is now another way to install the gcc toolchain on OS X through the [osx-gcc-installer](https://github.com/kennethreitz/osx-gcc-installer/commits/master) this includes:

* GCC
* LLVM
* Clang
* Developer CLI Tools (purge, make, etc)
* DevSDK (headers, etc)

The download is 282MB vs 3GB for Xcode.

After that you can use make:

```
$ make build
mix clean
rm -f gcli
mix deps.get
All dependencies are up to date
mix deps.compile
mix compile
Compiling 3 files (.ex)
Generated gcli app
mix escript.build
Generated escript gcli with MIX_ENV=prod
```

## Run gcli

Now, you can run gcli:

```
$ ./gcli -h
NAME
	 Gcli -- Googlon command line interface

SYNOPSIS
	 gcli [--parse(default)] <text to parse>

AUTHOR
	 Iván Jaimes
	 ivan@iver.mx

DESCRIPTION
	 For prepositions, verbs, subjunctive verbs, lexicographical order and number representation in Googlon language Gcli
       parse, count, order and show words. Whether you need convert from googlon number to decimal number, gcli allows you to
       knows the pretty googlon numbers too.


OPTIONS
	 -s | --sort 		Sorts the words of the text added according to the alphabet.
	 -c | --count 		Counts the googlon counts prepositions, verbs, subjunctive verbs and pretty numbers.
	 -p | --parse 		Parse the googlon text given and extract words, counts prepositions, verbs, subjunctive verbs
                             	and sort each word according to googlon alphabet (sxocqnmwpfyheljrdgui).
	 -h | --help 		Shows the help.
	 -v | --version 	Shows the gcli version.
```
