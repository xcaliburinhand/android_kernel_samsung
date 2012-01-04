#!/bin/bash
make clean;
./compile_captivate.sh; 
./compile_captivate.sh BIGMEM ;
make clean;
./compile_vibrant.sh; 
./compile_vibrant.sh BIGMEM ;
make clean;
./compile_galaxys.sh; 
./compile_galaxys.sh BIGMEM ;
make clean;
./compile_galaxysb.sh;
./compile_galaxysb.sh BIGMEM ;

~/sync.sh;
