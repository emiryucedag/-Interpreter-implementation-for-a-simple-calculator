# Hazırlayan: 
  Emir Yücedağ
  221101077


# Basit Hesap Makinesi (Lex & Yacc ile)

Bu proje, Lex ve Yacc kullanarak temel dört işlem (toplama, çıkarma, çarpma, bölme) ve üstel alma işlemini yapan basit bir hesap makinesi uygulamasıdır. Parantezli ifadeleri ve ondalıklı (float) sayıları da destekler.

## 🚀 Özellikler
- Toplama, çıkarma, çarpma, bölme
- Üstel alma: `**` veya `^`
- Float (ondalıklı sayı) desteği: Örneğin `3.14 + 2.5`
- Parantezli işlemler: `(3 + 5) * 2`
- Hatalı girişler için hata mesajı (örneğin `5 / 0`)
- Test ifadeleri kolayca girilebilir
- Ctrl + D ile çıkış yapılabilir

## 🛠️ Kurulum ve Derleme Adımları (Ubuntu / WSL)
```bash
sudo apt update
sudo apt install flex bison gcc -y
bison -d calculator.y
flex calculator.l
gcc -o calculator lex.yy.c calculator.tab.c -lm
./calculator


💻 Örnek Test Girdileri
3 + 5
10 * (2 + 1)
4 / 2
(3 + 2) * (1 + 1)
2 ** 3
5.5 + 4.2
