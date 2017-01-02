with JD.Sortowanie;use JD.Sortowanie;
with Ada.Text_IO; use Ada.Text_IO;

procedure main is    
    z:access zad_S;
    tab: Tablica(1..20);
    tab_p: TabPtr;        
begin
    tab := (9,8,7,6,5,4,8,6,8,6,11,6,8,9,7,3,1,8,9,22);
    tab_p := new Tablica'(tab);
    z := new zad_S;
    z.Quicksort(tab_p,1,20);
    z.Show(1,20);
    z.EndThread;   
end main;
 
