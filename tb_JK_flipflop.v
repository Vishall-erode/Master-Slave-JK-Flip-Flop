module tb_JK_flipflop ;
reg clk;
reg s;
reg r;
reg rst;
wire q;
wire qbar;


JK_flipflop  vtt (
   .clk(clk),.s(s),.r(r),.rst(rst),.q(q),.qbar(qbar)
 );

initial begin
   forever #10 clk = ~clk;
end

initial begin 
  clk = 0; 
s = 0; 
r = 0; 
rst=1;
#20;
rst=0;
#20; s = 1; 
     r =  1; 

 

#40; $finish;
 end
initial begin
 $monitor("time= %0t||rst =%d|| set = %d || REset = %d || q1 = %d || q2 = %d",$time,rst,s,r,q,qbar);
end
endmodule

     