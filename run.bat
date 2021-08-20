iverilog -o "mul_tb.vvp" mul_tb.v mul.v

vvp -n "mul_tb.vvp"

gtkwave mul_tb.vcd

python count_loss.py

pause