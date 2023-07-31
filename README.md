# Fortran OMP Testing

A quick program to test file I/O as well as [OMP](https://curc.readthedocs.io/en/latest/programming/OpenMP-Fortran.html) multiprocessing in Fortran. 

Compile using `gfortran main.f90 -o main -fopenmp`, ensuring you link the OMP library. Run the resulting file using `./main`. Change the number of threads using the environment variable `OMP_NUM_THREADS=1024 ./main`.

After running the program check the partial sums of each thread in `output.log`