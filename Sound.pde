import ddf.minim.*;
Minim minim;
AudioSnippet mySound[];

void soundSetup()
{
  minim = new Minim(this);
  mySound = new AudioSnippet[names.length];
  for (int i = 0; i < names.length;i++) {
    mySound[i] = minim.loadSnippet("data/"+names[i]);
  }
}

void stop()
{
  for (int i = 0; i < names.length;i++) {
    mySound[i].close();
  }
  minim.stop();
  super.stop();
}