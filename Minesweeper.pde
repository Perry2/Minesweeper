

import de.bezier.guido.*;
//Declare and initialize NUM_ROWS and NUM_COLS = 20
public final static int NUM_ROWS = 20;
public final static int NUM_COLS = 20; 
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> bombs = new ArrayList <MSButton>(); //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    buttons = new MSButton[NUM_ROWS][NUM_COLS];
    for(int i = 0; i < buttons.length; i++){
        for(int a = 0; a < buttons[i].length; a++){
            buttons[i][a] = new MSButton(i,a);
        }
    }
    //your code to initialize buttons goes here
    
    
    
    setBombs();
}
public void setBombs()
{
    //your code
    for(int i = 0; i < 100; i++){
        int brow = (int)(Math.random()*20);
        int bcol = (int)(Math.random()*20);
        if(!bombs.contains(buttons[brow][bcol]))
            bombs.add(buttons[brow][bcol]);
    }
}

public void draw ()
{
    background( 0 );
    if(isWon())
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    return false;
}
public void displayLosingMessage()
{
    //your code here
}
public void displayWinningMessage()
{
    //your code here
}

public class MSButton
{
    private int r, c;
    private float x,y, width, height;
    private boolean clicked, marked;
    private String label;
    
    public MSButton ( int rr, int cc )
    {
         width = 400/NUM_COLS;
         height = 400/NUM_ROWS;
        r = rr;
        c = cc; 
        x = c*width;
        y = r*height;
        label = "";
        marked = clicked = false;
        Interactive.add( this ); // register it with the manager
    }
    public boolean isMarked()
    {
        return marked;
    }
    public boolean isClicked()
    {
        return clicked;
    }
    // called by manager
    
    public void mousePressed () 
    {
        clicked = true;
        //your code here
        /*if(mouseButton == RIGHT)
            marked = true || false;
            if(marked == false)
                clicked = false;
        else if(bombs.contains(this))  
            displayLosingMessage();
        else if(countBombs(pmouseX,pmouseY) > 0)
            setLabel(""+countBombs(pmouseX,pmouseY));
        else
            if(isValid(r-1,c)){
                if(buttons[r-1][c].isMarked())
                    r++;
            }
            buttons[r-1][c].mousePressed();
            */
    }

    public void draw () 
    {    
        if (marked)
            fill(0);
         else if( clicked && bombs.contains(this) ) 
            fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(label,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        label = newLabel;
    }
    public boolean isValid(int row, int col)
    {
        //your code here
        if(row >= 0 && row < NUM_ROWS && col >= 0 && col < NUM_COLS)
            return true;
        return false;
    }
    public int countBombs(int row, int col)
    {
        int numBombs = 0;
        for (int i = row - 1; i <= row + 1; i++) {
            for(int a = col - 1; i <= col + 1; a++){
                if(isValid(i,a) == true)
                    if(bombs.contains(buttons[i][a]))
                        numBombs++;
            }
        }
        return numBombs;
    }
}



