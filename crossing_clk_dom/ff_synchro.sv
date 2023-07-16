// Avoid metastability from fast to slow clocks

module fast_to_slow_synchronizer (
    input fast_clk,
    input slow_clk,
    input fast_data,
    output slow_data_out
);

    reg fast_data_sync1, fast_data_sync2;

    // Synchronize the fast data to the slow clock domain
    // making a train of ff's to reduce set-up/hold violation
    always @(posedge slow_clk) begin
        fast_data_sync1 <= fast_data;
        fast_data_sync2 <= fast_data_sync1;
    end

    // Output the synchronized data
    assign slow_data_out = fast_data_sync2;

endmodule

// this includes a handshake mechanism
module fast_to_slow_synchro (
    input slow_clk,
    input fast_clk,
    input slow_data,
    output fast_data_out
);

    reg slow_data_sync1, slow_data_sync2;
    reg slow_data_valid, slow_data_valid_sync1, slow_data_valid_sync2;

    // Synchronize the slow data to the fast clock domain
    always @(posedge fast_clk) begin
        slow_data_sync1 <= slow_data;
        slow_data_sync2 <= slow_data_sync1;
        slow_data_valid_sync1 <= slow_data_valid;
        slow_data_valid_sync2 <= slow_data_valid_sync1;
    end

    // Generate a data valid signal in the slow clock domain
    always @(posedge slow_clk) begin
        slow_data_valid <= 1'b1;
    end

    // Output the synchronized data when the valid signal is detected
    assign fast_data_out = (slow_data_valid_sync2 && !slow_data_valid_sync1) ? slow_data_sync2 : 1'bz;

endmodule

