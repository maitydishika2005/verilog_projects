module SimpleSystem (
    input clk,start, rst, 
    input [3:0] X,
    output reg ready,
    output reg [3:0] Z
);

//state encoding
parameter T0 = 3'b000;
parameter T1 = 3'b001;
parameter T2 = 3'b010;
parameter T3 = 3'b011;
parameter T4 = 3'b100;

reg S;
reg [2:0] state;
reg [3:0] R;


//generating state diagram

always @(posedge clk or posedge rst) begin
    if(rst) begin
        state <= T0;
    end
    else begin
        case(state) 
        T0: begin
            if(start) begin
                state <= T1;
            end
            
        end
        T1: begin
            state <= T2;
           
        end
        T2: begin
            state <= T3;
            
        end
        T3: begin
            if(S) begin
                state <= T4;
            end else begin
                state <= T0;
            end        
           
        end
        T4: begin
            if (start==0) begin
                state <= T0;
            end
            
        end
        default : begin
            state <= T0;
        end
        endcase
    end
    
end

always @(negedge clk or posedge rst) begin
    if(rst) begin
    R <= 4'b0000;
    S <= 1'b0;
    Z <= 4'b0000;
    ready <= 1'b0;  
end 
else begin  
    case (state)
       T0 : begin
        //no action
        ready <= 1'b0;
        Z <= Z;
       end
       T1 : begin
        //R <- X
        R <= X;
        ready <= 1'b0;
        Z <= Z;
       end
       T2 : begin
        // S <- R0 V R3
        S <= R[3]|R[0];
        ready <= 1'b0;
        Z <= Z;
       end
       T3 : begin
        //no action
        ready <= 1'b0;
        Z <= Z;
       end
       T4 : begin
        //Z <- R
        Z <= R;
        ready <= 1'b1;
       end
        default: begin
            R <= 4'b0000;
            S <= 1'b0;
            ready <= 1'b0;
            Z <= 4'b0000;
        end
    endcase
end

end
    
endmodule