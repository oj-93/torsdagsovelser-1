class Keys
{
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  private boolean w2Down = false;
  private boolean a2Down = false;
  private boolean s2Down = false;
  private boolean d2Down = false;

  public Keys() {
  }

  public boolean wDown()
  {
    return wDown;
  }

  public boolean aDown()
  {
    return aDown;
  }

  public boolean sDown()
  {
    return sDown;
  }

  public boolean dDown()
  {
    return dDown;
  }

  public boolean w2Down()
  {
    return w2Down;
  }

  public boolean a2Down()
  {
    return a2Down;
  }

  public boolean s2Down()
  {
    return s2Down;
  }

  public boolean d2Down()
  {
    return d2Down;
  }



  void onKeyPressed(char ch)
  {
    if (ch == CODED) {
      if (keyCode == UP) {
        w2Down = true;
      } else if (keyCode == DOWN) {
        s2Down = true;
      } else if (keyCode == LEFT) {
        a2Down = true;
      } else if (keyCode == RIGHT) {
        d2Down = true;
      }
    } else {
      if (ch == 'W' || ch == 'w')
      {
        wDown = true;
      } else if (ch == 'A' || ch == 'a')
      {
        aDown = true;
      } else if (ch == 'S' || ch == 's')
      {
        sDown = true;
      } else if (ch == 'D' || ch == 'd')
      {
        dDown = true;
      }
    }
  }


  void onKeyReleased(char ch)
  {
    if (ch == CODED) {
      if (keyCode == UP) {
        w2Down = false;
      } else if (keyCode == DOWN) {
        s2Down = false;
      } else if (keyCode == LEFT) {
        a2Down = false;
      } else if (keyCode == RIGHT) {
        d2Down = false;
      }
    } else {

      if (ch == 'W' || ch == 'w')
      {
        wDown = false;
      } else if (ch == 'A' || ch == 'a')
      {
        aDown = false;
      } else if (ch == 'S' || ch == 's')
      {
        sDown = false;
      } else if (ch == 'D' || ch == 'd')
      {
        dDown = false;
      }
    }
  }
}
