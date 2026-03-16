module dut(
 input clk, rst,
 output reg [3:0] s1, s10, m1, m10, h1, h10
 );
 reg [25:0] count;
 wire sec_tick;
 
 always@(posedge clk or negedge rst)
 begin  
   if (!rst)
      count <= 26'd0;
   else 
     begin 
       if (count == 26'd1)
           count <= 26'd0;
       else 
           count <= count + 1;
     end
 end
 
 assign sec_tick = (count == 26'd1);
 
 always@(posedge clk or negedge rst)
 begin 
   if (!rst) begin
      s1 <= 0;
      s10 <= 0;
      m1 <= 0;
      m10 <= 0;
      h1 <= 0;
      h10 <= 0; 
   end
   
  else if (sec_tick) begin
    if (s1 == 9) begin
        s1 <= 0;
        if (s10 == 5) begin
            s10 <= 0;
            if (m1 == 9) begin
                m1 <= 0;
                if (m10 == 5) begin
                    m10 <= 0;
                    if (h10 == 2 && h1 == 3) begin
                        h1 <= 0;
                        h10 <= 0;
                    end
                    else if (h1 == 9) begin
                        h1 <= 0;  
                        h10 <= h10 + 1;
                    end
                    else begin
                        h1 <= h1 + 1;
                    end
                end
                else begin
                    m10 <= m10 + 1;
                end
            end
            else begin
                m1 <= m1 + 1;
            end
        end
        else begin
            s10 <= s10 + 1;
        end
    end
    else begin
        s1 <= s1 + 1;
    end
   end

    end
endmodule
