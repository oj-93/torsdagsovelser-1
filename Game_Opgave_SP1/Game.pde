import java.util.Random;

class Game
{
  private Random rnd;
  private int width;
  private int height;
  private int[][] board;
  private Keys keys;
  private int playerLife;
  private int playerLife2;
  private Dot player;
  private Dot player2;
  private Dot[] enemies;
  private Dot[] food;
  private boolean gameOverP1;
  private boolean gameOverP2;

  Game(int width, int height, int numberOfEnemies, int numberOffood)
  {
    gameOverP1=false;
    gameOverP2=false;
    if (width < 10 || height < 10)
    {
      throw new IllegalArgumentException("Width and height must be at least 10");
    }
    if (numberOfEnemies < 0)
    {
      throw new IllegalArgumentException("Number of enemies must be positive");
    } 
    this.rnd = new Random();
    this.board = new int[width][height];
    this.width = width;
    this.height = height;
    keys = new Keys();
    player = new Dot(0, 0, width-1, height-1);
    player2 = new Dot(1, 0, width-1, height-1);
    enemies = new Dot[numberOfEnemies];
    food = new Dot[numberOffood];
    for (int i = 0; i < numberOfEnemies; ++i)
      for (int j = 0; j <numberOffood; ++j)
      {
        enemies[i] = new Dot(width-1, height-1, width-1, height-1);
        food[j] = new Dot(width-1, height-1, width-1, height-1);
      }
    this.playerLife = 100;
    this.playerLife2 = 100;
  }

  public int getWidth()
  {
    return width;
  }

  public int getHeight()
  {
    return height;
  }
  //Player 1 liv
  public int getPlayerLife()
  {
    return playerLife;
  }//player 2 Liv
  public int getPlayerLife2()
  {
    return playerLife2;
  }
  public void onKeyPressed(char ch)
  {
    keys.onKeyPressed(ch);
  }

  public void onKeyReleased(char ch)
  {
    keys.onKeyReleased(ch);
  }

  public void update()
  {
    updatePlayer();
    updatePlayer2();
    updateEnemies();
    updateEnemies2();
    updateFood();
    updateFood2();
    checkForCollisions();
    checkForCollisionsP2();
    checkForFoodCollisions();
    checkForFoodCollisionsP2();
    clearBoard();
    populateBoard();
    if (gameOverP2 != false) {
      board[player2.getX()][player2.getY()] = 0;
      text("GAME OVER: PLAYER 1 GOT THE VICTORY ROYALE",width/2,height/2);
      background(255);
      fill(0);
      noLoop();
    }
    if (gameOverP1 != false) {
      board[player.getX()][player.getY()] = 0;
      text("GAME OVER: PLAYER 2 GOT THE VICTORY ROYALE",width/2,height/2);
      background(255);
      fill(0);
      noLoop();
    }
  }



  public int[][] getBoard()
  {
    //ToDo: Defensive copy?
    return board;
  }

  private void clearBoard()
  {
    for (int y = 0; y < height; ++y)
    {
      for (int x = 0; x < width; ++x)
      {
        board[x][y]=0;
      }
    }
  }
  // Player 1
  private void updatePlayer()
  {
    //Update player
    if (keys.wDown() && !keys.sDown())
    {
      player.moveUp();
    }
    if (keys.aDown() && !keys.dDown())
    {
      player.moveLeft();
    }
    if (keys.sDown() && !keys.wDown())
    {
      player.moveDown();
    }
    if (keys.dDown() && !keys.aDown())
    {
      player.moveRight();
    }
  }
  //player 2
  private void updatePlayer2()
  {
    //Update player
    if (keys.w2Down() && !keys.s2Down())
    {
      player2.moveUp();
    }
    if (keys.a2Down() && !keys.d2Down())
    {
      player2.moveLeft();
    }
    if (keys.s2Down() && !keys.w2Down())
    {
      player2.moveDown();
    }
    if (keys.d2Down() && !keys.a2Down())
    {
      player2.moveRight();
    }
  }
  private void updateEnemies()
  {
    for (int i = 0; i < enemies.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player.getX() - enemies[i].getX();
        int dy = player.getY() - enemies[i].getY();
        if (abs(dx) > abs(dy))
        {
          if (dx > 0)
          {
            //Player is to the right
            enemies[i].moveRight();
          } else
          {
            //Player is to the left
            enemies[i].moveLeft();
          }
        } else if (dy > 0)
        {
          //Player is down;
          enemies[i].moveDown();
        } else
        {//Player is up;
          enemies[i].moveUp();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          enemies[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          enemies[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          enemies[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          enemies[i].moveDown();
        }
      }
    }
  }
  //Enemies for player 2
  private void updateEnemies2()
  {
    for (int i = 0; i < enemies.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player2.getX() - enemies[i].getX();
        int dy = player2.getY() - enemies[i].getY();
        if (abs(dx) > abs(dy))
        {
          if (dx > 0)
          {
            //Player is to the right
            enemies[i].moveRight();
          } else
          {
            //Player is to the left
            enemies[i].moveLeft();
          }
        } else if (dy > 0)
        {
          //Player is down;
          enemies[i].moveDown();
        } else
        {//Player is up;
          enemies[i].moveUp();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          enemies[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          enemies[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          enemies[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          enemies[i].moveDown();
        }
      }
    }
  }
  private void updateFood()
  {
    for (int i = 0; i < food.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player.getX() - food[i].getX();
        int dy = player.getY() - food[i].getY();
        if (abs(dx) < abs(dy))
        {
          if (dx < 0)
          {
            //Player is to the right
            food[i].moveRight();
          } else
          {
            //Player is to the left
            food[i].moveLeft();
          }
        } else if (dy > 0)
        {
          //Player is down;
          food[i].moveDown();
        } else
        {//Player is up;
          food[i].moveUp();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          food[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          food[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          food[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          food[i].moveDown();
        }
      }
    }
  }
  //Food for player 2
  private void updateFood2()
  {
    for (int i = 0; i < food.length; ++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if (rnd.nextInt(3) < 2)
      {
        //We follow
        int dx = player2.getX() - food[i].getX();
        int dy = player2.getY() - food[i].getY();
        if (abs(dx) < abs(dy))
        {
          if (dx < 0)
          {
            //Player is to the right
            food[i].moveRight();
          } else
          {
            //Player is to the left
            food[i].moveLeft();
          }
        } else if (dy > 0)
        {
          //Player is down;
          food[i].moveDown();
        } else
        {//Player is up;
          food[i].moveUp();
        }
      } else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if (move == 0)
        {
          //Move right
          food[i].moveRight();
        } else if (move == 1)
        {
          //Move left
          food[i].moveLeft();
        } else if (move == 2)
        {
          //Move up
          food[i].moveUp();
        } else if (move == 3)
        {
          //Move down
          food[i].moveDown();
        }
      }
    }
  }

  private void populateBoard()
  {
    //Insert player
    board[player.getX()][player.getY()] = 1;
    board[player2.getX()][player2.getY()] = 4;

    //Insert enemies
    for (int i = 0; i < enemies.length; ++i)
    {
      board[enemies[i].getX()][enemies[i].getY()] = 2;
    }
    for (int j = 0; j < food.length; ++j)
    {
      board[food[j].getX()][food[j].getY()] = 3;
    }
  }



  private void checkForCollisions()
  {
    //Check enemy collisions
    for (int i = 0; i < enemies.length; ++i)
    {
      if (enemies[i].getX() == player.getX() && enemies[i].getY() == player.getY()&& game.getPlayerLife()>-0)
      {
        //We have a collision
        --playerLife;
        if (playerLife<=0) {
          gameOverP1=true;
        }
      }
    }
  }
  private void checkForCollisionsP2()
  {
    //Check enemy collisions
    for (int i = 0; i < enemies.length; ++i)
    {
      if (enemies[i].getX() == player2.getX() && enemies[i].getY() == player2.getY()&& game.getPlayerLife2()>-0)
      {
        //We have a collision
        --playerLife2;
        if (playerLife2<=0) {
          gameOverP2=true;
        }
      }
    }
  }
  private void checkForFoodCollisions() {
    for (int j = 0; j < enemies.length; ++j)
    {
      if (food[j].getX() == player.getX() && food[j].getY() == player.getY()&& game.getPlayerLife()<100)
      {
        ++playerLife;
        food[j].x=(int) random(width-1);
        food[j].y = (int) random(width-1);
      }
    }
  }

  private void checkForFoodCollisionsP2() {
    for (int j = 0; j < enemies.length; ++j)
    {
      if (food[j].getX() == player2.getX() && food[j].getY() == player2.getY()&& game.getPlayerLife2()<100)
      {
        ++playerLife2;
        food[j].x= (int) random(width-1);
        food[j].y = (int) random(width-1);
      }
    }
  }
}
