with Ada.Text_IO; use Ada.Text_IO;
package body JD.Sortowanie is    
    
    function Split(tab: in out TabPtr; L: in Integer; R: in Integer) return Integer is
        t,ap,i,wp: Integer;   
    begin    
        i := L + ((R-L) / 2); 
        wp := tab(i);        
        t := tab(i);
        tab(i) := tab(R);
        tab(R) := t;
        ap := L;
        for j in L..(R-1)
        loop
            if tab(j) < wp then
                t := tab(j);
                tab(j) := tab(ap);
                tab(ap) := t;
                ap := ap + 1;
            end if;
        end loop;        
        t := tab(ap);
        tab(ap) := tab(R);
        tab(R) := t;        
        return ap;        
    end Split; 
    
    task body zad_S is        
        tab: TabPtr;
        i,l_t,r_t,b,e: Integer;
        z1,z2: Access Szad_S;        
    begin 
        loop
            select
                accept Quicksort(tab_t: in out TabPtr; L: in Integer; R: in Integer) do
                    l_t := L;
                    r_t := R;
                    tab := tab_t;
                end Quicksort;
                if l_t < r_t then
                    i := Split(tab,l_t,r_t);                     
                    z1 := new Szad_S;
                    z2 := new Szad_S;                    
                    z1.Quicksort(tab,l_t,i-1);                    
                    z2.Quicksort(tab,i+1,r_t); 
                    z1.EndThread;
                    z2.EndThread;
                end if;    
            or
                accept Show(L: in Integer; R: in Integer) do
                    b := L;
                    e := R;                    
                end Show;
                for k in b..e
                    loop
                        Put(Integer'Image(Integer(tab(k))));                         
                end loop;  
                put_line(" ");    
            or
                accept EndThread;
                exit;            
            end select;        
        end loop;        
    end zad_S;
    
end JD.Sortowanie; 
 