vcom -2008 alu.vhd
vsim work.alu

add wave -position end sim:/alu/A
add wave -position end sim:/alu/B
add wave -position end sim:/alu/Sel
add wave -position end sim:/alu/Cin
add wave -position end sim:/alu/F
add wave -position end sim:/alu/Cout

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/B 10110000 0
force -freeze sim:/alu/Sel 0000 0
force -freeze sim:/alu/Cin 0 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/B 10110000 0
force -freeze sim:/alu/Sel 0001 0
force -freeze sim:/alu/Cin 0 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/B 10110000 0
force -freeze sim:/alu/Sel 0010 0
force -freeze sim:/alu/Cin 0 0
run
force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/B 10110000 0
force -freeze sim:/alu/Sel 0011 0
force -freeze sim:/alu/Cin 0 0
run
force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/B 10110000 0
force -freeze sim:/alu/Sel 0000 0
force -freeze sim:/alu/Cin 1 0
run
force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/B 10110000 0
force -freeze sim:/alu/Sel 0001 0
force -freeze sim:/alu/Cin 1 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/B 10110000 0
force -freeze sim:/alu/Sel 0010 0
force -freeze sim:/alu/Cin 1 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/B 10110000 0
force -freeze sim:/alu/Sel 0011 0
force -freeze sim:/alu/Cin 1 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/B 10110000 0
force -freeze sim:/alu/Sel 0100 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/B 00001011 0
force -freeze sim:/alu/Sel 0101 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/B 10110000 0
force -freeze sim:/alu/Sel 0110 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/B 00001011 0
force -freeze sim:/alu/Sel 0111 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/Cin 0 0
force -freeze sim:/alu/Sel 1000 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/Cin 0 0
force -freeze sim:/alu/Sel 1001 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/Cin 0 0
force -freeze sim:/alu/Sel 1010 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/Cin 0 0
force -freeze sim:/alu/Sel 1011 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/Cin 0 0
force -freeze sim:/alu/Sel 1100 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/Cin 0 0
force -freeze sim:/alu/Sel 1101 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/Cin 0 0
force -freeze sim:/alu/Sel 1110 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/Cin 0 0
force -freeze sim:/alu/Sel 1111 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/Cin 1 0
force -freeze sim:/alu/Sel 1010 0
run

force -freeze sim:/alu/A 11110000 0
force -freeze sim:/alu/Cin 1 0
force -freeze sim:/alu/Sel 1110 0
run

