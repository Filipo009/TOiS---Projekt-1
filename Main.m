clear

A = [3, 1, 1; 1, 4, 1; 1, 1, 3];
B = [5; 6; 5];

A = [ 7.2,   2.81, -1.2,  1.59;
     -0.3,   4.84,  1.8,  1.48;
      2.56, -1.12, -10,  -1.24;
      2.31, -0.64,  0,    4.71
    ];

B = [-11.35;
     -16.79;
      46.53;
      15.69
    ];

epsilon = 0.01;
licznik_iteracji = 0;

% Warunek zbierzności

G = -A;
sz = size(B)
Cr = zeros([1,sz])

for licznik = 1:size(A, 1)
    G(licznik, licznik) = 0;
    G(licznik, :) = G(licznik, :) ./ A(licznik, licznik);
    Cr(licznik) = B(licznik) ./ A(licznik, licznik);
    
    if sum(abs(G(licznik, :)), 2) < 1
        disp("Warunek zbieznosci zostal spelniony");

    else
        disp("Warunek zbieznosci nie zostal spelniony");
        pause
        break;
    end
end
Xarch = Cr
G

X = zeros([sz, 1]);
while true
    licznik_iteracji = licznik_iteracji + 1;
    
    %disp(Xarch);
    %disp(Cr);
    for licznik = 1:size(A, 1)
        X(licznik) = G(licznik, :) * Xarch(:) + Cr(licznik);
    end
    
    if abs(X(licznik) - Xarch(licznik)) < epsilon
        disp("Blad obliczen w granicach podanego epsilona");
        break
    else
        disp("Blad obliczen wyzszy niz podany epsilon");
    end
    
    Xarch = X;
    X_dokladne = round(X + epsilon);
    Y = A^-1 * B;
end

for licznik = 1:size(A,1)
    if abs(X(licznik) - Y(licznik)) <= epsilon
        text1 = ['Wartosc macierzy wynikow w wierszu nr ', num2str(licznik), ' jest poprawne'];
        disp(text1);
    else
        disp("roznica wynikow wieksza od podanego epsilonu")
    end
end

text2 = ['Wyniki otrzymano po ', num2str(licznik_iteracji), ' iteracjach.'];
disp(text2);
disp('Macierz wynikow obliczen:');
disp(X);
disp('Macierz wynikow dokladnych:')
disp(Y);
