// Control Panel LED
// via TX

module led_blink(
    output  reg [5:0]led,
    input   clk,
    input   sysrst
    );
    
    
    reg [31:0]dly;
    reg [31:0]cnt;
    
    
    
    always@(posedge clk) begin
        if(~sysrst) begin
            led <=6'b111_110;
            dly <=32'd0;
            cnt <=32'd0;
        end else begin
        
            if(dly < 32'd50000) begin
                dly <= dly +1;
            end else begin
                dly <= 32'd0;
                
                if(cnt < 32'd300) begin
                    cnt <= cnt +1;
                end else begin
                    cnt <= 32'd0;
             //       led <= ~led;
                      led[5:0] <= {led[4:0], led[5]};
                end
            end
        
        end
    
    end
    
    
endmodule
