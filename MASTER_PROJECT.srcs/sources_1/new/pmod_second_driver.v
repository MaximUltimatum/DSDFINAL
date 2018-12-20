module pmod_second_driver(
    input rst,
    input dir,
    input clk,
    input en,
    output reg [3:0] signal,
    output reg [2:0] LED2z
    );
    
    //local parameters that hold the values of 
    // each of the states. This way the states 
    // can be referenced by name.
    localparam sig4 = 3'b001;
    localparam sig3 = 3'b011;
    localparam sig2 = 3'b010;
    localparam sig1 = 3'b110;
    localparam sig0 = 3'b000;
    
    // register values to hold the values 
    // of the present and next states.
    reg [2:0] present_state, next_state;
    reg dirT;
    reg enT;
        
        
        //TOGGLING
        always @(posedge dir)
        begin
            if(dir == 1'b1 && dirT == 1'b0)
                begin
                dirT <= 1'b1;
                LED2z[1] <= 1'b1;
                end
            else if(dir == 1'b1 && dirT == 1'b1)
                begin
                dirT <= 1'b0;
                LED2z[1] <= 1'b0;
                end
        end
        
        always @(posedge en)
        begin
            if(en == 1'b1 && enT == 1'b0)
                begin
                enT <= 1'b1;
                LED2z[0] <= 1'b1;
                end
            else if(en == 1'b1 && enT == 1'b1)
                begin
                enT <= 1'b0;
                LED2z[0] <= 1'b0;
                end
        end
    // run when the present state, direction
    // or enable signals change.
    always @(present_state, dirT, enT)
    begin
        // Based on the present state 
        //do something.
        case(present_state)
        // If the state is sig4, the state where 
        // the fourth signal is held high.
        sig4:
        begin
            // If direction is 0 and enable is high
            // the next state is sig3. If direction
            // is high and enable is high
            // next state is sig1. If enable is low
            // next state is sig0.
            if (dirT == 1'b0 && enT == 1'b1)
                next_state = sig3;
            else if (dirT == 1'b1 && enT == 1'b1)
                next_state = sig1;
            else 
                next_state = sig0;
         end
         
         sig3:
         begin
            // If direction is 0 and enable is high
            // the next state is sig2. If direction
            // is high and enable is high
            // next state is sig4. If enable is low
            // next state is sig0.
            if (dirT == 1'b0 && enT == 1'b1)
                next_state = sig2;
            else if (dirT == 1'b1 && enT == 1'b1)
                next_state = sig4;
            else
                next_state = sig0;
            
            
            
         end
         
         
         sig2:
         begin
            // If direction is 0 and enable is high
             // the next state is sig1. If direction
             // is high and enable is high
             // next state is sig3. If enable is low
             // next state is sig0.
            if (dirT == 1'b0 && enT == 1'b1)
                 next_state = sig1;
             else if (dirT == 1'b1 && enT == 1'b1)
                 next_state = sig3;
             else
                 next_state = sig0;
        end
        
        sig1:
        begin
            // If direction is 0 and enable is high
            // the next state is sig4. If direction
            // is high and enable is high
            // next state is sig2. If enable is low
            // next state is sig0.
            if (dirT == 1'b0 && enT == 1'b1)
               next_state = sig4;
            else if (dirT == 1'b1 && enT == 1'b1)
               next_state = sig2;
            else
               next_state = sig0;
            
        end
        
        sig0:
        begin
            // If enable is high
            // the next state is sig1
            // If the enable is low,
            // next state is sig0.
            if (enT == 1'b1)
                next_state = sig1;
            else
                next_state = sig0;
            
        end
        
        default:
            next_state = sig0;
        endcase
        
    end
    
    
    // State register that passes the next
    // state value to the present state 
    // on the positive edge of clock
    // or reset.
    always @(posedge clk, posedge rst)
    begin
        if (rst == 1'b1)
            present_state = sig0;
        else
            present_state = next_state;
    end
    
    // Output Logic
    // Depending on the state 
    // output signal has a different
    // value.
    always @(posedge clk)
    begin
        if (present_state == sig4)
            begin
            signal = 4'b1000;
            end
        else if (present_state == sig3)
            begin
            signal = 4'b0100;
            end
        else if (present_state == sig2)
            begin
            signal = 4'b0010;
            end
        else if (present_state == sig1)
            begin
            signal = 4'b0001;
            end
        else 
            begin
            signal = 4'b0000;
            end
            
     end
endmodule