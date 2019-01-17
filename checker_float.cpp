#include<bits/stdc++.h>
#define FILE "main"
using namespace std;

const double EPS = 1e-6;

void EXIT(double result, string comment)
{
	cout << result << '\n' << comment << '\n';
}

main()
{

	ifstream in(FILE".in");  
	ifstream out(FILE".out");
	ifstream ore(FILE".ore");

	double c, d;

	out >> c;

	ore >> d;
	
	double diff = fabs(c - d);
	if (diff <= EPS)
		EXIT(1, "Ket qua dung");
	else
		EXIT(0, "Ket qua sai");
}
