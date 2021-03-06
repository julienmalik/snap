#! /bin/sh

if [ -z "$SNAP_HOME" ]; then
    export SNAP_HOME=$PWD
fi

$SNAP_HOME/jre/bin/java \
    -server -Xms512M -Xmx800M -Xverify:none \
    -XX:+AggressiveOpts -XX:+UseFastAccessorMethods \
    -XX:+UseParallelGC -XX:+UseNUMA -XX:+UseLoopPredicate -XX:+UseStringCache \
    -Dceres.context=snap \
    "-Ds1tbx.mainClass=org.esa.beam.framework.gpf.main.Main" \
    "-Ds1tbx.home=$SNAP_HOME" \
	"-Ds1tbx.debug=false" \
    "-Dncsa.hdf.hdflib.HDFLibrary.hdflib=$SNAP_HOME/libjhdf.so" \
    "-Dncsa.hdf.hdf5lib.H5.hdf5lib=$SNAP_HOME/libjhdf5.so" \
    -jar $SNAP_HOME/bin/ceres-launcher.jar "$@"

exit 0
