/*
Copyright (c) 2012 Sergey Borisov AKA risik - http://risik.info,
Tomsk State University of Control Systems and Radioelectronics (TUSUR) -
http://tusur.ru

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

%{
#include "dprint.h"
%}

DIGIT	[0-9]
UINT	{DIGIT}+
NUMSIGN	[+-]?
INTNUMBER	{NUMSIGN}{UINT}

%%

{INTNUMBER}		{
				unsigned int val = atoi(yytext);
				DPRINTF("INTNUMBER %d found", val);
			}

[ \t]+			{}

\n			{
				DPRINT("CR found");
			}

\+			{
				DPRINT("PLUSOP found");
			}

\-			{
				DPRINT("MINUSOP found");
			}

\*			{
				DPRINT("MULTOP found");
			}

\/			{
				DPRINT("DIVOP found");
			}

\(			{
				DPRINT("LBRACKET found");
			}

\)			{
				DPRINT("RBRACKET found");
			}

\/\*(.|\n)*\*\/		{
				DPRINT("MULTILINE COMMENT skipped");
			}

\/\/.*\n		{
				DPRINT("SINGLE COMMENT skipped");
			}

%%

int yywrap()
{
	return 1;
}
