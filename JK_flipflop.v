module JK_flipflop (
    input wire clk,  
    input wire rst,   
    input wire s,     
    input wire r,     
    output wire q,    
    output wire qbar  
);

reg q_master, q_slave;

assign q = q_slave;
assign qbar = ~q_slave;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        q_master <= 1'b0; 
    end else begin
        if (~s && ~r) begin
            q_master <= q_master; 
        end else if (~s && r) begin
            q_master <= 1'b0; // Reset state
        end else if (s && ~r) begin
            q_master <= 1'b1; // Set state
        end else if (s && r) begin
            q_master <= ~q_master; // Toggle state
        end
    end
end

always @(negedge clk or posedge rst) begin
    if (rst) begin
        q_slave <= 1'b0; // Reset slave flip-flop
    end else begin
        q_slave <= q_master; // Capture master flip-flop output
    end
end

endmodule
