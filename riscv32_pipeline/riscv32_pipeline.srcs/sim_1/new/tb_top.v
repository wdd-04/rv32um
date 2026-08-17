// `timescale 1ns / 1ps

// module tb_top();
//     reg clk;
//     reg rst_n;
    
//     // 1. �������źŸ�Ϊ reg������ʼ��Ϊ 0����ֹ Z ̬���� CPU �߼�
//     reg [31:0] tb_mem_rd; 
    
//     wire        mem_we;
//     wire [31:0] mem_addr;
//     wire [31:0] mem_wd;
//     wire [0:0]  mem_ctrl;
    
//     wire        wb_have_inst;
//     wire [31:0] wb_pc;
//     wire        wb_ena;
//     wire [4:0]  wb_reg;
//     wire [31:0] wb_value;

//     // 2. ʵ����
//     mini_rv u_dut (
//         .clk(clk),
//         .rst_n(rst_n),
//         .mem_we(mem_we),
//         .mem_addr(mem_addr),
//         .mem_wd(mem_wd),
//         .mem_rd(tb_mem_rd),   // ʹ�� tb �����ļĴ���
//         .mem_ctrl(mem_ctrl),
//         .wb_have_inst(wb_have_inst),
//         .wb_pc(wb_pc),
//         .wb_ena(wb_ena),
//         .wb_reg(wb_reg),
//         .wb_value(wb_value)
//     );

//     always #5 clk = ~clk;

//     initial begin
//         // �źų�ʼ��
//         clk = 0;
//         rst_n = 0;
//         tb_mem_rd = 32'b0; // ���� mem_rd �� Z ̬
        
//         // 3. ����ָ��
//         $readmemh("towers.mem", tb_top.u_dut.If.IF_irom.irom.inst.ram_data);
        
//         #50 rst_n = 1; // �ͷŸ�λ
//         $display(">>> Reset released, CPU starts running...");
//     end

//     // �Զ��ж��߼�
//     always @(posedge clk) begin
//         if (mem_we && mem_addr == 32'h80000000) begin
//             if (mem_wd == 32'h1) $display(">>> SUCCESS: Official Test Passed! <<<");
//             else $display("!!! FAILED: Test Error, Code: %h !!!", mem_wd);
//             $finish;
//         end
//     end

//     // ״̬����
//     initial begin
//         $monitor("Time: %t | PC: %h | Reg: %d | Val: %h", $time, wb_pc, wb_reg, wb_value);
//     end

//     initial begin
//         #200000000; 
//         $display("TIMEOUT: PC stays at %h, pipeline may be stalled.", wb_pc);
//         $finish;
//     end
// endmodule

// `timescale 1ns / 1ps

// module tb_top();
//     reg clk;
//     reg rst_n;
    
//     // 1. ���Լоߵ� CPU �� mem_rd������Ϊ reg��
//     reg [31:0] tb_mem_rd; 
    
//     wire        mem_we;
//     wire [31:0] mem_addr;
//     wire [31:0] mem_wd;
//     wire [0:0]  mem_ctrl;
    
//     wire        wb_have_inst;
//     wire [31:0] wb_pc;
//     wire        wb_ena;
//     wire [4:0]  wb_reg;
//     wire [31:0] wb_value;

//     // 2. DUT ʵ��
//     mini_rv u_dut (
//         .clk(clk),
//         .rst_n(rst_n),
//         .mem_we(mem_we),
//         .mem_addr(mem_addr),
//         .mem_wd(mem_wd),
//         .mem_rd(tb_mem_rd),
//         .mem_ctrl(mem_ctrl),
//         .wb_have_inst(wb_have_inst),
//         .wb_pc(wb_pc),
//         .wb_ena(wb_ena),
//         .wb_reg(wb_reg),
//         .wb_value(wb_value)
//     );

//     // ʱ��
//     always #5 clk = ~clk;

//     // ----------------------------
//     // �� data memory ģ�ͣ��� DataMem �е� addra(adr[15:2]) ���룩
//     // 16384 words -> ��ַλ [15:2] ����������64KB��
//     // ----------------------------
//     reg [31:0] dmem [0:16383];
//     integer i;
//     integer idx; // �������� dmem

//     initial begin
//         // ��ʼ��
//         clk = 0;
//         rst_n = 0;
//         tb_mem_rd = 32'b0;
//         for (i = 0; i < 16384; i = i + 1) dmem[i] = 32'b0;

//        // ����ָ�� ROM������ԭ��·����
//        $readmemh("rv32ui-p-add.mem", tb_top.u_dut.If.IF_irom.irom.inst.ram_data);

//         #50 rst_n = 1;
//         $display(">>> Reset released, CPU starts running...");
//     end

//     // �������ش���д������д�������������ݻ� CPU
//     always @(posedge clk) begin
//         // ��ȡ�������� DataMem �е� addra(adr[15:2]) ��Ӧ��
//         idx = mem_addr[15:2];
//         // ���д�������ַ������ԭ�гɹ���飩
//         if (mem_we && mem_addr == 32'h80000000) begin
//             if (mem_wd == 32'h1) $display(">>> SUCCESS: Official Test Passed! <<<");
//             else $display("!!! FAILED: Test Error, Code: %h !!!", mem_wd);
//            $finish;
//         end

//         if (mem_we) begin
//             if (idx >= 0 && idx < 16384) begin
//                 // ֧�ְ��ֻ��ֽ�д�루���� mem_ctrl==0 -> word, mem_ctrl==1 -> byte��
//                 if (mem_ctrl == 1'b0) begin
//                     dmem[idx] <= mem_wd; // word д
//                 end else begin
//                     // byte д������ addr[1:0] ѡ���ֽ�λ��
//                     case (mem_addr[1:0])
//                         2'b00: dmem[idx][7:0]   <= mem_wd[7:0];
//                         2'b01: dmem[idx][15:8]  <= mem_wd[7:0];
//                         2'b10: dmem[idx][23:16] <= mem_wd[7:0];
//                         2'b11: dmem[idx][31:24] <= mem_wd[7:0];
//                     endcase
//                 end
//             end
//             $display("DMEM WRITE @ %h (idx=%0d) <= %h ctrl=%b (PC=%h)", mem_addr, idx, mem_wd, mem_ctrl, wb_pc);
//         end

//         // ������ȡ���ݣ�����ַԽ���򷵻� 0
//         if (idx >= 0 && idx < 16384) tb_mem_rd <= dmem[idx];
//         else tb_mem_rd <= 32'b0;
//     end

//     // ���� / ״̬��ӡ������ mem_ctrl, idx��
//     initial begin
//         $monitor("Time: %t | PC: %h | mem_we: %b | mem_ctrl: %b | mem_addr: %h | idx: %0d | mem_wd: %h | mem_rd: %h | Reg: %d | Val: %h",
//                  $time, wb_pc, mem_we, mem_ctrl, mem_addr, idx, mem_wd, tb_mem_rd, wb_reg, wb_value);
//     end
//     initial begin
//     $monitor("TIME: %t | PC: %h | INST: %h", $time, u_dut.If.pc, u_dut.If.inst);
//     end

//     // ��ʱ����
//     initial begin
//         #200000000;
//         $display("TIMEOUT: PC stays at %h, pipeline may be stalled.", wb_pc);
//         $finish;
//     end

// endmodule

//`timescale 1ns / 1ps

//module tb_top();
//    reg clk;
//    reg rst_n;
    
//    // CPU �ӿ��ź� (λ���ϸ�ƥ�� mini_rv)
//    reg [31:0] tb_mem_rd; 
//    wire       mem_we;
//    wire [31:0] mem_addr;
//    wire [31:0] mem_wd;
//    wire [0:0] mem_ctrl; // ƥ�� mini_rv �� `IO_BUS_WIDTH_CTRL`
    
//    wire        wb_have_inst;
//    wire [31:0] wb_pc;
//    wire        wb_ena;
//    wire [4:0]  wb_reg;
//    wire [31:0] wb_value;

`timescale 1ns / 1ps

module tb_top_legacy();
   reg clk;
   reg rst_n;

   reg  [31:0] tb_mem_rd;
   wire        mem_we;
   wire [31:0] mem_addr;
   wire [31:0] mem_wd;
   wire [0:0]  mem_ctrl;

   wire        wb_have_inst;
   wire [31:0] wb_pc;
   wire        wb_ena;
   wire [4:0]  wb_reg;
   wire [31:0] wb_value;

   wire [31:0] next_pc_val = u_dut.If.next_pc;
   wire        flush_val   = u_dut.If.flush;
   // 1. ʵ���� CPU
   mini_rv u_dut (
       .clk(clk),
       .rst_n(rst_n),
       .mem_we(mem_we),
       .mem_addr(mem_addr),
       .mem_wd(mem_wd),
       .mem_rd(tb_mem_rd),
       .mem_ctrl(mem_ctrl),
       .wb_have_inst(wb_have_inst),
       .wb_pc(wb_pc),
       .wb_ena(wb_ena),
       .wb_reg(wb_reg),
       .wb_value(wb_value)
   );

   // ʱ������
   always #5 clk = ~clk;

   // 2. Data Memory (�����ڴ�) ģ��
   // CoreMark ��ҪԼ 16KB-32KB �� RAM �ռ����ڶ�ջ
   reg [31:0] dmem [0:16383]; // 64KB RAM
   integer i;

   initial begin
       // ��ʼ���ź�
       clk = 0;
       rst_n = 0;
       tb_mem_rd = 32'b0;
        
       // ��ʼ�������ڴ�
       for (i = 0; i < 16384; i = i + 1) dmem[i] = 32'b0;

       // 3. �����ġ����� CoreMark ָ�������
       // ·��������Ľ�ͼȷ�ϣ�u_dut -> If -> IF_irom -> irom -> inst -> ram_data
       $readmemh("coremark_32bit.mem", tb_top_legacy.u_dut.If.IF_irom.irom.inst.ram_data);

       $display("----------------------------------------------");
       $display(">>> CoreMark Simulation Start! Loading .mem...");
       $display("----------------------------------------------");

       #100 rst_n = 1; // �ͷŸ�λ
   end

   // 4. �������߼��������ô桢���ڴ�ӡ�ͷ������
   always @(posedge clk) begin
       if (mem_we) begin
           // A. ���⴮�ڴ�ӡ (��ַ 0x10000000)
           if (mem_addr == 32'h10000000) begin
               $write("%c", mem_wd[7:0]); // ���� C �����������ʾ
           end
            
           // B. ���������־ (��ַ 0x80000000)
           else if (mem_addr == 32'h80000000) begin
               $display("\n>>> Simulation Finish Signal Detected. Code: %h", mem_wd);
               $finish;
           end
            
           // C. ��ͨ����д (Data RAM)
           else if (mem_addr < 32'h00010000) begin
               // ������ü򵥵���д�߼��������� CPU ֧�� SB/SH�������ڴ���չ
               dmem[mem_addr[15:2]] <= mem_wd;
           end
       end
   end

   // �������߼� (����߼����أ�������ˮ��ͣ��)
   always @(*) begin
       if (mem_addr < 32'h00010000)
           tb_mem_rd = dmem[mem_addr[15:2]];
       else
           tb_mem_rd = 32'h0;
   end

   // 5. ״̬���� (ÿ 1000 ��ʱ�����ڴ�ӡһ�� PC����ֹˢ��)
   // initial begin
   //    $monitor("Time: %t | PC: %h | Reg: %d | Val: %h", $time, wb_pc, wb_reg, wb_value);
   // end

   // 6. ��ʱ���� (CoreMark ����ʱ��ϳ������� 50ms)
   initial begin
       #50000000; 
       $display("\n[TIMEOUT] CoreMark simulation took too long. Forced stop.");
       $finish;
   end

   // ---------------------------------------------------------
   // ָ��ִ����־���
   // ---------------------------------------------------------
   integer log_file;
   initial log_file = $fopen("cpu_trace.log", "w");
    
   always @(posedge clk) begin
   if (rst_n && wb_have_inst) begin
       if (wb_ena && wb_reg != 0) begin
           $display("[Commit] Time: %t | PC: %h | Write Reg: %d | Val: %h | NextPC: %h | Flush: %b", 
                    $time, wb_pc, wb_reg, wb_value, next_pc_val, flush_val);
       end else begin
           // ֻ����������ָ���ύʱ�Ŵ�ӡ�����Կ�ָ��
           if (wb_pc != 0)
               $display("[Commit] Time: %t | PC: %h | No Write | NextPC: %h | Flush: %b", 
                        $time, wb_pc, next_pc_val, flush_val);
       end
   end
end
endmodule
