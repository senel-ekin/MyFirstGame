//Yazılar için
PFont font,font2;
int yaziY = 900;
int yaziY2 = 1000;
int yaziY3 = 1100;
int yaziY4 = 1200;
int yaziY5 = 1300;
int yaziY6 = 1400;

int seviyeK = 0; //Kahraman için seviyeler
int seviyeP = 0; //Prenses için seviyeler
int durum,prensesDurum,kahramanDurum,karakterSecimi,sahne = 0;
float karakterBulundu = 0;
float ipucu, ipucu2 = 0;
float yercekimi = 1;
float vy = 0;
int puan = 0;
float b = 55; // değirmen
float c = 60;
int sayac = 5;
int sY = 110; //sayac y değeri
boolean dur = false;
//düşmanlar için
float enemySpeed = 4;
float enemySpeed2 = 4;
float enemySpeed3 = 1.8;
float dX = 0;
float dY = 650;
float d2Y = 650;
float d2X = 1500;
float d3X = 520;
float d3Y = 400;
//yaylar için
float yayX = 650; //başta alınan yay
float yaySpeed = 20;
float yay0X = -5;
float yay0Y = 650;
float yay1X = 5;
float yay1Y = 650;
float yay2X = 0;
float yay2Y = 700;
boolean ilerlemeYay = false;
boolean ilerlemeYay2 = false;
boolean ilerlemeYay3 = false;
//kılıç için
float kilicX = 280;
float kilicY = 700;
//Seviye4 düşman
float medusaX = 1000;
float medusaY = 400;
int artma = 3;
boolean saldiri = false;
boolean donus = false;
int medusaHealthy = 400;

boolean yuru,zipla,egilme = false;

//seviye tanıtım ekranları için
boolean levelTanitim1 = false;
boolean levelTanitim2 = false;
boolean levelTanitim3 = false;
boolean levelTanitim4 = false;

PImage[] dusman = new PImage[3];
PImage[] yay = new PImage[3];
PImage [] level = new PImage[4];
PImage Baslangic,tanitim,parildama,zemin,kaktus,buyukBulut,bulut,can,gameover,yol,seviye3,door,seviye4,kilic,win;
float kaktusX = 700;
float kaktusY = 690;
float Bhiz,hiz = 0;
//Kahraman için veriler
PImage kahraman1,kahraman2,karakter1,karakter1secimi,kahraman1egilme;
int Kx = 150;
int Ky = 800;
//Prenses için veriler
PImage prenses1,prenses2,karakter2,karakter2secimi,prenses1egilme;
int Px = 150;
int Py = 800;
