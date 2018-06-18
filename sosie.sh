#!/bin/bash
# sosie.sh
# Modified by: Joshua Murphy
#
# The code below to install HDF and netCDF was written by someone else
# and modified from their source which is listed below:
# https://gist.github.com/perrette/cd815d03830b53e24c82
# 
# My additions divide the code up into functions, remove some complexity
# we don't need, and also install SOSIE as part of the process.
# 
# The code is designed to install netCDF, hdf5, zlib and SOSIE
# strictly on a ***Ubuntu*** machine. Tested only on 18.04.
#

install_zlib () {
  v=1.2.8  
  # Download the zlib library
  wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4/zlib-${v}.tar.gz
  # Unzip our download and move into the zlib directory
  tar -xf zlib-${v}.tar.gz && cd zlib-${v}
  # Run the 'configure' script to prepare the library for compilation
  ./configure --prefix=/usr/local
  # Install, then return to previous directory.
  make -j 4 && sudo make install && make clean 
  # Don't checkinstall zlib, it broke my X11.
  sudo make install
  cd ..

}

install_hdf () {
  v=1.8.13

  # Download the hdf5 library
  wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-4/hdf5-${v}.tar.gz
  # Unzip our download and move into the hdf5 directory
  tar -xf hdf5-${v}.tar.gz && cd hdf5-${v}
  ./configure --enable-shared --enable-hl --prefix=$HDF5_DIR
  make -j 4 && sudo make install && make clean 
  sudo checkinstall
  cd ..

}

install_netcdf () {
  v=4.6.1

  # Download the netCDF library
  wget http://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-${v}.tar.gz
  tar -xf netcdf-${v}.tar.gz && cd netcdf-${v}
  prefix="/usr/local/"
  export CPPFLAGS=-I$HDF5_DIR/include
  export LDFLAGS=-L$HDF5_DIR/lib 
  ./configure --enable-netcdf-4 --enable-shared --enable-dap --prefix=$NETCDF4_DIR
  make -j 4 
  sudo make install 
  make clean 
  sudo checkinstall
  cd ..
}

install_netcdf_fortran () {
  v=4.4.4
  # Download the Fortran bindings
  wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-fortran-${v}.tar.gz
  tar -xf netcdf-fortran-${v}.tar.gz && cd netcdf-fortran-${v}
  export CPPFLAGS=-I/include
  ./configure 
  make -j 4 
  sudo checkinstall
  make clean 
  cd ..
}

install_sosie() {
  git clone https://github.com/brodeau/sosie
  cd ./sosie
  cp ./macro/make.macro_gfortran_Debian ./make.macro
  make -j 4 && sudo make install && make clean 
  sudo checkinstall
  cd ..
}

uninstall () {
  dpkg -r zlib hdf5

}

if [ "$1" = "install" ]; then
  sudo apt install git gcc gfortran build-essential checkinstall
  install_zlib
  install_hdf
  install_netcdf
  install_netcdf_fortran
  install_sosie

elif [ "$1" = "uninstall" ]; then
  uninstall 
else
    echo You must supply a valid argument
    echo Type ./sosie.sh install to install.
    echo Type ./sosie.sh uninstall to uninstall
fi

