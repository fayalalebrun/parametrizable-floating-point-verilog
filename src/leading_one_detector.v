`ifndef __LEADING_ONE_DETECTOR_V__
`define __LEADING_ONE_DETECTOR_V__

module leading_one_detector
    #(parameter WIDTH = 8) (
        input [WIDTH-1:0] in,
        output reg [$clog2(WIDTH)-1:0] position,
        output has_leading_one
    );

    assign has_leading_one = in != 0;
    
    genvar i;
    generate
        for (i = WIDTH-1; i >= 0; i = i - 1) begin
            always @(*) begin
                if (has_leading_one) begin
                    if (in[i] == 1'b1 && (i == WIDTH-1 ? 1'b1 : in[WIDTH-1:i+1] == 0)) begin
                        position = i;
                    end
                end
            end
        end
    endgenerate

endmodule

`endif
