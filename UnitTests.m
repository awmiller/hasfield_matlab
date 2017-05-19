%% Test Cases
clear('a','b','c','d');
% non-struct case
a = 0

% basic case, 1 iteration
b.a = 1

% basic case, multiple options
c.a = 1;
c.b = 2;
c.c = 3;
c.d = 4

% multilevel case
d.a = 1;

d.b.a = 1;
d.b.b = 2;
d.b.c = 3;
d.b.d = 4;

d.c.a = 1;
d.c.b = 2;
d.c.c = 3;
d.c.d.a = 1;
d.c.d.b.waldo = 'where?'

%% Soft error on non-struct
assert(hasfield(a)==0)

%% Test cases where result should be equal to isfield()
assert(hasfield(b,'a') == isfield(b,'a'))
assert(hasfield(b,'b') == isfield(b,'b'))
assert(hasfield(c,'b') == isfield(c,'b'))
assert(hasfield(c,'e') == isfield(c,'e'))

%% Multilevel feature tests
assert(hasfield(d,'waldo')==1)

[x,L] = hasfield(d,'d')
assert(x==1 && L==2)

[x,L] = hasfield(d,'waldo')
assert(x==1 && L==4)

