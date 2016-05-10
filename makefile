all: shell

bison.tab.c: carvalho.y
		bison -d carvalho.y

lex.yy.c: carvalho.lex 
		flex carvalho.lex

shell: lex.yy.c bison.tab.c  carvalho.tab.h
		gcc carvalho.tab.c lex.yy.c -ll -o ShellFish

clean:
		rm -rf ShellFish carvalho.tab.c lex.yy.c carvalho.tab.h