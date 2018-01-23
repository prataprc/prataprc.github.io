set key left top
set title "Without SMP"
set xlabel "No. of puzzles"
set ylabel "uS"
set ytics 20000
plot "nosmp.dat" using 1 title "no. of puzzles" with lines
plot "nosmp.dat" using 2 title "Sequential" with lines, \
     "nosmp.dat" using 3 title "Parallel" with lines, \
     "nosmp.dat" using 4 title "Sequential-concurrent" with lines, \
     "nosmp.dat" using 5 title "Parallel-concurrent" with lines
set terminal png size 560,400 enhanced font "Helvetica,10"
set output "nosmp.png"
replot
reset

set key left top
set title "With SMP, 2 cores"
set xlabel "No. of puzzles"
set ylabel "uS"
set ytics 20000
plot "smp2.dat" using 1 title "no. of puzzles" with lines
plot "smp2.dat" using 2 title "Sequential" with lines, \
     "smp2.dat" using 3 title "Parallel" with lines, \
     "smp2.dat" using 4 title "Sequential-concurrent" with lines, \
     "smp2.dat" using 5 title "Parallel-concurrent" with lines
set terminal png size 560,400 enhanced font "Helvetica,10"
set output "smp2.png"
replot
reset

set key left top
set title "With SMP, 4 cores"
set xlabel "No. of puzzles"
set ylabel "uS"
set ytics 20000
plot "smp4.dat" using 1 title "no. of puzzles" with lines
plot "smp4.dat" using 2 title "Sequential" with lines, \
     "smp4.dat" using 3 title "Parallel" with lines, \
     "smp4.dat" using 4 title "Sequential-concurrent" with lines, \
     "smp4.dat" using 5 title "Parallel-concurrent" with lines
set terminal png size 560,400 enhanced font "Helvetica,10"
set output "smp4.png"
replot
reset

set key left top
set title "Comparing parallel execution on different core count"
set xlabel "No. of puzzles"
set ylabel "uS"
set ytics 20000
plot "nosmp.dat" using 1 title "no. of puzzles" with lines
plot "nosmp.dat" using 3 title "Single core" with lines, \
     "smp2.dat" using 3 title "SMP, 2 core" with lines, \
     "smp4.dat" using 3 title "SMP, 4 core" with lines
set terminal png size 560,400 enhanced font "Helvetica,10"
set output "par.png"
replot
reset

set key left top
set title "Comparing concurrent version on different core count"
set xlabel "No. of puzzles"
set ylabel "uS"
set ytics 20000
plot "nosmp.dat" using 1 title "no. of puzzles" with lines
plot "nosmp.dat" using 4 title "Single core" with lines, \
     "smp2.dat" using 4 title "SMP, 2 core" with lines, \
     "smp4.dat" using 4 title "SMP, 4 core" with lines
set terminal png size 560,400 enhanced font "Helvetica,10"
set output "conc.png"
replot
reset
