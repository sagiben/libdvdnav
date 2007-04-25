
usage()
{
	cat <<EOF
Usage: dvdnav-config [OPTIONS] [LIBRARIES]
Options:
	[--prefix[=DIR]]
	[--version]
        [--libs]
	[--cflags]
EOF
	exit $1
}

if test $# -eq 0; then
	usage 1 1>&2
fi

while test $# -gt 0; do
  case "$1" in
  -*=*) optarg=`echo "$1" | sed 's/[-_a-zA-Z0-9]*=//'` ;;
  *) optarg= ;;
  esac

  case $1 in
    --prefix)
      echo_prefix=yes
      ;;
    --version)
      echo $version
      ;;
    --cflags)
      echo_cflags=yes
      ;;
    --libs)
      echo_libs=yes
      ;;
    *)
      usage 1 1>&2
      ;;
  esac
  shift
done

if test "$echo_prefix" = "yes"; then
	echo $prefix
fi

if test "$echo_cflags" = "yes"; then
      echo -I$prefix -I$prefix/dvdnav @THREAD_CFLAGS@
fi

if test "$echo_libs" = "yes"; then
      echo -L$prefix -ldvdnav @THREAD_LIBS@
fi      
