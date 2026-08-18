# rv32um

基于 Xilinx FPGA 的 **RV32UM 五级流水线 RISC-V 处理器**项目，使用 Verilog 实现，Vivado 2021.2 开发。

## 项目概览

本仓库包含两个独立的 Vivado 工程：

| 目录 | 内容 |
|------|------|
| `riscv32_pipeline/` | 核心工程：RV32UM 五级流水线 CPU，含分支预测、Cache、UART/Timer/LED 等外设，已移植 CoreMark 基准测试 |
| `top_axi_iic_spi/` | 外设工程：基于 AXI4-Lite 总线的 IIC + SPI 主控制器 |

文件夹结构如下：
```
rv32um/
├── .gitignore
├── README.md
├── riscv32_pipeline/           # 主处理器工程（五级流水线 RV32UM）
│   ├── coremark-main/           #   CoreMark 基准测试源码
│   ├── riscv32_pipeline.srcs/   #   源码集（RTL / Testbench / 约束 / IP）
│   ├── tools/                   #   辅助工具（指令集模拟器）
│   ├── riscv32_pipeline.xpr     #   Vivado 工程文件
│   └── *.coe / *.mem            #   存储器初始化文件
└── top_axi_iic_spi/             # 外设子工程（AXI IIC/SPI）
    ├── top_axi_iic_spi.srcs/    #   源码集（RTL / Testbench）
    └── top_axi_iic_spi.xpr      #   Vivado 工程文件
``` 
---

## 1. riscv32_pipeline（CPU 核心工程）

### 流水线结构

经典五级流水线 **IF → ID → EX → MEM → WB**，各阶段寄存器及组合逻辑位于 `riscv32_pipeline.srcs/sources_1/new/combine/`：

- `IF.v` / `IF_ID.v` — 取指级及流水线寄存器
- `ID.v` / `ID_EX.v` — 译码级及流水线寄存器
- `EX.v` / `EX_MEM.v` — 执行级及流水线寄存器
- `MEM.v` / `MEM_WB.v` — 访存级及流水线寄存器
- `WB.v` — 写回级

### 核心模块（`basic/`）

| 子目录 | 模块 | 说明 |
|--------|------|------|
| `alu/` | `ALU.v` `COMP.v` `immGen.v` | 算术逻辑单元、比较器、立即数生成 |
| `ctrl/` | `CTRL.v` `ALUope.v` `BranchCTRL.v` `ExceptionCTRL.v` `ForwardingUnit.v` `InstDivider.v` | 主控制、ALU 操作译码、分支控制、异常控制、数据转发、指令分割 |
| `mem/` | `instMem.v` `dataMem.v` `regFIle.v` | 指令存储器、数据存储器、寄存器堆 |
| `pc/` | `PC.v` `NPC.v` `BHT.v` `BTB.v` `BranchPredictor.v` | 程序计数器、下一 PC 计算、分支历史表、分支目标缓冲、动态分支预测器 |
| `clk/` | `cpuclk.v` | 时钟管理（MMCM/PLL 封装） |

### M 扩展（`M extension/`）

- `multiplier.v` — 16周期乘法器（MUL/MULH/MULHSU/MULHU）
- `divider.v` — 32周期除法器（DIV/DIVU/REM/REMU）

### Cache（`cache/`）

- 二路组相联
- `cache.v` — Cache 控制器
- `iCache_Wrapper.v` — 指令 Cache 包装（含 BRAM）
- `dCache_Wrapper.v` — 数据 Cache 包装（含 BRAM）

### IO 与外设（`IO/`）

- `BUS/BUS.v` — 总线仲裁
- `interface_UART.v` — UART 串口 0xFFFF_F080 ~ 0xFFFF_F08F
- `interface_Timer.v` — 定时器 0xFFFF_F090 ~ 0xFFFF_F09F
- `interface_LED_SWITCH/` — LED 与拨码开关
- `interface_NUMLED/` — 数码管
- `interface_RAM/` — 外部 RAM 接口

### 顶层与参数

- `top.v` — FPGA 顶层（含时钟、复位、外设 IO）
- `miniRV.v` — CPU 核顶层（集成流水线 + Cache + 外设）
- `param.v` — 全局参数定义

### 测试与验证

- `riscv32_pipeline.srcs/sim_1/new/` — 各模块及整机 Testbench（`tb_top.v`、`tb_rv32um.v`、`tb_coremark.v`、`tb_branch_accuracy.v` 等）
- `coremark-main/` — CoreMark 基准测试源码及 RV32IM 移植（含 `Makefile.rv32im`、`link.ld`、`start.S`、`bin2coe.py` 等）
- `report_artifacts/` — 实验产出：分支预测准确率分析、Cache 面积/时序报告、回归测试包等

### 其他文件

- `riscv32_pipeline.xpr` — Vivado 工程文件
- `timing.xdc` — 时序与引脚约束
- `inst.coe` / `coremark.coe` / `test_current.mem` — 存储器初始化文件

---

## 2. top_axi_iic_spi（外设工程）

基于 **AXI4-Lite** 总线的 IIC + SPI 主控制器，源码位于 `top_axi_iic_spi.srcs/sources_1/new/`：

| 文件 | 说明 |
|------|------|
| `top_axi_iic_spi.v` | 顶层模块 |
| `axi_lite_slave.v` | AXI4-Lite 从设备接口（寄存器映射） |
| `iic_master.v` | I2C 主控制器 |
| `spi_master.v` | SPI 主控制器 |
| `reg_file.v` | 控制/状态寄存器文件 |

测试平台位于 `top_axi_iic_spi.srcs/sim_1/new/`，含各模块独立 Testbench 及 `tb_top.v` 整机仿真。

---

## 开发环境

- **语言**：Verilog-2001
- **工具**：Xilinx Vivado 2021.2
- **仿真**：Vivado XSim / Icarus Verilog（分支预测分析）
- **软件编译**：RISC-V GCC（`riscv64-unknown-elf-gcc`，`-march=rv32im -mabi=ilp32`）
- **目标器件**：Xilinx Artix-7 系列 FPGA（具体型号见工程约束）
