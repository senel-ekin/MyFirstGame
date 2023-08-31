void setup(){
  size(1300,900);
  font = loadFont("TimesNewRomanPS-ItalicMT-48.vlw");
  font2 = loadFont("Arial-BoldMT-48.vlw");
  Baslangic = loadImage("Baslangic.png");
  tanitim = loadImage("tanitim.png");
  kahraman1 = loadImage("kahraman1.png");
  kahraman2 = loadImage("kahraman2.png");
  karakter1 = loadImage("karakter1.png");
  karakter2 = loadImage("karakter2.png");
  karakter1secimi = loadImage("karakter1secimi.png");
  karakter2secimi = loadImage("karakter2secimi.png");
  parildama = loadImage("parildama.png");
  zemin = loadImage("zemin.png");
  kaktus = loadImage("kaktus.png");
  buyukBulut = loadImage("buyukBulut.png");
  bulut = loadImage("bulut.png");
  kahraman1egilme = loadImage("kahraman1egilme.png");
  can = loadImage("can.png");
  gameover = loadImage("OVER.png");
  for(int i = 0; i < 3; i++)
    dusman[i] = loadImage("dusman" + i + ".png");
  yol = loadImage("yol.png");
  for(int j = 0; j < 3; j++)
    yay[j] = loadImage("yay" + j + ".png");
  seviye3 = loadImage("seviye3.png");
  door = loadImage("door.png");
  seviye4 = loadImage("seviye4.png");
  kilic = loadImage("kilic.png");
  
  prenses1 = loadImage("prenses1.png");
  prenses2 = loadImage("prenses2.png");
  prenses1egilme = loadImage("prenses1egilme.png");
  
  win = loadImage("win.png");
  
  for(int k = 0; k < 4; k++)
    level[k] = loadImage("level" + k + ".png");
}
