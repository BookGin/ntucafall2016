# Environment

|       Type       |         Value          |        Version        |
| :--------------: | :--------------------: | :-------------------: |
|     Compiler     |     Icarus Verilog     | 10.1 (stable) (v10_1) |
|  Runtime Engine  | Icarus Verilog Runtime | 10.1 (stable) (v10_1) |

# Modules Implementation

## Pipeline Registers
為了做到記憶體存取延遲 10 cycle，需要在 PC 跟 pipeline registers 上新增處理 stall 的 signal

## Dcache_Top
負責處理記憶體讀寫操作，如果 cache hit，就直接從 cache 讀寫資料；如果 cache miss，依照下列步驟處理：
  1. hit miss 會將 stall signal 設為 1，Data Memory is available.
  2. 判斷 cache 是否 dirty，不是的話跳到第四步
  3. 進行 write back，等到 Data Memory ack 完成
  4. 賦予 Data Memory 的 read 權限，將 miss address的資料從 Data Memory 調出，送到 Register 儲存
  5. 當第三步完成以後，賦予 cache的 write 權限，將剛剛儲存在 Register 的資料寫入 cache 裡面，並更新 cache tag，Data Memory is unavaiable.
  6. 寫入cache tag以後，狀態會變成cache hit，直接從cache 繼續讀寫原先操作的資料。

## Dcache_Tag_Sram
它會根據 input 的 enable, write 信號，寫入或輸出指定 address 的資料

處理 cache 的 Tag 欄位共有 24 個 bit：
- 23: Valid-invalid bit
- 22: Dirty bit
- 21-0: Tag bit

## Dcache_Data_Sram
負責存放 cache 的 data，因為 offset 是 5 bits，一個 row 共有 $2^5=32$ 個 bytes

它也會根據 input 的 enable, write 信號，寫入或輸出指定 address 的資料


# Problems and Solutions
+ Coding Convention
相較於 project 1 而言，我們的 code 在 project 2 開始遵照一定的 coding style，方便組員間互相閱讀 code、debug

+ Icarus Verilog Bugs
考慮送 pull request 幫助作者修正 compile warning bug
Reference: https://github.com/steveicarus/iverilog/issues/93

+ 版本管理系統線圖複雜， commit 過於瑣碎
多利用 `git rebase`, `git merge` 等功能簡化線圖

+ Cache Bug
一開始並沒有考慮到 hit 值對 data 的影響，所以在 write back 的時候應該要儲存 Data Memory的值時，儲存到 sram 的值。

