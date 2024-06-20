#include <iostream>
#include <math.h>
#include <windows.h>
using namespace std;
extern "C" float asfun(int x, int k, int n);

extern "C" float func(int x, int k)
{
    float f;
    f = pow(x, (-k)) / tgamma(k+1) * cos(x);
    return f;
}

int main()
{

    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    int n;
    int x;
    cout << "Введите значение x: ";
    cin >> x;
    cout << "Введите значение n, не меньше 2 и не больше 8: ";
    cin >> n;

    float f;
    for (int k = 1; k < n; k++)
    {
        f = asfun(x, k, n);
    }
    cout << f;

    return 0;

}
