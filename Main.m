clear

A = [7.2, 2.81, -1.2, 1.59; -0.3, 4.84, 1.8, ...
    1.48; 2.56, -1.12, -10, -1.24; 2.31, -0.64, 0, 4.71];
B = [-11.35; -16.79; 46.53; 15.69];

A = [3, 1, 1; 1, 4, 1; 1, 1, 3];
B = [5; 6; 5];

epsilon = 0.1;
licznik_iteracji = 0;

% Warunek zbierzności

G = -A;
for licznik = 1:size(A, 1)
    G(licznik, licznik) = 0;
    G(licznik, :)  = G(licznik, :) ./ A(licznik, licznik);
     Cr(licznik) = B(licznik) ./ A(licznik, licznik);
    
    if sum(abs(G(licznik, :)), 2) < 1
        disp("Warunek zbierznosci zostal spelniony");
    else
        disp("Warunek zbierznosci nie zostal spelniony");
        break;
    end
end
Xarch = Cr;

while   true
licznik_iteracji = licznik_iteracji + 1;

disp(Xarch);
disp(Cr);

for licznik = 1:size(A, 1)
    X(licznik, 1) = G(licznik, :) * Xarch(:) + Cr(licznik);
end

if abs(X(licznik, 1) - Xarch(licznik)) < epsilon
    disp("Warunek zostal spelniony");
    break
else
    disp("Warunek nie zostal spelniony");
end

Xarch = X;
X_dokladne = round(X + epsilon);
Y = A^-1 * B;
end

disp(X_dokladne);
disp(Y);
if isequal(X_dokladne, Y)
    disp("Znalezione rozwiazanie jest poprawne");
else
    disp("Wyniki się nie pokrywają");
end