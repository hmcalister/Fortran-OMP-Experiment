PROGRAM main
    USE OMP_LIB
    IMPLICIT NONE
    INTEGER, PARAMETER :: file_handle = 1
    CHARACTER(LEN=20), PARAMETER :: file_name = "output.log"
    LOGICAL :: file_exists
    INTEGER :: i
    REAL :: partial_sum, total_sum

    INQUIRE(FILE=file_name, EXIST=file_exists)
    if (file_exists) then 
        OPEN(UNIT=file_handle, FILE=file_name, STATUS="old")
        CLOSE(UNIT=file_handle, STATUS="delete")
    end if
    OPEN(UNIT=file_handle, FILE=file_name, STATUS="new", ACTION="write")
    
    total_sum = 0
    !$OMP PARALLEL PRIVATE(partial_sum) SHARED(total_sum)
        partial_sum = 0

        !OMP DO
        do i=1,1000
            partial_sum=partial_sum+rand()
        end do

        !$OMP CRITICAL
            write (file_handle, *) "THREAD ID: ", omp_get_thread_num(), " - SUM: ", partial_sum
            total_sum = total_sum+partial_sum
        !$OMP END CRITICAL
    !$OMP END PARALLEL

    print *, "Total Sum: ", total_sum

END PROGRAM main