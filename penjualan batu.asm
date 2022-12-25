.model large
.code
org 100h

start:
    jmp mulai
nohp        db 13,10,'Masukkan Nomor Telepon : $'
password    db 13,10,'Masukkan Password      : $'
lanjut      db 13,10,'LANJUT (tekan y untuk lanjut) >> $'
alamat      db 13,10,'Masukkan Alamat Pengiriman : $'

tampung_nohp        db 30,?,30 dup(?)
tampung_password    db 13,?,13 dup(?)
tampung_alamat      db 30,?,30 dup(?)

a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
g db 07
h db 08
i db 09
j dw 15

daftar  db 13,10,'+-------------------------------------------+'
        db 13,10,'|              JENIS BATU AKIK              |'
        db 13,10,'+------+------------------+-----------------+'
        db 13,10,'| KODE |  NAMA BATU AKIK  |      HARGA      |'
        db 13,10,'+------+------------------+-----------------+'
        db 13,10,'|  01  | BACAN HIJAU      | Rp.  2.150.000  |'
        db 13,10,'+------+------------------+-----------------+'
        db 13,10,'|  02  | SULAIMAN         | Rp.  2.250.000  |'
        db 13,10,'+------+------------------+-----------------+'
        db 13,10,'|  03  | SAFIR            | Rp.  2.800.000  |'
        db 13,10,'+------+------------------+-----------------+'
        db 13,10,'|  04  | ZAMRUD           | Rp.  3.582.000  |'
        db 13,10,'+------+------------------+-----------------+'
        db 13,10,'|  05  | TOPAS            | Rp.  1.234.000  |'
        db 13,10,'+------+------------------+-----------------+','$'
        
daftar2 db 13,10,'+-------------------------------------------+'
        db 13,10,'|              JENIS BATU AKIK              |'
        db 13,10,'+------+------------------+-----------------+'
        db 13,10,'| KODE |  NAMA BATU AKIK  |      HARGA      |'
        db 13,10,'+------+------------------+-----------------+'
        db 13,10,'|  06  | KALIMAYA         | Rp.  1.800.000  |'
        db 13,10,'+------+------------------+-----------------+'
        db 13,10,'|  07  | KALIMANTAN       | Rp.  2.100.000  |'
        db 13,10,'+------+------------------+-----------------+'
        db 13,10,'|  08  | KALSEDON         | Rp.    664.000  |'
        db 13,10,'+------+------------------+-----------------+'
        db 13,10,'|  09  | SUNGAI DAREH     | Rp.    900.000  |'
        db 13,10,'+------+------------------+-----------------+'
        db 13,10,'|  10  | GAMBAR           | Rp.    750.000  |'
        db 13,10,'+------+------------------+-----------------+','$'
        
        
error   db 13,10,'KODE YANG ANDA MASUKKAN TIDAK VALID $'
pilih   db 13,10,'SILAHKAN MASUKKAN KODE/NO BATU AKIK : $'
succses db 13,10,'Pesanan Anda Akan Kami Proses'
        db 13,10,'Terima Kasih Sudah Berbelanja Di Aplikasi'
        db 13,10,'           PENJUALAN BATU AKIK           ','$'            

    mulai:
    mov ah,09h
    lea dx,nohp
    int 21h
    mov ah,0ah
    lea dx, tampung_nohp
    int 21h
    push dx
    
    mov ah,09h
    lea dx,password
    int 21h
    mov ah,0ah
    lea dx, tampung_password
    int 21h
    push dx                 
    
    mov ah,09h
    mov dx,offset daftar
    int 21h
    mov ah,09h
    mov dx,offset lanjut
    int 21h
    mov ah,01h
    int 21h
    cmp al,'y'
    je option2
    jne error_psn
    
option2:
    mov ah,09h
    mov dx,offset daftar2
    int 21h
    mov ah,09h
    mov dx,offset lanjut
    int 21h
    mov ah,01h
    int 21h
    cmp al,'y'
    jmp proses
    jne error_psn
       
     
error_psn:
    mov ah,09h
    mov dx,offset error
    int 21h
    int 20h
    
proses:
    mov ah,09h
    mov dx,offset pilih
    int 21h
    
    mov ah,1
    int 21h
    mov bh,al
    mov ah,1
    int 21h
    mov bl,al
    cmp bh,'0'
    cmp bl,'1'
    je hasil1
    
    cmp bh,'0'
    cmp bl,'2'
    je hasil2
    
    cmp bh,'0'
    cmp bl,'3'
    je hasil3
    
    cmp bh,'0'
    cmp bl,'4'
    je hasil4
    
    cmp bh,'0'
    cmp bl,'5'
    je hasil5
             
    cmp bh,'0'
    cmp bl,'6'
    je hasil6
    
    cmp bh,'0'
    cmp bl,'7'
    je hasil7
    
    cmp bh,'0'
    cmp bl,'8'
    je hasil8
    
    cmp bh,'0'
    cmp bl,'9'
    je hasil9
    
    cmp bh,'1'
    cmp bl,'0'
    je hasil10
    
    jne error_psn 
    
;------------------------------------
    
hasil1:
    mov ah,09h
    lea dx,teks1
    int 21h
    mov ah,09h
    lea dx,alamat
    int 21h
    mov ah,0ah
    lea dx,tampung_alamat
    int 21h
    push dx
    mov ah,09h
    lea dx,succses
    int 21h
    int 20h
    
hasil2:
    mov ah,09h
    lea dx,teks2
    int 21h
    mov ah,09h
    lea dx,alamat
    int 21h
    mov ah,0ah
    lea dx,tampung_alamat
    int 21h
    push dx
    mov ah,09h
    lea dx,succses
    int 21h
    int 20h
    
hasil3:
    mov ah,09h
    lea dx,teks3
    int 21h
    mov ah,09h
    lea dx,alamat
    int 21h
    mov ah,0ah
    lea dx,tampung_alamat
    int 21h
    push dx
    mov ah,09h
    lea dx,succses
    int 21h
    int 20h
    
hasil4:
    mov ah,09h
    lea dx,teks4
    int 21h
    mov ah,09h
    lea dx,alamat
    int 21h
    mov ah,0ah
    lea dx,tampung_alamat
    int 21h
    push dx
    mov ah,09h
    lea dx,succses
    int 21h
    int 20h
    
hasil5:
    mov ah,09h
    lea dx,teks5
    int 21h
    mov ah,09h
    lea dx,alamat
    int 21h
    mov ah,0ah
    lea dx,tampung_alamat
    int 21h
    push dx
    mov ah,09h
    lea dx,succses
    int 21h
    int 20h 
    
hasil6:
    mov ah,09h
    lea dx,teks6
    int 21h
    mov ah,09h
    lea dx,alamat
    int 21h
    mov ah,0ah
    lea dx,tampung_alamat
    int 21h
    push dx
    mov ah,09h
    lea dx,succses
    int 21h
    int 20h
    
hasil7:
    mov ah,09h
    lea dx,teks7
    int 21h  
    mov ah,09h
    lea dx,alamat
    int 21h
    mov ah,0ah
    lea dx,tampung_alamat
    int 21h
    push dx
    mov ah,09h
    lea dx,succses
    int 21h
    int 20h
    
hasil8:
    mov ah,09h
    lea dx,teks8
    int 21h  
    mov ah,09h
    lea dx,alamat
    int 21h
    mov ah,0ah
    lea dx,tampung_alamat
    int 21h
    push dx
    mov ah,09h
    lea dx,succses
    int 21h
    int 20h
    
hasil9:
    mov ah,09h
    lea dx,teks9
    int 21h        
    mov ah,09h
    lea dx,alamat
    int 21h
    mov ah,0ah
    lea dx,tampung_alamat
    int 21h
    push dx
    mov ah,09h
    lea dx,succses
    int 21h
    int 20h
    
hasil10:
    mov ah,09h
    lea dx,teks10
    int 21h
    mov ah,09h
    lea dx,alamat
    int 21h
    mov ah,0ah
    lea dx,tampung_alamat
    int 21h
    push dx
    mov ah,09h
    lea dx,succses
    int 21h
    int 20h
    
;------------------------------------------------------    
    
teks1   db 13,10,' '
        db 13,10,'Anda Memilih Batu Akik Bacan Hijau'
        db 13,10,'Dengan Harga Rp.  2.150.000 $'
        
teks2   db 13,10,' '
        db 13,10,'Anda Memilih Batu Akik Sulaiman'
        db 13,10,'Dengan Harga Rp.  2.250.000 $'

teks3   db 13,10,' '
        db 13,10,'Anda Memilih Batu Akik Safir'
        db 13,10,'Dengan Harga Rp.  2.800.000 $' 
        
teks4   db 13,10,' '
        db 13,10,'Anda Memilih Batu Akik Zamrud'
        db 13,10,'Dengan Harga Rp.  3.582.000 $'
        
teks5   db 13,10,' '
        db 13,10,'Anda Memilih Batu Akik Topas'
        db 13,10,'Dengan Harga Rp.  1.234.000 $'
        
teks6   db 13,10,' '
        db 13,10,'Anda Memilih Batu Akik Kalimaya'
        db 13,10,'Dengan Harga Rp.  1.800.000 $'
        
teks7   db 13,10,' '
        db 13,10,'Anda Memilih Batu Akik Kalimantan'
        db 13,10,'Dengan Harga Rp.  2.100.000 $'
        
teks8   db 13,10,' '
        db 13,10,'Anda Memilih Batu Akik Kalsedon'
        db 13,10,'Dengan Harga Rp.  664.000 $'
        
teks9   db 13,10,' '
        db 13,10,'Anda Memilih Batu Akik Sungai Dareh'
        db 13,10,'Dengan Harga Rp.  900.000 $'
        
teks10  db 13,10,' '
        db 13,10,'Anda Memilih Batu Akik Gambar'
        db 13,10,'Dengan Harga Rp.  750.000 $'
        
end start                                                                                                 