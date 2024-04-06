# [TR] 32 bitlik iki sayıyı (MUL emiri kullanmadan) çarpan programın Assembly kodu! 

- Bu assembly kodunda, kullanıcı belirli bellek bölgelerine 32 bitlik sayilar girer. Bellek bölgesine 32 bitlik bir sayı gireceği için,
sayının 16 bitlik kısımlarını girmelidir. Örneğin sayı **02610842H** olsun bellek bölgesine şöyle yerleştirmelidir:
>[0200H] -> 00261H
>[0202h] -> 00842H

- Yerleştirdikten sonra program çalıştırılır. Sayılar bir döngü içerisinde kaydırma ve ekleme işlemleri sonucunda çarpılır ve ilgili bellek bölgesine cevap kaydedilir.

- İki tane 32 bitlik sayının çarpımı sonucunda *64 bitlik* sayı elde edilir. Kullanıcı Simple aracı ile input girerek bu sayının belirli kısımlarına ulaşabilir.
Giriş portundan *“1”* girildiğinde sonucun *en alt 16 biti*, *“4”* girildiğinde *en üst 16 biti* ve *“2”* veya *“3”* girildiğinde de *sonucun ilgili kısımları* displaye yansıtılır.








# [EN] Assembly code of the program that multiplies two 32-bit numbers (without using the MUL instruction)!

- In this assembly code, the user enters 32-bit numbers into specific memory regions. Since a 32-bit number will enter the memory area,
must enter the 16-bit parts of the number. For example, let the number be 02610842H, it should be placed in the memory area as follows:
>[0200H] -> 00261H
>[0202h] -> 00842H

- After insertion, the program is run. Numbers are multiplied as a result of shifting and adding operations in a loop, and the answer is recorded in the relevant memory area.

- As a result of multiplying two 32-bit numbers, a *64-bit* number is obtained. The user can access certain parts of this number by entering input with the Simple tool.
When *"1"* is entered from the input port, *the bottom 16 bits of the result* are reflected on the display, when *"4"* is entered, *the top 16 bits* are reflected, and when *"2"* or *"3"* is entered, *the relevant parts of the result* are reflected on the display.
