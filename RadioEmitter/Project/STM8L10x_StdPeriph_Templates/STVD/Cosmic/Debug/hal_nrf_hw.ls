   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.23 - 17 Sep 2014
   3                     ; Generator (Limited) V4.3.13 - 22 Oct 2014
   4                     ; Optimizer V4.3.11 - 22 Oct 2014
  61                     ; 19 u8 hal_nrf_rw(u8 value)
  61                     ; 20 {
  63                     .text:	section	.text,new
  64  0000               _hal_nrf_rw:
  68                     ; 22   return spi_transfer(value);
  73  0000 cc0000        	jp	_spi_transfer
  86                     	xdef	_hal_nrf_rw
  87                     	xref	_spi_transfer
 106                     	end
