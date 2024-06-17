module Test_Counter4Bits (downUp,rst,D0,D1,D2,D3,load);
output downUp,rst,load;
output D0,D1,D2,D3;
reg downUp,rst,load;
reg D0,D1,D2,D3;
  initial begin
	D0 = 1'b0;
	D1 = 1'b0;
	D2 = 1'b0;
	D3 = 1'b0;
	downUp = 1'b1;
	rst = 1'b0;
	load = 1'b0;
	#2
	D0 = 1'b1;
	D1 = 1'b1;
	D2 = 1'b0;
	D3 = 1'b0;
	downUp = 1'b0;
	rst = 1'b0;
	load = 1'b0;
	#2
	D0 = 1'b1;
	D1 = 1'b1;
	D2 = 1'b1;
	D3 = 1'b1;
	downUp = 1'b0;
	rst = 1'b1;
	load = 1'b0;
	#2
	D0 = 1'b1;
	D1 = 1'b0;
	D2 = 1'b1;
	D3 = 1'b0;
	downUp = 1'b0;
	rst = 1'b0;
	load = 1'b1;
	$finish;
  end
endmodule
