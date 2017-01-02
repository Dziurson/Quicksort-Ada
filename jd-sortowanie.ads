package JD.Sortowanie is
    
    type Tablica is array(Positive range <>) of Integer;
    type TabPtr is access Tablica;    
    
    task type zad_S is 
        entry Quicksort(tab_t: in out TabPtr; L: in Integer; R: in Integer);        
        entry EndThread;
        entry Show(L: in Integer; R: in Integer);
    end zad_S;   

subtype Szad_S is zad_S;

end JD.Sortowanie; 
 
