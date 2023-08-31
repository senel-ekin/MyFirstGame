void mousePressed(){
  //Start tuşuna basmak için
  if((mouseX > 536) && (mouseX < 763) && (mouseY > 421) &&
  (mouseY < 500)&&(durum==0)){
    durum = 1;
  }
  //Atla tuşuna basmak için
  if((mouseX > 980) && (mouseX < 1160) && (mouseY > 730) &&
  (mouseY < 810)&&(durum==1)){
    durum = 2;
  }
}

void keyPressed(){
  yuru =! yuru;
  if(keyCode == LEFT){
    Kx = Kx - 20;
    Px = Px - 20;
  }
    
  if(keyCode == RIGHT){
    Kx = Kx + 20;
    Px = Px + 20;
  }
    
  if(keyCode == ' '){
    if(zipla){
      vy = -23;
      zipla = false;
    }
  }
  if(keyCode == DOWN)
    egilme = true;
  
  if(seviyeK == 3 || seviyeP ==3){
    if(keyCode == SHIFT){
      sahne = 0;
      Kx = 1000;
      Px = 1000;
    }
  }
  
  if(seviyeK == 4 || seviyeP ==4){
    if(keyCode == UP){
      kilicX = Kx + 150;
      kilicY = Ky - 250;
      saldiri = true;
    }
  }
  
}
void keyReleased(){
  if(keyCode == DOWN)
    egilme = false;
}
