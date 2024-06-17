module Counter4Bits (
	input CLK,
	input D0,D1,D2,D3,
	output [3:0] Count,
	input rst,
	input downUp,
	input Load,
	output TC);

wire [3:0] CI_CO;
reg TC,D0,D1,D2,D3;
reg [3:0] Data = {D0,D1,D2,D3};
DFRRHDLLX0 FF0(
	        .C(CLK),
	        .D(Data[0]),
	        .Q(Count[0]),
	        .QN(),
		.RN(rst)
);
DFRRHDLLX0 FF1(
	        .C(CLK),
	        .D(Data[1]),
	        .Q(Count[1]),
	        .QN(),
		.RN(rst)
);
DFRRHDLLX0 FF2(
	        .C(CLK),
	        .D(Data[2]),
	        .Q(Count[2]),
	        .QN(),
		.RN(rst)
);
DFRRHDLLX0 FF3(
	        .C(CLK),
	        .D(Data[3]),
	        .Q(Count[3]),
	        .QN(),
		.RN(rst)
);
FAHDLLX0 Sum0(
		.B(Data[0]),
	        .A(Count[0]),
		.S(Count[0]),
		.CI(!downUp),
		.CO(CI_CO[0])
);
FAHDLLX0 Sum1(
		.B(Data[1]),
	        .A(Count[1]),
		.S(Count[1]),
		.CI(CI_CO[0]),
		.CO(CI_CO[1])
);
FAHDLLX0 Sum2(
		.B(Data[2]),
	        .A(Count[2]),
		.S(Count[2]),
		.CI(CI_CO[1]),
		.CO(CI_CO[2])
);
FAHDLLX0 Sum3(
		.B(Data[3]),
	        .A(Count[3]),
		.S(Count[3]),
		.CI(CI_CO[2]),
		.CO(CI_CO[3])
);
EO2HDLLX0 XOR(
		.A(downUp),
		.B(CI_CO[3]),
		.Q(TC)
);
  always@(posedge CLK)
  begin
	if (rst) Count = 4'b0000;
	else if (Load) Count = Data;
	else Count = Count;
  end
endmodule
